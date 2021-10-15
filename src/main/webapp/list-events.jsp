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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Oswald:wght@500&display=swap"
	rel="stylesheet">
<link type="text/css" rel="stylesheet" href="css/style-list.css">

</head>


<%
@SuppressWarnings("unchecked")
List<Event> episodes = (List<Event>) request.getAttribute("EVENT_LIST");
%>
<body>


	<div class="container">
		<div class="header">
			<h1 id="PageHead">Eventish</h1>
			<div>Web application to show various events currently held at
				various places</div>
		</div>

		<div class="events-box">
			<c:forEach var="temp" items="${EVENT_LIST}">
				<c:url var="link" value="EpisodeController">
					<c:param name="cmd" value="LOAD" />
					<c:param name="epid" value="${temp.eventId }" />
				</c:url>

				<c:url var="deleteLink" value="EventController">
					<c:param name="cmd" value="DELETE" />
					<c:param name="epid" value="${temp.eventId }" />
				</c:url>
				<div class="myEvent">
					<div class="eventName">
						<h3 class="eventNameHeading">${temp.eventName}</h3>

						<p>${temp.eventCatagory}</p>
						<p>${temp.eventDate}</p>
						<p>${temp.eventTime}</p>
						<div id='${temp.eventId}' style="display: none">
							<p>${temp.eventType}</p>
							<p>${temp.venue}</p>
							<p>${temp.registrationFees}</p>
							<p>${temp.description}</p>
						</div>
						<div class="myOperations">
							<a href="${deleteLink}"
								onclick="return confirm('Are you sure you want to delete this item?');">
								<button type="submit" id="del" class="del-btn">
									<i class="fa fa-trash" aria-hidden="true"
										style="font-size: 14px"></i>
								</button>
							</a> <a href="${link}"><button type="submit" class="edit-button">
									<i class="fa fa-pencil-square-o url_name" aria-hidden="true"
										style="font-size: 18px"></i>
								</button></a>

						</div>
						<button type="submit" onclick="myFunction('${temp.eventId}')"
							class="knowMores">Know more</button>
					</div>
				</div>
			</c:forEach>
		</div>

	</div>
	</div>
	<script src="js/myJavascript.js"></script>
</body>
<!-- Footer -->
<footer>

	<!-- Copyright -->
	<div class="footer">Copyright &copy; 2021 Anushka Pathak &amp;
		Samruddhi Badlani</div>
	<!-- Copyright -->

</footer>
<!-- Footer -->
</html>
