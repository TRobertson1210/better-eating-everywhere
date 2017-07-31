<progressGraph>
	
	<div class="progress-graph-progress">
		<canvas id="myChart"></canvas>
	</div>
	<div class="progress-data">
		<div class="targetCals">Target: --</div>
		<div class="eatenCals">Eaten: --</div>
		<div class="overeatenCals">Overeaten: --</div>
		<button>Add a Food</button>
	</div>

	<script>
		
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
		var userCaloriesDay = 0;
		var userCaloriesWeek;
		var userCaloriesMonth;
		var userCaloriesYear;
		var userTargetCalories = 0;
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
				data: {
					"searchDate" : currentDate,
				},
				datatype: "json",
			}).done(function(data){
				console.log(data);
				if(data.status === "success"){
					$('span#current-calories').text(data.value[0].eventCalories);
					for (var i = 0; i < data.value.length; i++) {
						userCaloriesDay = +userCaloriesDay + +data.value[i].eventCalories;
					}
					$('.eatenCals').text('Eaten: ' + userCaloriesDay);
					bus.trigger('dailyGotten');
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
				$('.targetCals').text('Target: ' + userTargetCalories);
				if(userTargetCalories <= userCaloriesDay){
					$('.overeatenCals').text('Overeaten: ' + (+userCaloriesDay - +userTargetCalories));
				} else {
					$('.overeatenCals').text('Overeaten: --');
				}
				bus.trigger('graphInfoRetrieved');
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
		
		bus.on("profileAcquired", function(){
			loadFoodEventsDay();
			bus.on('dailyGotten', function(){
				loadCalorieInfo();
				bus.on("graphInfoRetrieved", function(){
					console.log(userTargetCalories);
					console.log(userCaloriesDay);
					console.log("horse");
					
					if (+userCaloriesDay <= +userTargetCalories) {
						var ctx = $("#myChart");
						var myChart = new Chart(ctx, {
						    type: 'doughnut',
						    data: {
						    	labels: ["Eaten", "Remaining"],
						    	datasets: [{
						            data: [userCaloriesDay, (+userTargetCalories - +userCaloriesDay)],
						            backgroundColor: [
						                '#42A2E8',
						                '#B0D1EA'
						            ],
						        }]
						    },
						    options: {
						    	responsive : true,
						    	maintainAspectRatio : false,
						    },
						});
					} else {
						var ctx = $("#myChart");
						var myChart = new Chart(ctx, {
						    type: 'doughnut',
						    data: {
						    	labels: ["Overeaten", "Eaten"],
						    	datasets: [{
						            data: [(+userCaloriesDay - +userTargetCalories), +userTargetCalories - (+userCaloriesDay - +userTargetCalories)],
						            backgroundColor: [
						                '#FF9564',
						                '#42A2E8'
						            ],
						        }]
						    },
						    options: {
						    	responsive : true,
						    	maintainAspectRatio : false,
						    	tooltips: {
						    		enabled: false
						    	},
						    },
						});
					}
				});
			});
		});
	</script>
</progressGraph>