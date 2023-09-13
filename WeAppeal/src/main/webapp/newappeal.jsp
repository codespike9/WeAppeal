<%@ page import="com.wa.beans.*" %>
<html>
    
    <head>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="newappeal.css"></link>
        <title>New Appeal</title>
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

            
            <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
            <form action="CreatePetition" name="myForm" method="post">
            
            <div class="card">
                <div class="card-body">
                    <div class="row gutters">     
                        <div class="col-12">
                            <h3 class="mb-1 text-primary" style="text-align:center">Petition Title</h3>
                        </div>
                        <div class="col-12">
                            <div class="col-12">
                                <div class="form-group">
                                &nbsp;
<!--                                     <p><label for="title" style="font-weight: bold;">Title :</label></p> -->
                                    <textarea class="form-control" name="eventTitle" id="title" rows="1" placeholder="Write your petition title here..."></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <h3 class="mb-1 text-primary" style="text-align:center">Your Story</h3>
                        </div>
                        <div class="col-12">
                            <div class="col-12">
                                <div class="form-group">
                                    <p>Tell people what you want to change</p>
                                    <p><label for="title" style="font-weight: bold;">Body :</label></p>
                                    <textarea class="form-control " name="eventDescription" id="title" rows="4" placeholder="Write your petition body here..."></textarea>&nbsp;&nbsp;
                                </div>
                            </div>
                        </div>
                        <div class="col-1"></div>
<!--                         <div class="col-10"> -->
<!--                             <div class="custom-file"> -->
<!--                                 <input type="file" class="custom-file-input" id="customFile"> -->
<!--                                 <label class="custom-file-label" for="customFile">Choose file</label> -->
<!--                             </div> -->
<!--                         </div> -->
                        <div class="row gutters">
                        <div class="col-12">
                            <div class="text-right" style="justify-content:center">
                                <a type="reset" id="reset" name="reset" class="btn btn-secondary" style="color:white">reset</a>
                                <button type="submit" onclick="validateForm()" id="submit" name="submit" class="btn btn-success" style="color:white">Submit</button>
                            </div>
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