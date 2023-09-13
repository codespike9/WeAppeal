<%@ include file="head.jsp" %>
<link rel="stylesheet" href="navbar.css">
            <!--Navigation bar-->
            <div class="navigation-wrap start-header start-style">
                <div class="container">
                  <div class="row">
                    <div class="col-12">
                      <nav class="navbar navbar-expand-md navbar-light">
                        <a class="logo" href="index.jsp"><img src="images/logo1.webp" alt=""></a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent">
                          <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                          <ul class="navbar-nav ml-auto py-4 py-md-0">
                            <li class="nav-item pl-4 pl-md-0 ml-0 ml-md-4 active">
                              
						   <% if(session.getAttribute("user") != null) { 
								UserBean user = (UserBean) session.getAttribute("user");
						   %>
						   <a class="nav-link"  href="index.jsp">Home</a>
                            </li>
						    <li class="nav-item dropdown">
        						<a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
          							 Welcome, <%= user.getFirstName() %>
        						</a>
        						<div class="dropdown-menu">
          							<a class="dropdown-item" href="profile.jsp">My Profile</a>
          							<a class="dropdown-item" href="profile.jsp#my_appeals">My Petitions</a>
          							<div class="dropdown-divider"></div>
									<form class="form-inline my-2 my-lg-0" action="Logout" method="POST">
      									<button class="button nav-link-btn" type="submit">Sign-Out</button>
      					  			</form>
        						</div>
      						</li>
						   <% } else { %>
						   	<form class="form-inline my-2 my-lg-0" action="signin.html" method="POST">
      							<button class="button nav-link-btn" type="submit">Login</button>
      					  	</form>
						   <% } %>
                          </ul>
                        </div>
                      </nav>    
                    </div>
                  </div>
                </div>
              </div>