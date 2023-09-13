<%@ include file="navbar.jsp" %>
        <link rel="stylesheet" type="text/css" href="profile.css"></link>
<% if(session.getAttribute("user") == null) {
    		response.sendRedirect("signin.html");
    }
    else {
    		UserBean user = (UserBean) session.getAttribute("user");
%>
        <title><%= user.getFirstName() %>'s Profile</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<!-- <script>
		setInterval(function(){
			location.reload();
		},2000)
		</script> -->
    </head>

    <body>



        <!--Main Card-->
        <section class="h-100 gradient-custom-2">
            <div class="container py-2 h-100">
              <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col col-lg-10">
                  <div class="card">
                    <div class="rounded-top text-white d-flex flex-row" style="background-color: #000; height:200px;">
                      <div class="ms-1" style="width: 50px;"></div>
                      <div class="ms-3" style="margin-top: 130px;">
                        <h5><%= user.getFirstName().concat(" ".concat(user.getLastName())) %></h5>
                      </div>
                      <div class="ms-5" style="width: 500px"></div>
                      <div class="ms-4">
<!--                         <img src="images/topblog2.jpg" class="img-fluid img-thumbnail mt-4 mb-2 justify-content-end"> -->
                      </div>
                    </div>
                    <div class="pr-md-4 text-black" style="background-color: #dde3ef;">
                      <div class="d-flex justify-content-end text-center py-1">
                        <a type="button" class="btn btn-outline-dark" style="z-index: 1;" href="/WeAppeal/edit-profile.jsp">Edit profile</a>&ensp;
                        <a type="button" class="btn btn-outline-dark" style="z-index: 1;" href="Logout">Sign-out</a>
                      </div>
                    </div>


                    <div class="card-body p-4 text-black">

                      <!--Profile Details-->
                      <div class="mb-5">
                        <p class="lead fw-normal mb-1">About</p>
                        <div class="p-4" style="background-color: #dde3ef;">
                            <table>
                                <tbody>

                                    <tr>
                                        <td>Email</td>
                                        <td>&ensp;:&ensp;</td>
                                        <td><%= user.getEmail() %></td>
                                    </tr>

									<tr>
										<td>
										<%
											Connection conn = DbConfig.getConnect();
											String appealsInitiatedQuery = "SELECT DISTINCT COUNT(*) FROM events WHERE event_mgr_id='" + user.getUserID() + "'";
											PreparedStatement stmt = conn.prepareStatement(appealsInitiatedQuery);
											ResultSet rs = stmt.executeQuery(appealsInitiatedQuery);
											
											if (rs.next())
										%>
												<%= rs.getInt("COUNT(*)") %> appeals initiated.</td>
									</tr>
                                </tbody>
                            </table>
                        </div>
                      </div>

                      <!--Profile Appeals-->
                      <div class="mb-5" >
                        <p class="lead fw-normal mb-1" id="my_appeals">My appeals</p>
                        <div class="p-4" style="background-color: #dde3ef;">
                          <div class="container">
                          <div class="row">

                          <% String query="select * from events where event_mgr_id='"+user.getUserID()+"'"; %>
                          <% 
                           stmt = conn.prepareStatement(query);
                          rs=stmt.executeQuery(query);
                          
                          while(rs.next()) {%>
                          
                          
                            <div class="col-3 card">
                              <div class="card-body text-center">
                                <h4 class="card-title"><%= rs.getString("EVENT_NAME") %></h4>
                                <p class="card-text"><%= rs.getString("EVENT_DESCRIPTION") %></p>
                                <p class="card-text"><small class="text-muted"><%= rs.getInt("COUNT") %> users signed.</small></p>
                              </div>
                              
                            </div>
                          &ensp;
                           
                            <% } %>
                            </div>
							</div>
                        </div>
                      </div>

                    </div>


                  </div>
                </div>
              </div>
            </div>
          </section>


          <script src="profile.js"></script>
    </body>
<% } %>
</html>