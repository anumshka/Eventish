<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.* , com.project.*"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<head>
<title></title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link type="text/css" rel="stylesheet" href="css/style-list.css">

</head>


<%
@SuppressWarnings("unchecked")
List<Event> episodes = (List<Event>) request.getAttribute("EVENT_LIST");
%>
<body>


	<div class="container">
	
	<!--  

		<div id="content">

			<button type="button" value="Add"
				onclick="window.location.href='add-rating.jsp' ; return  false;"
				class="btn btn-secondary btn-sm" style="margin: 10px;">Add
				Event</button>
			<table class="table table-striped">

				<tr>
					<th>Event</th>
					<th>Type</th>
					<th>Catagory</th>
					<th>Venue</th>
					<th>Date</th>
					<th>Time</th>
					<th>Fees</th>
					<th>Form</th>
					<th>Description</th>
					<th>Operations</th>
				</tr>


					<c:forEach var="temp" items="${EVENT_LIST}">
						<c:url var="link" value="EpisodeController">
							<c:param name="cmd" value="LOAD" />
							<c:param name="epid" value="${temp.eventId }" />
						</c:url>

						<c:url var="deleteLink" value="EpisodeController">
							<c:param name="cmd" value="DELETE" />
							<c:param name="epid" value="${temp.eventId }" />
						</c:url>

						<tr>
						  
							<td>${temp.eventName}</td>
							<td>${temp.eventType}</td>
							<td>${temp.eventCatagory}</td>
							<td>${temp.venue}</td>
							<td>${temp.eventDate}</td>
							<td>${temp.eventTime}</td>
							<td>${temp.registrationFees}</td>
							<td>${temp.registrationForm}</td>
							<td>${temp.description}</td>

							<td><a href="${link}"><button class="operations">Update </button> </a> </td>
							<td> <a href="${deleteLink}">
									<button class="operations">Delete</button> </a></td>
						</tr>
					</c:forEach>
				
			</table>
			-->
			<h1 id="PageHead">Eventish</h1>
			
			
			<div class="events-box">
			<c:forEach var="temp" items="${EVENT_LIST}">
			<div class="myEvent">
			 <div class="eventName" >
			 <h3 class="eventNameHeading">${temp.eventName}</h3>
			 
			 <p>${temp.eventCatagory}</p>
			 <p>${temp.eventDate}</p>
			 <p>${temp.eventTime}</p>
			 <div id ='${temp.eventId}' style="display : none">
			  <p>${temp.eventType}</p>
			 <p>${temp.venue}</p>
			 <p>${temp.registrationFees}</p>
			 <p>${temp.description}</p>
			 </div>
			 <div class="myOperations">
			 <button type="submit" id="del" class="del-btn"><i class="fa fa-trash" aria-hidden="true"
                    style="font-size:14px"></i></button>
              <button type="submit" class="edit-button"><i class="fa fa-pencil-square-o url_name" aria-hidden="true"
                        style="font-size:18px"></i></button>
                        
                    </div>
                    <button onclick="myFunction('${temp.eventId}')" class="knowMores">Know more</button>
			 </div>
			</div>
				</c:forEach>
			</div>
			
		</div>
	</div>
<script src = "js/myJavascript.js"></script>
</body>
<!-- Footer -->
<footer class="page-footer font-small blue">

	<!-- Copyright -->
	<div class="footer-copyright text-center py-3"
		style="background-color: #aa66cc;">Add footer here</div>
	<!-- Copyright -->

</footer>
<!-- Footer -->
</html>
