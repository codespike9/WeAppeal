package com.wa.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import java.io.*;
import java.sql.*;

import com.wa.dbconfig.*;
import com.wa.beans.*;


@WebServlet("/NameChange")
public class NameChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
   ResultSet rs=null;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session =request.getSession(false);
		String FirstName= request.getParameter("fname");
		String LastName = request.getParameter("lname");
		PrintWriter out = response.getWriter();
		UserBean ub= (UserBean)session.getAttribute("user");
		out.print(LastName);
		try
		{
			Connection conn = DbConfig.getConnect();
			String query = "UPDATE users SET FIRST_NAME='" + FirstName + "', LAST_NAME='"+LastName+"' WHERE ID='" + ub.getUserID() + "'";
			PreparedStatement stmt= conn.prepareStatement(query);
			int i=stmt.executeUpdate(query);
			if(i==1)
			{
				out.print("Successfull");
				response.sendRedirect("profile.jsp");
			}
			else
				out.print("Not successfull");
			ub.setFirstName(FirstName);
			ub.setLastName(LastName);
			session.setAttribute("user", ub);
			out.print(ub.getFirstName());
		}
		catch(Exception ee) {
			ee.printStackTrace();
		}
	}

}