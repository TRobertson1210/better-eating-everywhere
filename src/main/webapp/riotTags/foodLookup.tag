<foodLookup>

	<button id="homepage" onclick={backToHome}>Home</button>

	<h3>{title}</h3>
	
	
	<form>
		<label for="foodSearch">Search For Food</label>
		<input onchange={searchFoodName} id="foodSearch" type="text" name="foodSearch" placeholder="Enter Food Here" /><br>
	</form>
	
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
					listDad.append('<li onclick="$(\'foodLookup\')[0]._tag.foodName(this, ' + i + ')">' + searchResults[i].name + '</li>')
				}				
				console.log(data);
			}).fail(function(xhr, status, error) {
				console.log(error);
			}).always(function() {
			});
		}
		
		
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
					$("#servingDad").append('<li>' + measures[j].qty + ' ' + measures[j].label + ' is ' + measures[j].value + ' kcal' + '</li>')
				}
			});
		}


		backToHome(e) {
			$('homePage').show();
			$('foodLookup').hide();
		}
		
		
	</script>

</foodLookup>