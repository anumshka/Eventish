package com.project;

public class Event {
	private int eventId;
	private String eventName;
	private String eventType;
	private String eventCatagory;
	private String venue;
	private String eventDate;
	private String eventTime;
	private String registrationFees;
	private String registrationForm;
	private String description;

	public Event(int eventId, String eventName, String eventType, String eventCatagory, String venue, String eventDate,
			String eventTime, String registrationFees, String registrationForm, String description) {
		this.eventId = eventId;
		this.eventName = eventName;
		this.eventType = eventType;
		this.eventCatagory = eventCatagory;
		this.venue = venue;
		this.eventDate = eventDate;
		this.eventTime = eventTime;
		this.registrationFees = registrationFees;
		this.registrationForm = registrationForm;
		this.description = description;
	}

	public Event(String eventName, String eventType, String eventCatagory, String venue, String eventDate,
			String eventTime, String registrationFees, String registrationForm, String description) {
		this.eventName = eventName;
		this.eventType = eventType;
		this.eventCatagory = eventCatagory;
		this.venue = venue;
		this.eventDate = eventDate;
		this.eventTime = eventTime;
		this.registrationFees = registrationFees;
		this.registrationForm = registrationForm;
		this.description = description;
	}

	public int getEventId() {
		return eventId;
	}

	public void setEventId(int eventId) {
		this.eventId = eventId;
	}

	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public String getEventType() {
		return eventType;
	}

	public void setEventType(String eventType) {
		this.eventType = eventType;
	}

	public String getEventCatagory() {
		return eventCatagory;
	}

	public void setEventCatagory(String eventCatagory) {
		this.eventCatagory = eventCatagory;
	}

	public String getVenue() {
		return venue;
	}

	public void setVenue(String venue) {
		this.venue = venue;
	}

	public String getEventDate() {
		return eventDate;
	}

	public void setEventDate(String eventDate) {
		this.eventDate = eventDate;
	}

	public String getEventTime() {
		return eventTime;
	}

	public void setEventTime(String eventTime) {
		this.eventTime = eventTime;
	}

	public String getRegistrationFees() {
		return registrationFees;
	}

	public void setRegistrationFees(String registrationFees) {
		this.registrationFees = registrationFees;
	}

	public String getRegistrationForm() {
		return registrationForm;
	}

	public void setRegistrationForm(String registrationForm) {
		this.registrationForm = registrationForm;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
