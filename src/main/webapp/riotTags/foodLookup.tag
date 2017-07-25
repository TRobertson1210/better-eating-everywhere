<foodLookup>

	<h3>{title}</h3>
	
	
	<form>
		<label for="foodSearch">Search For Food</label>
		<input onchange={searchFoodName} id="foodSearch" type="text" name="foodSearch" placeholder="Enter Food Here" /><br>
	</form>
	
	<ul id="foodInformation">
		<span id="foodDad"></span>
	</ul>
	
	<ul id="foodNameList">
		<span id="listDad"></span>
	</ul>
	
	<!-- dO8HHi951iNchZApEmVrvxdDyMrVLuGo1xpZQktf -->
	
	<script>
		self = this;
		this.title = opts.title;
		
		var searchJSON;
		
		var foodJSON;
		
		var searchResults;
		
		var searchTerm;
		

		searchFoodName(e) {
			e.preventDefault();
			searchTerm = $("#foodSearch").val();
			$.ajax({
				url: "https://api.nal.usda.gov/ndb/search/?format=json&ds=Standard+Reference&q=" + searchTerm + "&sort=r&max=10&offset=0&api_key=dO8HHi951iNchZApEmVrvxdDyMrVLuGo1xpZQktf",
				type: "GET",
				datatype: "json",
			}).done(function (data) {
				$("#listDad").empty();
				searchJSON = data;
				searchResults = searchJSON.list.item;
				var listDad = $("#listDad");
				for(var i = 0; i < 10; i++){
					listDad.append('<li onclick="foodName(this)">' + searchResults[i].name + '</li>').append('<span style="visibility: hidden">' + i + '</span>')
				}				
				console.log(data);
			}).fail(function(xhr, status, error) {
				console.log(error);
			}).always(function() {
			});
		}
		
		var caloriesPer100G;
		
		foodName = function(element){
			var index = $(element).next().html();
			var number = searchResults[index].ndbno;
 			$.ajax({
				url: "https://api.nal.usda.gov/ndb/reports/?ndbno=" + number + "&type=b&format=json&api_key=dO8HHi951iNchZApEmVrvxdDyMrVLuGo1xpZQktf",
				type: "GET",
				datatype: "json",
			}).done(function (data) {
				foodJSON = data;
				caloriesPer100G = foodJSON.report.food.nutrients[1].value;
				$("#foodDad").append('<li>' + caloriesPer100G + '</li>');
			})
		};
		
		getFoodInfo() {
			var nbdno = searchResults.nbdno;
			$.ajax({
				url: "https://api.nal.usda.gov/ndb/reports/?ndbno=" + nbdno + "&type=b&format=json&api_key=dO8HHi951iNchZApEmVrvxdDyMrVLuGo1xpZQktf",
				type: "GET",
				datatype: "json",
			}).done(function (data) {
				foodJSON = data;
				caloriesPer100G = foodJSON.report.food.nutrients[1].value;
				$("#foodDad").append('<li>' + caloriesPer100G + '</li>');
			})
		}
		
		
	</script>

</foodLookup>