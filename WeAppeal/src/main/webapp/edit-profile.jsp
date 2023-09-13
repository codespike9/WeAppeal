<%@ include file="head.jsp" %>

        <link rel="stylesheet" type="text/css" href="edit-profile.css"></link>
        <title>Edit Profile</title>

    </head>

    <body>
<% if(session.getAttribute("user") == null) {
    		response.sendRedirect("signin.html");
    }
    else {
    		UserBean user = (UserBean) session.getAttribute("user");
%>
        <div class="container">
            <div class="row gutters">
            <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
            <div class="card h-100">
                <div class="card-body">
                    <div class="account-settings">
                        <div class="user-profile">
                            <div class="user-avatar">
                                <img src="images/topblog2.jpg" alt="Maxwell Admin">
                            </div>
                            <h5 class="user-name"><%= user.getFirstName().concat(" ".concat(user.getLastName())) %></h5>
                            <h6 class="user-email"><%= user.getEmail() %></h6>
                        </div>
                        <div class="about">
                            <h5>About</h5>
                            <p><%
											Connection conn = DbConfig.getConnect();
											String appealsInitiatedQuery = "SELECT DISTINCT COUNT(*) FROM events WHERE event_mgr_id='" + user.getUserID() + "'";
											PreparedStatement stmt = conn.prepareStatement(appealsInitiatedQuery);
											ResultSet rs = stmt.executeQuery(appealsInitiatedQuery);
											
											if (rs.next())
										%>
												<%= rs.getInt("COUNT(*)") %> appeals initiated. &ensp;|&ensp;<% String appealsSignedQuery = "SELECT DISTINCT COUNT(*) FROM rel_signs WHERE user_id='" + user.getUserID() + "'";
												stmt = conn.prepareStatement(appealsSignedQuery);
												 rs = stmt.executeQuery(appealsSignedQuery); 
												if(rs.next())%><%= rs.getInt("COUNT(*)") %> appeals signed</p>
                        </div>
                    </div>
                </div>
            </div>
            </div>
            <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
            <form action="NameChange" method="post">
            <div class="card">
                <div class="card-body">

                    <div class="row gutters">
                    
                        <div class="col-12">
                            <h6 class="mb-2 text-primary">Update Details</h6>
                        </div>
                        <div class="col-12">
                            <div class="form-group">
                                <label for="firstName">First Name</label>
                                <input type="text" class="form-control" name="fname" id="firstName" placeholder="Enter first name">
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group">
                                <label for="lastName">Last Name</label>
                                <input type="text" class="form-control" id="lastName" name="lname" placeholder="Enter last name">
                            </div>
                        </div>
                    
                    </div>
                    <div class="row gutters">
                        <div class="col-12">
                            <div class="text-right">
                                <button type="button" id="submit" name="" class="btn btn-secondary">Cancel</button>
                                <button type="submit" id="submit" name="submit" class="btn btn-primary">Update</button>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
 </form>
 			<form action="PasswordChangeVerification" method="post">
            <div class="card">
                <div class="card-body">
                    <div class="row gutters">
                        
                            <div class="col-12">
                                <h6 class="mb-2 text-primary">Update Password</h6>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="oldPass">Old Password</label>
                                    <input type="password" class="form-control" name="oldpass" placeholder="Enter old password">
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="newPass">New Password</label>
                                    <input type="password" class="form-control" name="newpass" placeholder="Enter new password">
                                </div>
                            </div>
                        
                        </div>
                        <div class="row gutters">
                            <div class="col-12">
                                <div class="text-right">
                                    <button type="reset" id="submit" class="btn btn-secondary">Cancel</button>
                                    <button type="submit" id="submit" name="submit" class="btn btn-primary">Update</button>
                                </div>
                            </div>
                        </div>
                        
                </div>
            </div>
            </form>
            </div>
            </div>
        </div>
 <% } %>       
    </body>
</html>