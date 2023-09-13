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


@WebServlet("/PasswordChangeVerification")
public class PasswordChangeVerification extends HttpServlet {
	private static final long serialVersionUID = 1L;
   ResultSet rs=null;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session =request.getSession(false);
		String oldPassword= request.getParameter("oldpass");
		String newPassword = request.getParameter("newpass");
		String password="";
		PrintWriter out = response.getWriter();
		UserBean ub= (UserBean)session.getAttribute("user");
		
		try
		{
			String query="Select password from users where ID='"+ ub.getUserID() +"'";
			Connection conn = DbConfig.getConnect();
			PreparedStatement stmt= conn.prepareStatement(query);;
			rs= stmt.executeQuery(query);
			
			if(rs.next())
					password=rs.getString("password");
			if(oldPassword.equals(password))
			{
				if(!(newPassword.equals(oldPassword)))
				{
					
						query = "UPDATE users SET password='" + newPassword + "' WHERE ID='" + ub.getUserID() + "'";
						int i=stmt.executeUpdate(query);
						if(i==1)
						{
							out.print("Successfull");
							response.sendRedirect("profile.jsp");
						}
						else
							out.print("Not successfull");
					
				}
				else out.print("Old Password equals new password. Database not updated.");
			}
			else out.print("Enter correct password!!");
		}
		catch(Exception ee) {
			ee.printStackTrace();
		}
	}

}
