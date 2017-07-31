<progressGraph>
	
	<div class="progress-graph">
		<div class="progress-graph-progress">
			<span id="current-calories"></span> / <span id="total-calories"></span><br />
			<h3>calories</h3>
		</div>
		<div class="progress-graph-add-food">
			<button value="Add Food"></button>
		</div>
		
		<div><canvas id="myChart" width="400" height="400"></canvas></div>
	</div>

	<script>
	
	this.on("mount", function(){
		var ctx = $("#myChart");
		var myChart = new Chart(ctx, {
		    type: 'bar',
		    data: {
		        labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
		        datasets: [{
		            label: '# of Votes',
		            data: [12, 19, 3, 5, 2, 3],
		            backgroundColor: [
		                'rgba(255, 99, 132, 0.2)',
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(255, 206, 86, 0.2)',
		                'rgba(75, 192, 192, 0.2)',
		                'rgba(153, 102, 255, 0.2)',
		                'rgba(255, 159, 64, 0.2)'
		            ],
		            borderColor: [
		                'rgba(255,99,132,1)',
		                'rgba(54, 162, 235, 1)',
		                'rgba(255, 206, 86, 1)',
		                'rgba(75, 192, 192, 1)',
		                'rgba(153, 102, 255, 1)',
		                'rgba(255, 159, 64, 1)'
		            ],
		            borderWidth: 1
		        }]
		    },
		    options: {
		        scales: {
		            yAxes: [{
		                ticks: {
		                    beginAtZero:true
		                }
		            }]
		        }
		    }
		});
	});
	
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