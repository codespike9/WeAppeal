<%-- <%@ include file="head.jsp" %> --%>
<%@ include file="navbar.jsp" %>
        <link rel="stylesheet" href="index.css">
        <title>WeAppeal</title>
    </head>

    <body>

        <header>

            <%
            	ResultSet rs = null;
            
            	int numberOfUsers = 0;
            
            	Connection conn = DbConfig.getConnect();
            	String number_of_users_query = "SELECT DISTINCT COUNT(*) FROM users";
            	PreparedStatement stmt = conn.prepareStatement(number_of_users_query);
            	rs = stmt.executeQuery(number_of_users_query);
            	
            	if (rs.next())
            		numberOfUsers = rs.getInt("COUNT(*)");
            %>

            <!--Center-->
            <div display="flex" class="container flex-1">
                <div class="container head">
                    <h1>The world's platform for change</h1>
                </div>
                <div class="container">
                    <div display="flex" class="container flex-2">
                        <div style="text-align:center" class="container">
                            <span class="active-user"><%= numberOfUsers %> people taking action.&nbsp;
                                <a href="#top-appeals" class="text-center appeal">Top appeals.</a>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="container" style="text-align:center">
                    <a class="button strt-ptt-btn" id="myDiv" href="/WeAppeal/newappeal.jsp"">Start a petition</a>
                </div>
            </div>
            

            <!--Carousel Card-->
            <h4> &ensp;&ensp;&ensp;Top Appeals</h4>
                <div class="container-fluid" id="top-appeals">
                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                      <div class="carousel-inner row w-100 mx-auto">
                      <%
                      		String top_card_query = "SELECT * FROM (SELECT * FROM events ORDER BY count DESC) WHERE ROWNUM <= 10";
                      		stmt = conn.prepareStatement(top_card_query);
                      		rs = stmt.executeQuery(top_card_query);
                      		
                      		while (rs.next()) {
                      %>
                        <div class="carousel-item col-md-4 active">
                          <div class="card">
                            <img class="card-img-top img-fluid" src="https://picsum.photos/seed/1/800/600" alt="Card image cap">
                            <div class="card-body">
                            
                              <a href="EventDetails?eventID=<%= rs.getString("EVENT_ID") %>
                              "><h4 class="card-title"><%= rs.getString("EVENT_NAME") %></h4></a>
                              <h6 class="card-subtitle mb-2 text-muted"><%= rs.getString("EVENT_MGR_ID") %></h6>
                              <p class="card-text"><%= rs.getString("EVENT_DESCRIPTION").substring(0, 10) + "..." %></p>
                              <p class="card-text"><small class="text-muted"><%= rs.getInt("COUNT") %> people signed.</small></p>
                            </div>
                          </div>
                        </div>
                      <% } %>
<!--                         <div class="carousel-item col-md-4"> -->
<!--                           <div class="card"> -->
<!--                             <img class="card-img-top img-fluid" src="https://picsum.photos/seed/2/800/600" alt="Card image cap"> -->
<!--                             <div class="card-body"> -->
<!--                               <h4 class="card-title">Card 2</h4> -->
<!--                               <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p> -->
<!--                               <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p> -->
<!--                             </div> -->
<!--                           </div> -->
<!--                         </div> -->
<!--                         <div class="carousel-item col-md-4"> -->
<!--                           <div class="card"> -->
<!--                             <img class="card-img-top img-fluid" src="https://picsum.photos/seed/3/800/600" alt="Card image cap"> -->
<!--                             <div class="card-body"> -->
<!--                               <h4 class="card-title">Card 3</h4> -->
<!--                               <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p> -->
<!--                               <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p> -->
<!--                             </div> -->
<!--                           </div> -->
<!--                         </div> -->
<!--                         <div class="carousel-item col-md-4"> -->
<!--                           <div class="card"> -->
<!--                             <img class="card-img-top img-fluid" src="https://picsum.photos/seed/4/800/600" alt="Card image cap"> -->
<!--                             <div class="card-body"> -->
<!--                               <h4 class="card-title">Card 4</h4> -->
<!--                               <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p> -->
<!--                               <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p> -->
<!--                             </div> -->
<!--                           </div> -->
<!--                         </div> -->
<!--                         <div class="carousel-item col-md-4"> -->
<!--                           <div class="card"> -->
<!--                             <img class="card-img-top img-fluid" src="https://picsum.photos/seed/5/800/600" alt="Card image cap"> -->
<!--                             <div class="card-body"> -->
<!--                               <h4 class="card-title">Card 5</h4> -->
<!--                               <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p> -->
<!--                               <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p> -->
<!--                             </div> -->
<!--                           </div> -->
<!--                         </div> -->
<!--                         <div class="carousel-item col-md-4"> -->
<!--                           <div class="card"> -->
<!--                             <img class="card-img-top img-fluid" src="https://picsum.photos/seed/6/800/600" alt="Card image cap"> -->
<!--                             <div class="card-body"> -->
<!--                               <h4 class="card-title">Card 6</h4> -->
<!--                               <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p> -->
<!--                               <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p> -->
<!--                             </div> -->
<!--                           </div> -->
<!--                         </div> -->
<!--                         <div class="carousel-item col-md-4"> -->
<!--                           <div class="card"> -->
<!--                             <img class="card-img-top img-fluid" src="https://picsum.photos/seed/7/800/600" alt="Card image cap"> -->
<!--                             <div class="card-body"> -->
<!--                               <h4 class="card-title">Card 7</h4> -->
<!--                               <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p> -->
<!--                               <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p> -->
<!--                             </div> -->
<!--                           </div> -->
<!--                         </div> -->
                      </div>
                      <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                      </a>
                      <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                      </a>
                    </div>
                  </div>


                  &nbsp;&nbsp;
                  <%
                      		String card_query = "SELECT * FROM (SELECT * FROM events ORDER BY event_id DESC) WHERE ROWNUM <= 10";
                      		stmt = conn.prepareStatement(card_query);
                      		rs = stmt.executeQuery(card_query);
                      		
                      		while (rs.next()) {
                  %>
                  <div id="movie-card-list">
                    <div class="movie-card">
                      <div class="color-overlay">
                        <div class="movie-content">
                        &nbsp;
                            <h3 class="movie-title"><%= rs.getString("EVENT_NAME") %></h3>
                            <h5 class="movie-info">Created by <%= rs.getString("EVENT_MGR_ID") %></h5>&nbsp;
                            <p class="movie-desc"><%= rs.getString("EVENT_DESCRIPTION").substring(0, 10) + "..." %></p>
                            <p class="card-text"><small class="text-muted"><%= rs.getInt("COUNT") %> people signed.</small></p>
                            <a type="button" class="btn btn-outline" href="EventDetails?eventID=<%= rs.getString("EVENT_ID") %>">See Details</a>
                        </div>
                      </div>
                    </div>
                    <% } %>
                  
