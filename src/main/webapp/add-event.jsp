<!DOCTYPE html>
<html>

<head>
<jsp:include page="header.html"></jsp:include>
</head>
<body>

	<form class="form-txt" action="EventController" method="GET">
		<input type="hidden" name="cmd" value="ADD">
		<label class="ques" >Event name ?</label><br> 
		<input type="text" name="event_name"><br> 
		<label class="ques">Event type ?</label><br>
		<input type="text" name="event_type"><br>
		<label class="ques">Event Catagory?</label><br>
		<input type="text" name="event_category"><br> 
		<label class="ques">Venue? </label><br>
		<input type="text" name="venue"><br> 
		<label class="ques">Event Date ?</label><br>
		<input type="text" name="event_date"><br> 
		<label class="ques">Event Time?</label><br>
		<input type="text" name="event_time"><br> 
		<label class="ques">Registration fees? </label><br>
		<input type="text" name="registration_fees"><br> 
		<label class="ques">Registration Form link ? </label><br>
		<input type="text" name="registration_form"><br> 
		<label class="ques">Description</label><br>
		<input type="text" name="description"><br> 
		<input type="submit" value="Save"><br>
	</form>

	<a href="EventController">Back</a>
	<jsp:include page="footer.html"></jsp:include>
</body>
</html>