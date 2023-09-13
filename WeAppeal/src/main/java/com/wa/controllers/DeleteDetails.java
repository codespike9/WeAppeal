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

@WebServlet("/DeleteDetails")
public class DeleteDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ResultSet rs = null;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		doPost(request,response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		String eventID = request.getParameter("eventID");
		
		try {
			Connection conn = DbConfig.getConnect();
			
			String query = "DELETE * FROM events WHERE EVENT_ID= '"+ eventID +"'";
			PreparedStatement stmt = conn.prepareStatement(query);
			
			rs = stmt.executeQuery(query);
			
			if(rs.next()) {
				
				response.sendRedirect("index.jsp");
			}
			
		}
		catch (Exception ee) {
			System.out.println(ee);
		}
	}

}

