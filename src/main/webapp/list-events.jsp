<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.* , com.project.*"%>
<jsp:include page="header.html"></jsp:include>


<%
@SuppressWarnings("unchecked")
List<Event> episodes = (List<Event>) request.getAttribute("EVENT_LIST");
%>
<body>


	<button type="button" value="Add"
		onclick="window.location.href='add-event.jsp' ; return  false;"
		class="btn btn-outline-light" style="margin: 10px;">Add
		Event?</button>
	<div class="searchContainer">
		<!-- Search by Name -->
		<form action=EventController method=GET class="searchForms">
			<input type="hidden" name="cmd" value="SEARCH"> <input
				type="hidden" name="searchBy" value="name"> <input
				type="text" name="evName" placeholder="Search by Name">
			<button type="submit">
				<i class="fa fa-search"></i>
			</button>
		</form>

		<!-- Search by Event category-->
		<form action=EventController method=GET class="searchForms">
			<input type="hidden" name="cmd" value="SEARCH"> <input
				type="hidden" name="searchBy" value="category"> <input
				type="text" name="evCat" placeholder="Search by Category">
			<button type="submit">
				<i class="fa fa-search"></i>
			</button>
		</form>

		<!-- Search by Event Date -->
		<form action=EventController method=GET class="searchForms">
			<input type="hidden" name="cmd" value="SEARCH"> <input
				type="hidden" name="searchBy" value="date"> <input
				type="date" name="evDate" placeholder="Search by Date">
			<button type="submit">
				<i class="fa fa-search"></i>
			</button>
		</form>
	</div>

	<div class="events-box">
		<c:forEach var="temp" items="${EVENT_LIST}">
			<c:url var="link" value="EventController">
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

					<p>${temp.eventCategory}</p>
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
						<button type="submit" onclick="myFunction('${temp.eventId}')"
							class="knowMores">Know more</button>
					</div>

				</div>
			</div>
		</c:forEach>
	</div>

	</div>
	</div>
	<script src="js/myJavascript.js"></script>
	<script>
		$("#evName").autocomplete("search-event.jsp");
	</script>
</body>
<jsp:include page="footer.html"></jsp:include>
</html>







