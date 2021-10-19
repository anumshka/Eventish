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

	private static DataSource dataSource;

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
			String startDate = newEvent.getEventDate();
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

	public static Event getEvent(String epid) throws Exception {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
				Event temp = null;

				Connection myCn = null;
				PreparedStatement myst = null;
				ResultSet myRs = null;

				int epidInt;

				try {

					// convert id to int
					epidInt = Integer.parseInt(epid);

					// get connection to database
					myCn = dataSource.getConnection();

					// create sql to get selected student
					String sql = "select * from event where event_id = ?";

					// create prepared statement
					myst = myCn.prepareStatement(sql);

					// set params
					myst.setInt(1, epidInt);

					// execute statement
					myRs = myst.executeQuery();

					// retrieve data from result set row
					if (myRs.next()) {
						// Retrieve data from result set row
				
						String eventName = myRs.getString("event_name");
						String eventType = myRs.getString("event_type");
						String eventCategory = myRs.getString("event_category");
						String venue = myRs.getString("venue");
						String eventDate = myRs.getString("event_date");
						String eventTime = myRs.getString("event_time");
						String registrationFees = myRs.getString("registration_fees");
						String registrationForm = myRs.getString("registration_form");
						String description = myRs.getString("description");

						// Create a new event
						temp = new Event(epidInt, eventName, eventType, eventCategory, venue, eventDate, eventTime,
								registrationFees, registrationForm, description);

					} else {
						throw new Exception("Could not find !!");
					}

					System.out.println(epidInt);
					return temp;
				}
				     finally {
					// clean up jdbc objects

					close(myCn, myst, myRs);
				}

	}

	public static void updateEvent(Event newEvent) throws Exception {
		// TODO Auto-generated method stub
		Connection myCn = null;
		PreparedStatement mySt = null;
		try {

			// get db connection
			myCn = dataSource.getConnection();

			// create sql for insert
			String sql = "update event " + "set  event_name=? ,event_type=? ,event_category=? ,venue=? ,event_date=? ,event_time=? ,registration_fees=? ,registration_form=? ,description=? " + "where event_id=? ";

			mySt = myCn.prepareStatement(sql);
			// set the param values for the event

			mySt.setString(1, newEvent.getEventName());
			mySt.setString(2, newEvent.getEventType());
			mySt.setString(3, newEvent.getEventCategory());
			mySt.setString(4, newEvent.getVenue());
			String startDate = newEvent.getEventDate();
			SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy");
			java.util.Date date = sdf1.parse(startDate); // Returns a Date format object with the pattern
			java.sql.Date sqlDate = new java.sql.Date(date.getTime());
			mySt.setDate(5, sqlDate);
			mySt.setTime(6, java.sql.Time.valueOf(newEvent.getEventTime()));
			mySt.setInt(7, Integer.parseInt(newEvent.getRegistrationFees()));
			mySt.setString(8, newEvent.getRegistrationForm());
			mySt.setString(9, newEvent.getDescription());
			mySt.setInt(10, newEvent.getEventId());

			// execute sql insert
			mySt.execute();

		}
		// clean up jdbc objects
		finally {
			close(myCn, mySt, null);
		}

		
	}
	
	public static ArrayList<Event> getEventByName(String eveName) {
		Event temp = null;
		ArrayList<Event> eventsArrayList = new ArrayList<Event>();
		Connection myCn = null;
		PreparedStatement myst = null;
		ResultSet myRs = null;

	    

		try {

		

			// get connection to database
			myCn = dataSource.getConnection();

			// create sql to get selected student
			String sql = "select * from event where event_name LIKE ?";

			// create prepared statement
			myst = myCn.prepareStatement(sql);

			// set params
			myst.setString(1, "%"+eveName+"%");

			// execute statement
			myRs = myst.executeQuery();

			// retrieve data from result set row
			while (myRs.next()) {
				// Retrieve data from result set row
		        int epidInt = myRs.getInt("event_id");
				String eventName = myRs.getString("event_name");
				String eventType = myRs.getString("event_type");
				String eventCategory = myRs.getString("event_category");
				String venue = myRs.getString("venue");
				String eventDate = myRs.getString("event_date");
				String eventTime = myRs.getString("event_time");
				String registrationFees = myRs.getString("registration_fees");
				String registrationForm = myRs.getString("registration_form");
				String description = myRs.getString("description");

				// Create a new event
				temp = new Event(epidInt, eventName, eventType, eventCategory, venue, eventDate, eventTime,
						registrationFees, registrationForm, description);
				
				eventsArrayList.add(temp);
				

			}  
			return eventsArrayList;
			
			
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		     finally {
			// clean up jdbc objects

			close(myCn, myst, myRs);
		}

	}
	public static ArrayList<Event> getEventByCategory(String eveCat) {
		Event temp = null;
		ArrayList<Event> eventsArrayList = new ArrayList<Event>();
		Connection myCn = null;
		PreparedStatement myst = null;
		ResultSet myRs = null;

	    

		try {

		

			// get connection to database
			myCn = dataSource.getConnection();

			// create sql to get selected student
			String sql = "select * from event where event_category LIKE ?";

			// create prepared statement
			myst = myCn.prepareStatement(sql);

			// set params
			myst.setString(1, "%"+eveCat+"%");

			// execute statement
			myRs = myst.executeQuery();

			// retrieve data from result set row
			while (myRs.next()) {
				// Retrieve data from result set row
		        int epidInt = myRs.getInt("event_id");
				String eventName = myRs.getString("event_name");
				String eventType = myRs.getString("event_type");
				String eventCategory = myRs.getString("event_category");
				String venue = myRs.getString("venue");
				String eventDate = myRs.getString("event_date");
				String eventTime = myRs.getString("event_time");
				String registrationFees = myRs.getString("registration_fees");
				String registrationForm = myRs.getString("registration_form");
				String description = myRs.getString("description");

				// Create a new event
				temp = new Event(epidInt, eventName, eventType, eventCategory, venue, eventDate, eventTime,
						registrationFees, registrationForm, description);
				
				eventsArrayList.add(temp);
				

			}  
			return eventsArrayList;
			
			
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		     finally {
			// clean up jdbc objects

			close(myCn, myst, myRs);
		}

	}
	
	public static ArrayList<Event> getEventByDate(String eveDate) {
		Event temp = null;
		ArrayList<Event> eventsArrayList = new ArrayList<Event>();
		Connection myCn = null;
		PreparedStatement myst = null;
		ResultSet myRs = null;

	    

		try {

			System.out.println("Date given is "+eveDate);

			// get connection to database
			myCn = dataSource.getConnection();

			// create sql to get selected student
			
			String sql = "select * from event where event_date = ?";
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date date = sdf1.parse(eveDate); // Returns a Date format object with the pattern
			java.sql.Date sqlDate = new java.sql.Date(date.getTime());
			
			System.out.println(sqlDate);
			// create prepared statement
			myst = myCn.prepareStatement(sql);

			// set params
			myst.setDate(1, sqlDate);

			// execute statement
			myRs = myst.executeQuery();

			// retrieve data from result set row
			while (myRs.next()) {
				// Retrieve data from result set row
		        int epidInt = myRs.getInt("event_id");
				String eventName = myRs.getString("event_name");
				String eventType = myRs.getString("event_type");
				String eventCategory = myRs.getString("event_category");
				String venue = myRs.getString("venue");
				String eventDate = myRs.getString("event_date");
				String eventTime = myRs.getString("event_time");
				String registrationFees = myRs.getString("registration_fees");
				String registrationForm = myRs.getString("registration_form");
				String description = myRs.getString("description");

				// Create a new event
				temp = new Event(epidInt, eventName, eventType, eventCategory, venue, eventDate, eventTime,
						registrationFees, registrationForm, description);
				
				eventsArrayList.add(temp);
				

			}  
			return eventsArrayList;
			
			
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		     finally {
			// clean up jdbc objects

			close(myCn, myst, myRs);
		}

	}
}





