package com.wa.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.*;
import java.sql.*;
import com.wa.beans.*;
import com.wa.dbconfig.DbConfig;

@WebServlet("/AddSign")
public class AddSign extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ResultSet rs = null;
       
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		if(session.getAttribute("user") != null ) {
			
			PrintWriter out = response.getWriter();
			
			UserBean user = (UserBean) session.getAttribute("user");
			EventBean event = (EventBean) session.getAttribute("event");
			
			String userID = user.getUserID();
			String eventID = event.getEventID();
			
			try {
				
				Connection conn = DbConfig.getConnect();
				
				String search_Query = "SELECT * FROM rel_signs WHERE user_id='" + userID + "' AND event_id='" + eventID + "'";
				PreparedStatement stmt = conn.prepareStatement(search_Query);
				
				rs = stmt.executeQuery(search_Query);
				
				if(rs.next()) {
					
					out.print("You have already signed");
				}
				else {
					String insertion_Query = "INSERT INTO rel_signs VALUES('" + userID + "', '" + eventID + "')";
					stmt = conn.prepareStatement(insertion_Query);
					
					int i = stmt.executeUpdate(insertion_Query);
					
					if(i>0) {
						
						String increase_query= "UPDATE events SET COUNT= COUNT +1 WHERE EVENT_ID='"+eventID+"'";
						stmt=conn.prepareStatement(increase_query);
						
						i=stmt.executeUpdate(increase_query);
						if(i>0)
						{
							response.sendRedirect("eventDetails.jsp");
						out.print("You have signed successfully");
						}
					}
					else {
						out.print("Some error occured. Data not inserted.");
					}
					
					
				}

			}
			catch(Exception ee) {
				ee.printStackTrace();
			}
			
		}
		else {
			response.sendRedirect("signin.html");
		}
	}

}
