<progressGraph>
	
	<div class="progress-graph">
		<div class="progress-graph-progress">
			<span id="current-calories"></span> / <span id="total-calories"></span><br />
			<h3>calories</h3>
		</div>
		<div class="progress-graph-add-food">
			<button value="Add Food"></button>
		</div>
	</div>

	<script>
		bus.on('profileAcquired', function(){
			loadCalorieInfo();
			loadProfileInfo();
			loadFoodEventsDay();
		})
		
		var today = new Date();
		
		function formatMonth(date){
			if((date + 1) < 10){
				return '0' + (date + 1);
			} else {
				return (date + 1);
			}
		}
		
		function formatDate(date){
			if(date < 10){
				return '0' + date;
			} else {
				return date;
			}
		}
		
		var currentDate = today.getFullYear()+'-'+formatMonth(today.getMonth())+'-'+formatDate(today.getDate());
				
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
			console.log(currentDate);
			$.ajax({
				url: BASE_URL + "foodEvent/getEvents/day",
				type: "GET",
				data: {
					"searchDate" : currentDate,
				},
				datatype: "json",
			}).done(function(data){
				console.log(data);
				console.log(currentDate);
				if(data.status === "success"){
					foodEventsByDay = data.value;
					$('span#current-calories').text(data.value[0].eventCalories);
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
					userTargetCalories = data.value.targetCalories;
					$('span#total-calories').text(userTargetCalories);
					userTargetWeight = data.value.targetWeight;
					console.log(currentDate);
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

	</script>
</progressGraph>