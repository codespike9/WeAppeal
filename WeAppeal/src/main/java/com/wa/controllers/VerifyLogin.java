package com.wa.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.*;
import java.sql.*;

import com.wa.dbconfig.*;
import com.wa.beans.*;

@WebServlet("/VerifyLogin")
public class VerifyLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ResultSet rs = null;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(true);

		String email = request.getParameter("useremail");
		String passwordEntered = request.getParameter("password");

		String firstName = null;
		String lastName = null;
		String password = null;
		String userID = null;

		PrintWriter out = response.getWriter();

		out.print(passwordEntered);

		String query = "SELECT * FROM users WHERE email = '" + email + "'";

		try {

			Connection conn = DbConfig.getConnect();
			Statement stmt = conn.createStatement();

			rs = stmt.executeQuery(query);

			if (rs.next()) {
				password = rs.getString("password");
				firstName = rs.getString("FIRST_NAME");
				lastName = rs.getString("LAST_NAME");
				userID = rs.getString("ID");
			}
			out.print("     " + password);
			out.print(" " + passwordEntered);

			if (passwordEntered.equals(password)) {

				System.out.println("Password Verified");

				UserBean user = new UserBean();
				user.setEmail(email);
				user.setFirstName(firstName);
				user.setLastName(lastName);
				user.setUserID(userID);

				session.setAttribute("user", user);
				System.out.println(session.getId());
				
				response.sendRedirect("index.jsp");
			} else {
				
				int check = -1;
				session.setAttribute("check", check);
				System.out.println("Password mismatch");
				
				session.invalidate();
				response.sendRedirect("signin.html");
			}

		} catch (Exception ee) {
			ee.printStackTrace();
		}

//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

}