package com.wa.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;

import com.wa.beans.*;
import com.wa.dbconfig.DbConfig;

@WebServlet("/CreatePetition")
public class CreatePetition extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ResultSet rs = null;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		UserBean user = (UserBean) session.getAttribute("user");
		
		String eventID = null;
		String eventTitle = request.getParameter("eventTitle");
		String eventDescription = request.getParameter("eventDescription");
		String eventMgrID = user.getUserID();
		
		try {
			
			Connection conn = DbConfig.getConnect();
			
			String query = "INSERT INTO events VALUES (CONCAT('EVNT',LPAD(event_id_sequence.NEXTVAL, 3, '0')), '" + eventTitle + "', '" + eventDescription + "', '" + eventMgrID + "', 0)";

			PreparedStatement stmt = conn.prepareStatement(query);
			int i = stmt.executeUpdate(query);
			
			if(i>0)
			{
				System.out.print(i + " event inserted!");
				response.sendRedirect("index.jsp");
			}
			String eventID_Query = "SELECT CONCAT('EVNT',LPAD(event_id_sequence.CURRVAL, 3, '0')) AS CURRVAL FROM DUAL";
			rs = stmt.executeQuery(eventID_Query);
			
			if(rs.next())
				eventID = rs.getString("CURRVAL");
			
		} catch (Exception ee) {
			ee.printStackTrace();
		}
	}

}
