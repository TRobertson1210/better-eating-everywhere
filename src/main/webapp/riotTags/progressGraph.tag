<progressGraph>
	<div class="progress-graph">
		<div class="progress-graph-progress">
			<canvas id="myChart"></canvas>
		</div>
		<div class="progress-graph-buttons">
			<button onclick={loadFoodEventsDay}>Daily</button>
			<button onclick={loadFoodEventsWeek}>Weekly</button>
			<button onclick={loadFoodEventsMonth}>Monthly</button>
			<button onclick={loadFoodEventsYear}>Yearly</button>
		</div>
	</div>
	<div class="progress-data">
		<h3 class="time-period">Today</h3>
		<div class="targetCals">Budget: --</div>
		<div class="eatenCals">Eaten: --</div>
		<div class="overeatenCals">Overeaten: --</div>
		<button>Add a Food</button>
		
	</div>

	<script>
		var self = this;
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
		var userCaloriesEaten = 0;
		var userCaloriesDay = 0;
		var userCaloriesWeek = 0;
		var userCaloriesMonth = 0;
		var userCaloriesYear = 0;
		var userTargetCalories = 0;
		var userInitialTargetCalories = 0;
		var userTargetWeight = 0;
		
		var foodEventsAll;
		var foodEventsByDay;
		var foodEventsByWeek;
		var foodEventsByMonth;
		var foodEventsByYear;
		
		loadAllFoodEvents(){
			$.ajax({
				url: BASE_URL + "foodEvent/getEvents/all",
				type: "GET",
				datatype: "json",
			}).done(function (data) {
				if(data.status === "success") {
					foodEventsAll = data.value;
				}
			}).fail(function(xhr, status, error) {
				console.log(error);
			});
		}
		
		loadFoodEventsDay(){
			$.ajax({
				url: BASE_URL + "foodEvent/getEvents/day",
				type: "GET",
				data: {
					"searchDate" : currentDate,
				},
				datatype: "json",
			}).done(function(data){
				if(data.status === "success"){
					userTargetCalories = userInitialTargetCalories;
					userCaloriesEaten = 0;
					for (var i = 0; i < data.value.length; i++) {
						userCaloriesEaten = +userCaloriesEaten + +data.value[i].eventCalories;
					}
					$('.time-period').text('Today');
					$('.targetCals').text('Budget: ' + userTargetCalories);
					$('.eatenCals').text('Eaten: ' + userCaloriesEaten);
					self.overEatenJSUpdate();
					bus.trigger('eventsRetrieved');
				}
			}).fail(function(xhr, status, error){
				console.log(error);
			});
		}
		
		loadFoodEventsWeek(){
			$.ajax({
				url: BASE_URL + "foodEvent/getEvents/week",
				type: "GET",
				data: {
					"searchDate" : currentDate,
				},
				datatype: "json",
			}).done(function(data){
				if(data.status === "success"){
					userTargetCalories = 7 * userInitialTargetCalories;
					userCaloriesEaten = 0;
					for (var i = 0; i < data.value.length; i++) {
						userCaloriesEaten = +userCaloriesEaten + +data.value[i].eventCalories;
					}
					$('.time-period').text('This Week');
					$('.targetCals').text('Budget: ' + userTargetCalories);
					$('.eatenCals').text('Eaten: ' + userCaloriesEaten);
					self.overEatenJSUpdate();
					bus.trigger('eventsRetrieved');
				}
			}).fail(function(xhr, status, error){
				console.log(error);
			}).always(function() {
				console.log("HORSE");
			});
		}
		
		loadFoodEventsMonth(){
			$.ajax({
				url: BASE_URL + "foodEvent/getEvents/month",
				type: "GET",
				data: {
					"searchDate" : currentDate,
				},
				datatype: "json",
			}).done(function(data){
				if(data.status === "success"){
					userTargetCalories = 30 * userInitialTargetCalories;
					userCaloriesEaten = 0;
					for (var i = 0; i < data.value.length; i++) {
						userCaloriesEaten = +userCaloriesEaten + +data.value[i].eventCalories;
					}
					$('.time-period').text('Past 30 Days');
					$('.targetCals').text('Budget: ' + userTargetCalories);
					$('.eatenCals').text('Eaten: ' + userCaloriesEaten);
					self.overEatenJSUpdate();
					bus.trigger('eventsRetrieved');
				}
			}).fail(function(xhr, status, error){
				console.log(error);
			});
		}
		
		loadFoodEventsYear(){
			$.ajax({
				url: BASE_URL + "foodEvent/getEvents/year",
				type: "GET",
				data: {
					"searchDate" : currentDate,
				},
				datatype: "json",
			}).done(function(data){
				userCaloriesEaten = 0;
				userTargetCalories = 365 * userInitialTargetCalories;
				if(data.status === "success"){
					for (var i = 0; i < data.value.length; i++) {
						userCaloriesEaten = +userCaloriesEaten + +data.value[i].eventCalories;
					}
					$('.time-period').text('This Year');
					$('.targetCals').text('Budget: ' + userTargetCalories);
					$('.eatenCals').text('Eaten: ' + userCaloriesEaten);
					self.overEatenJSUpdate();
					bus.trigger('eventsRetrieved');
				}
			}).fail(function(xhr, status, error){
				console.log(error);
			});
		}
		
		loadCalorieInfo(){
			$.ajax({
				url: BASE_URL + "user/getGoals",
				type: "GET",
				datatype: "json",
			}).done(function (data) {
				if(data.status === "success") {
					userTargetCalories = data.value.targetCalories;
					userInitialTargetCalories = data.value.targetCalories;
					$('span#total-calories').text(userTargetCalories);
					userTargetWeight = data.value.targetWeight;
					console.log(currentDate);
				}		
				bus.trigger('calorieInfoRetrieved');
			}).fail(function(xhr, status, error) {
				console.log(error);
			});
		}
		
		loadProfileInfo(){
			$.ajax({
				url: BASE_URL + "user/getProfile",
				type: "GET",
				datatype: "json",
			}).done(function (data) {
				if(data.status === "success") {
					var metricHeight = data.value.height;
					var metricWeight = data.value.weight;
					self.calculateBMI(metricHeight, metricWeight);
				}
			}).fail(function(xhr, status, error) {
				console.log(error);
			});
		}
		
		overEatenJSUpdate() {
			if(userTargetCalories <= userCaloriesDay){
				$('.overeatenCals').text('Overeaten: ' + (+userCaloriesEaten - +userTargetCalories));
			} else {
				$('.overeatenCals').text('Overeaten: --');
			}
		}
		
		//page load or reload
		
		bus.on("profileAcquired", function(){
			userCaloriesDay = 0;
			userTargetCalories = 0;
			self.loadCalorieInfo();
			bus.on('calorieInfoRetrieved', function(){
				self.loadFoodEventsDay();
				bus.on('eventsRetrieved', function(){
					$('.progress-graph-progress').html('<canvas id="myChart"></canvas>');
					if (+userCaloriesEaten <= +userTargetCalories) {
						var ctx = $("#myChart");
						myChart = new Chart(ctx, {
						    type: 'doughnut',
						    data: {
						    	labels: ["Eaten", "Remaining"],
						    	datasets: [{
						            data: [userCaloriesEaten, (+userTargetCalories - +userCaloriesEaten)],
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
						ctx.width = ctx.width;
						myChart = new Chart(ctx, {
						    type: 'doughnut',
						    data: {
						    	labels: ["Overeaten", "Eaten"],
						    	datasets: [{
						            data: [(+userCaloriesEaten - +userTargetCalories), +userTargetCalories - (+userCaloriesEaten - +userTargetCalories)],
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
		
		//selection made
		
		bus.on('eventsRetrieved', function(){
			$('.progress-graph-progress').html('<canvas id="myChart"></canvas>');
			if (+userCaloriesEaten <= +userTargetCalories) {
				var ctx = $("#myChart");
				ctx.width = ctx.width;
				myChart = new Chart(ctx, {
				    type: 'doughnut',
				    data: {
				    	labels: ["Eaten", "Remaining"],
				    	datasets: [{
				            data: [userCaloriesEaten, (+userTargetCalories - +userCaloriesEaten)],
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
				ctx.width = ctx.width;
				myChart = new Chart(ctx, {
				    type: 'doughnut',
				    data: {
				    	labels: ["Overeaten", "Eaten"],
				    	datasets: [{
				            data: [(+userCaloriesEaten - +userTargetCalories), +userTargetCalories - (+userCaloriesEaten - +userTargetCalories)],
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
		
	</script>
</progressGraph>