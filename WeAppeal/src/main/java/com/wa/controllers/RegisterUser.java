package com.wa.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import com.wa.dbconfig.*;
import com.wa.beans.*;

@WebServlet("/RegisterUser")
public class RegisterUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ResultSet rs = null;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		UserBean user = new UserBean();
		
		String userID = null;

		String name = request.getParameter("name");
		String email = request.getParameter("useremail");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		
		String firstName = user.getFirstName(name);
		String lastName = user.getLastName(name);
		
		PrintWriter out = response.getWriter();

		try {
			Connection conn = DbConfig.getConnect();
			
			String userID_Query = "SELECT CONCAT('USR',LPAD(user_id_sequence.CURRVAL, 3, '0')) AS CURRVAL FROM dual";

			String query = "INSERT INTO users VALUES (CONCAT('USR',LPAD(user_id_sequence.NEXTVAL, 3, '0')), '" + email + "', '" + firstName + "', '" + lastName + "', '" + password + "')";

			PreparedStatement stmt = conn.prepareStatement(query);
			int i = stmt.executeUpdate(query);
			
			stmt = conn.prepareStatement(userID_Query);
			rs = stmt.executeQuery(userID_Query);
			if(rs.next())
				userID = rs.getString("CURRVAL");

			if (i > 0) {
				System.out.println(i + " rows inserted!! ");
				
				user.setUserID(userID);
				user.setEmail(email);
				user.setFirstName(firstName);
				user.setLastName(lastName);
				session.setAttribute("user", user);
				
				response.sendRedirect("index.jsp");
			} else
			{
				System.out.println("Not inserted");
				response.sendRedirect("signin.html");
			}
		} catch (Exception ee) {
			System.out.println(ee);
		}
	}
}