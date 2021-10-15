package com.project;

import java.sql.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.naming.spi.DirStateFactory.Result;
import javax.sql.DataSource;

import org.apache.catalina.manager.DummyProxySession;

public class DaoEvent {

	private DataSource dataSource;

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
				String eventCatagory = myRs.getString("event_category");
				String venue = myRs.getString("venue");
				String eventDate = myRs.getString("event_date");
				String eventTime = myRs.getString("event_time");
				String registrationFees = myRs.getString("registration_fees");
				String registrationForm = myRs.getString("registration_form");
				String description = myRs.getString("description");

				// Create a new episode
				Event tempEvent = new Event(eventId, eventName, eventType, eventCatagory, venue, eventDate, eventTime,
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

	public boolean deleteGivenEvent(int eventID) {
		boolean flag = false;

		Connection myCn = null;
		Statement mySm = null;
		ResultSet myRs = null;
		PreparedStatement myPrSm = null;

		try {

			// Get a connection
			myCn = dataSource.getConnection();

			// Create sql statement
			String sql = "DELETE FROM event WHERE event_id=?";
			myPrSm = myCn.prepareStatement(sql);

			// Execute query
			myPrSm.setInt(1, eventID);

			myPrSm.executeUpdate();
			flag = true;

			// Process result

		} catch (Exception e) {
			// TODO: handle exception
			flag = false;
			e.printStackTrace();
		} finally {
			return flag;
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
}
