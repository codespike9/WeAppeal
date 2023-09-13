package com.wa.beans;

public class UserBean {
	private String UserID, firstName, lastName, email;

	// setters
	public void setUserID(String UserID) {
		this.UserID = UserID;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	// getters
	public String getUserID() {
		return UserID;
	}
	
	public String getFirstName() {
		return firstName;
	}
	
	public String getLastName() {
		return lastName;
	}
	
	public String getEmail() {
		return email;
	}

	public String getFirstName(String name) {
		int index = name.indexOf(" ");
		if (index == 0)
			getFirstName(name.substring(1));
		if (index > -1)
			return name.substring(0, index);
		return name;
	}

	public String getLastName(String name) {
		int index = name.indexOf(" ");
		if (index > -1)
			return name.substring(index+1, name.length());
		return null;
	}
}