<!--                     <div class="movie-card"> -->
<!--                       <div class="color-overlay"> -->
<!--                         <div class="movie-content"> -->
<!--                             <h1 class="movie-title">Back to the Future</h1> -->
<!--                             <h4 class="movie-info">(1985) Adventure, Comedy, Sci-Fi</h4>&nbsp; -->
<!--                             <p class="movie-desc">Marty McFly, a 17-year-old high school student, is accidentally sent 30 years into the past in a time-traveling DeLorean invented by his close friend, the maverick scientist Doc Brown. </p> -->
<!--                             <a type="button" class="btn btn-outline" href="#">Watch Trailer</a> -->
<!--                         </div> -->
<!--                       </div> -->
<!--                     </div> -->
                  
<!--                     <div class="movie-card"> -->
<!--                       <div class="color-overlay"> -->
<!--                         <div class="movie-content"> -->
<!--                             <h1 class="movie-title">Akira</h1> -->
<!--                             <h4 class="movie-info">(1988) Animation, Action, Drama </h4>&nbsp; -->
<!--                             <p class="movie-desc">A secret military project endangers Neo-Tokyo when it turns a biker gang member into a rampaging psychic psychopath that only two teenagers and a group of psychics can stop. </p> -->
<!--                             <a type="button" class="btn btn-outline" href="#">Watch Trailer</a>   -->
<!--                         </div> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                   </div> -->


        </header>

        <footer>
          <div class="container-fluid foot text-white-50 px-sm-1 px-lg-5">
          <div class="row pt-3">
            <div class="col-lg-4 col-md-4 mb-5">
              <a class="navbar-brand">
                <h1 class="text text-uppercase mb-4" style="letter-spacing: 6px; color:white">WeAppeal</h1>
              </a>
              <p style="color: white">When you invest you are buying a day that you don't have to work!</p>
            </div>
            <div class="col-lg-4 col-md-4 mb-5" style="color:white">
              &nbsp;
              <h5 class="text text-uppercase mb-4" style="letter-spacing: 5px ; color:white">Links</h5>
              <p class="text-white-50 mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Top Appeals</p>
              <p class="text-white-50 mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>New Appeals</p>
              <p class="text-white-50 mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Sign-In / Log-In</p>
              <link rel="stylesheet" href="index.css">
            </div>
            <div class="col-lg-4 col-md-4 mb-5" style="color:white">
              &nbsp;
              <h5 class="text text-uppercase mb-4" style="letter-spacing: 5px ; color:white">Contact Us</h5>
              <p class="text-white-50 mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Silicon Institute of Technology</p> 
              <p class="text-white-50 mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Email : ukc420@silicon.ac.in</p> 
            </div>
          </div>
          </div>


        </footer>

        <script src="index.js"></script>

    </body>
</html>