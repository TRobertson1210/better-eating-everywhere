<progressGraph>
	
	<div id="progressNumbers">
		<span id="currentNumber"></span>
		<span id="targetNumber"></span>
	</div>


	<script>
		/* bus.on('loginComplete', function(){
			loadCalorieInfo();
			loadProfileInfo();
			loadFoodEvents();
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
		
		var currentWeek = [getDate(today.getDate()), getDate(today.getDate() -1), getDate(today.getDate() - 2), getDate(today.getDate()- 3), getDate(today.getDate() - 4), getDate(today.getDate() - 5), getDate(today.getDate() - 6))]
		
		var userBMI;
		var userCalories;
		var userTargetCalories;
		var userTargetWeight;
		
		var foodEventList;
		var foodEventsByDay;
		var foodEventsByWeek;
		var foodEventsByMonth;
		var foodEventsByYear;
		
		function getFoodEventsByDay(foodEventList, date){
			var foodEventsByDay = [];
			for(var i = 0; i < foodEventList.length; i++){
				if(foodEventList[i].dateEaten == date){
					foodEventsByDay.push(foodEventList[i]);
				}
			}
			return foodEventsByDay;
		};
		
		function getFoodEventsByWeek(foodEventList, week){
			var foodEventsByWeek = [];
			for(var i = 0; i < foodEventList.length; i++){
				if(week.indexOf(foodEventList[i].dateEaten.substring(7)) != -1){
					foodEventsByWeek.push(foodEventList[i]);
				}
			}
			return foodEventsByWeek;
		};
		
		function getFoodEventsByMonth(foodEventList, month){
			var foodEventsByMonth = [];
			for(var i = 0; i < foodEventList.length; i++){
				if(foodEventList[i].dateEaten.substring(5, 7) == month){
					foodEventsByMonth.push(foodEventList[i]);
				}
			}
			return foodEventsByMonth;
		};
		
		function getFoodEventsByYear(foodEventList){
			var foodEventsByDay = [];
			for(var i = 0; i < foodEventList.length; i++){
				if(foodEventList[i].dateEaten.substring(0, 5) == currentDate){
					foodEventsByYear.push(foodEventList[i]);
				}
			}
			return foodEventsByYear;
		};
		
		function loadFoodEvents(){
			$.ajax({
				url: BASE_URL + "foodEvent/getEvents",
				type: "GET",
				datatype: "json",
			}).done(function (data) {
				console.log(data);
				if(data.status === "success") {
					foodEventList = data.value;
					foodEventsByDay = getFoodEventsByDay(foodEventList, getDate(today.getDate()));
					foodEventsByWeek = getFoodEventsByWeek(foodEventList, currentWeek);
					foodEventsByMonth = getFoodEventsByMonth(foodEventList, getMonth(today.getMonth()));
				}
			}).fail(function(xhr, status, error) {
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