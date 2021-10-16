package com.project;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.naming.spi.DirStateFactory.Result;
import javax.sql.DataSource;

import org.apache.catalina.manager.DummyProxySession;

public class DaoEvent {

	private static  DataSource dataSource;

	public DaoEvent(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public List<Event> getEvents() throws Exception {

		List<Event> events = new ArrayList<>();

		Connection myCn = null;
		Statement mySm = null;
		ResultSet myRs = null;

		try {

			// Get a connection
			myCn = dataSource.getConnection();

			// Create sql statement
			String sql = "select * from event";
			mySm = myCn.createStatement();

			// Execute query
			myRs = mySm.executeQuery(sql);

			// Process result
			while (myRs.next()) {

				// Retrieve data from result set row
				int eventId = myRs.getInt("event_id");
				String eventName = myRs.getString("event_name");
				String eventType = myRs.getString("event_type");
				String eventCategory = myRs.getString("event_category");
				String venue = myRs.getString("venue");
				String eventDate = myRs.getString("event_date");
				String eventTime = myRs.getString("event_time");
				String registrationFees = myRs.getString("registration_fees");
				String registrationForm = myRs.getString("registration_form");
				String description = myRs.getString("description");

				// Create a new episode
				Event tempEvent = new Event(eventId, eventName, eventType, eventCategory, venue, eventDate, eventTime,
						registrationFees, registrationForm, description);

				// Add to the list of episodes
				events.add(tempEvent);

			}

			return events;
		} finally {
			// Close JDBC Connections
			close(myCn, mySm, myRs);

		}

	}

	// Puts back in the connection pool
	private static void close(Connection myCn, Statement mySm, ResultSet myRs) {
		// TODO Auto-generated method stub
		try {
			if (myRs != null) {
				myRs.close();
			}
			if (myCn != null) {
				myCn.close();
			}
			if (mySm != null) {
				mySm.close();
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}
	public static void addEvent(Event newEvent) throws Exception {
		// TODO Auto-generated method stub

		Connection myCn = null;
		PreparedStatement mySt = null;
		try {

			// get db connection
			myCn = dataSource.getConnection();

			// create sql for insert
			String sql = "INSERT INTO Event(event_name,event_type,event_category,venue,event_date,event_time,registration_fees,registration_form,description) VALUES(?,?,?,?,?,?,?,?,?)";

			mySt = myCn.prepareStatement(sql);
			// set the param values for the event

			mySt.setString(1, newEvent.getEventName());
			mySt.setString(2, newEvent.getEventType());
			mySt.setString(3, newEvent.getEventCategory());
			mySt.setString(4, newEvent.getVenue());
			String startDate=newEvent.getEventDate();
	        SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy"); 
	        java.util.Date date = sdf1.parse(startDate); // Returns a Date format object with the pattern
	        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
			mySt.setDate(5, sqlDate);
			mySt.setTime(6, java.sql.Time.valueOf(newEvent.getEventTime()));
			mySt.setInt(7, Integer.parseInt(newEvent.getRegistrationFees()));
			mySt.setString(8, newEvent.getRegistrationForm());
			mySt.setString(9, newEvent.getDescription());
			
		

			// execute sql insert
			mySt.execute();

		}
		// clean up jdbc objects
		finally {
			close(myCn, mySt, null);
		}

	}
}