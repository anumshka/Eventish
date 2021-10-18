<!DOCTYPE html>
<html>

<head>
<jsp:include page="header.html"></jsp:include>

</head>
<body>

	<form class="form-txt myFormForActions" action="EventController" method="GET" >
		<input type="hidden" name="cmd" value="UPDATE">
		<input type="hidden" name="epidInt" value="${THE_EVENT.eventId }">
		<label class="ques" >Event name ?</label><br> 
		<input type="text" name="event_name" value="${THE_EVENT.eventName }" class="myFormInputs" required><br> 
		<label class="ques">Event type ?</label><br>
		<input type="text" name="event_type"  value="${THE_EVENT.eventType }" class="myFormInputs" required><br>
		<label class="ques">Event Category?</label><br>
		<input type="text" name="event_category"   value="${THE_EVENT.eventCategory }"class="myFormInputs" required><br> 
		<label class="ques">Venue? </label><br>
		<input type="text" name="venue"  value="${THE_EVENT.venue }"class="myFormInputs" required><br> 
		<label class="ques">Event Date ?</label><br>
		<input type="text" name="event_date"  value="${THE_EVENT.eventDate }"class="myFormInputs" required><br> 
		<label class="ques">Event Time?</label><br>
		<input type="text" name="event_time"  value="${THE_EVENT.eventTime }"class="myFormInputs" required><br> 
		<label class="ques">Registration fees? </label><br>
		<input type="text" name="registration_fees"  value="${THE_EVENT.registrationFees }"class="myFormInputs" required><br> 
		<label class="ques">Registration Form link ? </label><br>
		<input type="text" name="registration_form"  value="${THE_EVENT.registrationForm  }" class="myFormInputs"><br> 
		<label class="ques">Description</label><br>
		<input type="text" name="description"  value="${THE_EVENT.description }"class="myFormInputs" required><br> 
		<input type="submit" value="Save" class="save myFormInputs" ><br>
		
	</form>
	<a href="EventController"><button class="back">Back</button></a>
	
	<jsp:include page="footer.html"></jsp:include>
</body>
</html>
