package com.wa.beans;

public class EventBean {
	private String eventID, eventTitle, eventDescription, eventMgrID; int count;
	
	//setters
	public void setEventID (String eventID) {
		this.eventID = eventID;
	}
	
	public void setEventTitle (String eventTitle) {
		this.eventTitle = eventTitle;
	}
	
	public void setEventDescription (String eventDescription) {
		this.eventDescription = eventDescription;
	}
	
	public void setCount (int count) {
		this.count = count;
	}
	
	//getters
	public String getEventID () {
		return eventID;
	}
	
	public String getEventTitle () {
		return eventTitle;
	} 
	
	public String getEventDescription () {
		return eventDescription;
	}
	
	public int getCount () {
		return count;
	}
}
