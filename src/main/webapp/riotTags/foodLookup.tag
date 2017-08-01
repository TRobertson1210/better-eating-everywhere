<foodLookup>

	<button id="homepage" onclick={backToHome}>Home</button>

	<h3>{title}</h3>
	
	
	<form>
		<label for="foodSearch">Search For Food</label>
		<input onchange={searchFoodGroup} id="foodSearch" type="text" name="foodSearch" placeholder="Enter Food Here" /><br />
	</form>
	
	<ul id="foodGroupInformation">
		<span id="foodGroupDad"></span>
	</ul>
	
	<ul id="servingInformation">
		<span id="servingDad"></span>
	</ul>
	
	<ul id="foodInformation">
		<span id="foodDad"></span>
	</ul>
	
	<ul id="foodNameList">
		<span id="listDad"></span>
	</ul>
	
	<!-- API KEY 
	dO8HHi951iNchZApEmVrvxdDyMrVLuGo1xpZQktf -->
	
	<script>
		var self = this;
		this.title = opts.title;
		
		var searchJSON;
		
		var foodJSON;
		
		var searchResults;
		
		var searchTerm;
		
		searchFoodGroup(e) {
			e.preventDefault();
			searchTerm = $("#foodSearch").val();
			$.ajax({
				url: "https://api.nal.usda.gov/ndb/search/?format=json&ds=Standard+Reference&q=" + searchTerm + "&sort=r&max=500&offset=0&api_key=dO8HHi951iNchZApEmVrvxdDyMrVLuGo1xpZQktf",
				type: "GET",
				datatype: "json",
			}).done(function (data) {
				$("#foodGroupDad").empty();
				searchJSON = data;
				searchResults = searchJSON.list.item;
				var foodGroupDad = $("#foodGroupDad");
				var foodGroupSet = new Set();
				for(var k = 0; k < searchResults.length; k++){
					foodGroupSet.add("" + searchResults[k].group);
				}
				var foodGroupList = [];
				foodGroupSet.forEach(foodGroup => foodGroupList.push(foodGroup));
				for(var p = 0; p < foodGroupSet.size; p++){
					foodGroupDad.append('<li onclick="$(\'foodLookup\')[0]._tag.searchFoodName(this, \'' + foodGroupList[p] + '\',\'' + searchTerm + '\')">' + foodGroupList[p] + '</li>')
				}
				console.log(data);
			}).fail(function(xhr, status, error) {
				console.log(error);
			});
		}
		
		searchFoodName(element, foodGroup, searchTerm) {
			$.ajax({
				url: "https://api.nal.usda.gov/ndb/search/?format=json&ds=Standard+Reference&q=" + searchTerm + "&fg=" + foodGroup + "&sort=r&max=500&offset=0&api_key=dO8HHi951iNchZApEmVrvxdDyMrVLuGo1xpZQktf",
				type: "GET",
				datatype: "json",
			}).done(function (data) {
				$("#listDad").empty();
				searchJSON = data;
				searchResults = searchJSON.list.item;
				var listDad = $("#listDad");
				for(var i = 0; i < searchResults.length; i++){
					listDad.append('<li onclick="$(\'foodLookup\')[0]._tag.foodName(this, ' + i + ')">' + searchResults[i].name + '</li>')
				}				
				console.log(data);
			}).fail(function(xhr, status, error) {
				console.log(error);
			}).always(function() {
			});
		};
		
		
		foodName(element, i){
			var number = searchResults[i].ndbno;
 			$.ajax({
				url: "https://api.nal.usda.gov/ndb/reports/?ndbno=" + number + "&type=b&format=json&api_key=dO8HHi951iNchZApEmVrvxdDyMrVLuGo1xpZQktf",
				type: "GET",
				datatype: "json",
			}).done(function (data) {
				foodJSON = data;
				var measures = foodJSON.report.food.nutrients[1].measures;
				for(var j = 0; j < measures.length; j++){
					$("#servingDad").append('<li>' + measures[j].qty + ' ' + measures[j].label + ' is ' + measures[j].value + ' kcal</li>');
				}
			});
		};


		backToHome(e) {
			$('homePage').show();
			$('foodLookup').hide();
		};
		
		
	</script>

</foodLookup>