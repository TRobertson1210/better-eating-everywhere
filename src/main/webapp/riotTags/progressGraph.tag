<progressGraph>
	
	<div id="progressNumbers">
		<span id="currentNumber"></span>
		<span id="targetNumber"></span>
	</div>


	<script>
		bus.on('loginComplete', function(){
			loadCalorieInfo();
			loadProfileInfo();
		})
		
		var today = new Date();
		
		function getMonth(date){
			if(month < 10){
				month = '0' + month;
			}
		}
		
		function getDate(date){
			if(date < 10){
				date = '0' + day;
			}
		}
		
		var currentDate = today.getFullYear()+'-'+getMonth(today.getMonth())+'-'+getDate(today.getDate());
				
		var userBMI;
		var userCalories;
		var userTargetCalories;
		var userTargetWeight;
		
		var foodEventsAll;
		var foodEventsByDay;
		var foodEventsByWeek;
		var foodEventsByMonth;
		var foodEventsByYear;
		
		function loadAllFoodEvents(){
			$.ajax({
				url: BASE_URL + "foodEvent/getEvents/all",
				type: "GET",
				datatype: "json",
			}).done(function (data) {
				console.log(data);
				if(data.status === "success") {
					foodEventsAll = data.value;
				}
			}).fail(function(xhr, status, error) {
				console.log(error);
			});
		}
		
		function loadFoodEventsDay(){
			$.ajax({
				url: BASE_URL + "foodEvent/getEvents/day",
				type: "GET",
				datatype: "json",
			}).done(function(data){
				console.log(data);
				if(data.status === "success"){
					foodEventsByDay = data.value;
				}
			}).fail(function(xhr, status, error){
				console.log(error);
			});
		}
		
		function loadFoodEventsWeek(){
			$.ajax({
				url: BASE_URL + "foodEvent/getEvents/week",
				type: "GET",
				datatype: "json",
			}).done(function(data){
				console.log(data);
				if(data.status === "success"){
					foodEventsByWeek = data.value;
				}
			}).fail(function(xhr, status, error){
				console.log(error);
			});
		}
		
		function loadFoodEventsMonth(){
			$.ajax({
				url: BASE_URL + "foodEvent/getEvents/month",
				type: "GET",
				datatype: "json",
			}).done(function(data){
				console.log(data);
				if(data.status === "success"){
					foodEventsByMonth = data.value;
				}
			}).fail(function(xhr, status, error){
				console.log(error);
			});
		}
		
		function loadFoodEventsYear(){
			$.ajax({
				url: BASE_URL + "foodEvent/getEvents/year",
				type: "GET",
				datatype: "json",
			}).done(function(data){
				console.log(data);
				if(data.status === "success"){
					foodEventsByYear = data.value;
				}
			}).fail(function(xhr, status, error){
				console.log(error);
			});
		}
		
		function loadCalorieInfo(){
			$.ajax({
				url: BASE_URL + "user/getGoals",
				type: "GET",
				datatype: "json",
			}).done(function (data) {
				console.log(data);
				if(data.status === "success") {
					userTargetCalories = data.values.targetCalories;
					userTargetWeight = data.values.targetWeight;
				}
			}).fail(function(xhr, status, error) {
				console.log(error);
			});
		}
		
		function loadProfileInfo(){
			$.ajax({
				url: BASE_URL + "user/getProfile",
				type: "GET",
				datatype: "json",
			}).done(function (data) {
				console.log(data);
				if(data.status === "success") {
					var metricHeight = data.value.height;
					var metricWeight = data.value.weight;
					calculateBMI(metricHeight, metricWeight);
				}
			}).fail(function(xhr, status, error) {
				console.log(error);
			});
		}
		
		function calculateBMI(height, weight){
			userBMI = weight / (height * height);
		}
	
 */	

	</script>
</progressGraph>