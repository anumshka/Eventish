<!DOCTYPE html>
<html>

<head>
<jsp:include page="header.html"></jsp:include>

</head>
<body>

	<form class="form-txt myFormForActions" action="EventController" method="GET" >
		<input type="hidden" name="cmd" value="ADD">
		<label class="ques" >Event name ?</label><br> 
		<input type="text" name="event_name" class="myFormInputs" required><br> 
		<label class="ques">Event type ?</label><br>
		<input type="text" name="event_type"  class="myFormInputs" required><br>
		<label class="ques">Event Catagory?</label><br>
		<input type="text" name="event_category"  class="myFormInputs" required><br> 
		<label class="ques">Venue? </label><br>
		<input type="text" name="venue" class="myFormInputs" required><br> 
		<label class="ques">Event Date ?</label><br>
		<input type="text" name="event_date" class="myFormInputs" required><br> 
		<label class="ques">Event Time?</label><br>
		<input type="text" name="event_time" class="myFormInputs" required><br> 
		<label class="ques">Registration fees? </label><br>
		<input type="text" name="registration_fees" class="myFormInputs" required><br> 
		<label class="ques">Registration Form link ? </label><br>
		<input type="text" name="registration_form" class="myFormInputs"><br> 
		<label class="ques">Description</label><br>
		<input type="text" name="description" class="myFormInputs" required><br> 
		<input type="submit" value="Save" class="save myFormInputs" ><br>
		
	</form>
	<a href="EventController"><button class="back">Back</button></a>
	
	<jsp:include page="footer.html"></jsp:include>
</body>
</html>
