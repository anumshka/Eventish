<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.* , com.project.*"%>
<jsp:include page="header.html"></jsp:include>


<%
@SuppressWarnings("unchecked")
List<Event> episodes = (List<Event>) request.getAttribute("EVENT_LIST");
%>
<body>

<button  type="button" value="Add"
		onclick="window.location.href='add-event.jsp' ; return  false;"
		class="btn btn-primary my-3 mx-3" >Add
		Event?</button>
  

	
	<div class="d-flex">
		<!-- Search by Name -->
		
		
		  <div class="container-fluid ">
		<form action=EventController method=GET  class="d-flex" role="search">
		<input type="hidden" name="cmd" value="SEARCH">
		<input
				type="hidden" name="searchBy" value="name">
        <input name="evName" placeholder="Search by Name" class="form-control me-2" type="text"  aria-label="Search">
        <button class="btn btn-outline-success" type="submit"><i class="fa fa-search"></i></button>
      </form>
      </div>
      
      <!-- Search by Event category-->
      <div class="container-fluid ">
      <form class="d-flex" role="search" action=EventController method=GET>
       <input type="hidden" name="cmd" value="SEARCH"> <input
				type="hidden" name="searchBy" value="category">
        <input class="form-control me-2" type="text" name="evCat" placeholder="Search by Category" aria-label="Search">
        <button class="btn btn-outline-success" type="submit"><i class="fa fa-search"></i></button>
      </form>
      
        </div>
        
        <!-- Search by Event Date -->
        <div class="container-fluid ">
      <form class="d-flex" role="search" action=EventController method=GET>
      <input type="hidden" name="cmd" value="SEARCH"> <input
				type="hidden" name="searchBy" value="date">
        <input class="form-control me-2" type="date" name="evDate" placeholder="Search by Date" aria-label="Search">
        <button class="btn btn-outline-success" type="submit"><i class="fa fa-search"></i></button>
      </form>
      </div>
      
    
	
	
		

		
		
		
	</div>
	
	<div class="d-flex flex-wrap">
	
		
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
	
	
				<div class="">
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
					<div class="d-flex justify-content-around">
						<a href="${deleteLink}"
							onclick="return confirm('Are you sure you want to delete this item?');">
							<button type="submit" id="del" class="btn btn-danger">
								<i class="fa fa-trash" aria-hidden="true"
									style="font-size: 14px"></i>
							</button>
						</a> <a href="${link}"><button type="submit" class="btn btn-warning">
								<i class="fa fa-pencil-square-o url_name" aria-hidden="true"
									style="font-size: 18px"></i>
							</button></a>
						<button type="submit" onclick="myFunction('${temp.eventId}','${temp.eventId + 10}')"
							id='${temp.eventId+10}' class="btn btn-primary">Know more</button>
					</div>

				</div>
    
  
</div>
	
	
			
			
		<!--  

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
					<div class="d-flex justify-content-around">
						<a href="${deleteLink}"
							onclick="return confirm('Are you sure you want to delete this item?');">
							<button type="submit" id="del" class="btn btn-danger">
								<i class="fa fa-trash" aria-hidden="true"
									style="font-size: 14px"></i>
							</button>
						</a> <a href="${link}"><button type="submit" class="btn btn-warning">
								<i class="fa fa-pencil-square-o url_name" aria-hidden="true"
									style="font-size: 18px"></i>
							</button></a>
						<button type="submit" onclick="myFunction('${temp.eventId}')"
							class="btn btn-primary">Know more</button>
					</div>

				</div>
			</div>
			
			-->
			
			
			</c:forEach>
		
		</div>
	

	
	
	<script src="js/myJavascript.js"></script>
	<script>
		$("#evName").autocomplete("search-event.jsp");
	</script>
</body>
<jsp:include page="footer.html"></jsp:include>
</html>







