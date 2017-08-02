<foodLookup>
	<div class="content-blocker" onclick={close}>
	
		<div onclick = {noPropagate} class="food-lookup">
			<h3>Food Lookup</h3> <i onclick= { close } class="em em-x window-close"></i>
			
			
			<form onsubmit={searchFoodGroup}>
				<label for="foodSearch">Search For Food</label>
				<input id="foodSearch" type="text" name="foodSearch" placeholder="Enter Food Here" /><br />
				<div class="submitButton"><input type="submit" value="Search"/></div>
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
		</div>
	</div>
	
	<!-- API KEY 
	dO8HHi951iNchZApEmVrvxdDyMrVLuGo1xpZQktf -->
	
	<script>
		var self = this;
		
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
		
		close() {
			$('foodLookup').hide();
		}
		
		noPropagate(e) {
			e.stopPropagation();
		};
		
	</script>

</foodLookup>