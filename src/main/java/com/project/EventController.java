package com.project;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;


@WebServlet("/EventController")
public class EventController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DaoEvent daoEvent;

	@Resource(name = "jdbc/eventish")
	private DataSource dataSource;

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();

		// create out data base utility and pass connection pool or datasource
		try {
			daoEvent = new DaoEvent(dataSource);
		} catch (Exception e) {
			// TODO: handle exception
			throw new ServletException();
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		// list the episodes in MVC fashion
		try {

			// read the command parameter
			String cmd = request.getParameter("cmd");

			// if cmd is missing , then list

			if (cmd == null) {
				cmd = "LIST";
			}

			// route to appopriate method
			switch (cmd) {
			case "LIST":
				listEvents(request, response);
				break;
			case "ADD":
				addEvent(request, response);
			default:
				listEvents(request, response);
			}

		} catch (Exception e) {

			e.printStackTrace();
		}
	}

	private void listEvents(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// get episodes from db util
		List<Event> events = daoEvent.getEvents();

		// add episodes to request
		request.setAttribute("EVENT_LIST", events);

		// send to jsp page
		RequestDispatcher dispatcher = request.getRequestDispatcher("/list-events.jsp");
		dispatcher.forward(request, response);

	}
	
	private void addEvent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		// read about event from form
		String eventName = request.getParameter("event_name");
		String eventType = request.getParameter("event_type");
		String eventCategory = request.getParameter("event_category");
		String venue = request.getParameter("venue");
		String eventDate = request.getParameter("event_date");
		String eventTime = request.getParameter("event_time");
		String registrationFees = request.getParameter("registration_fees");
		String registrationForm = request.getParameter("registration_form");
		String description = request.getParameter("description");
	
		// create new event
		Event  newEvent = new Event(eventName,eventType,eventCategory,venue,eventDate,eventTime,registrationFees,registrationForm,description);

		// add event
		DaoEvent.addEvent(newEvent);

		// get back to the main page
		listEvents(request, response);

	}

}
