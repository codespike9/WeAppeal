<%@ include file="head.jsp" %>
<%@ include file="navbar.jsp" %>
<link rel="stylesheet" href="newappeal.css">
<link rel="stylesheet" href="navbar.css">
<title><% EventBean event= (EventBean)session.getAttribute("event");%><%= event.getEventTitle() %></title>
</head>
<body>
<br>
<br>
<br>

	<div class="card " style="align-items:center">
    <div class="card-body col-12" style="width:1000px">
    	<h2 class="card-text"><%= event.getEventTitle() %><br></h2>
    	
     	<h4 class="card-text"><small class="text-muted"><%= event.getEventDescription() %><br></small></h4>
   	
     	<h6 class="card-text"><small class="text-muted"><%= event.getCount() %> users signed this petition.</small></h6>
    </div>
	<form class="form-inline my-2 my-lg-0" action="AddSign" method="POST">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Sign Petition</button>
    </form>
    </div>
</body>
</html>