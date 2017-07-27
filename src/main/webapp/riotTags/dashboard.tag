<dashboard>

	<div class="dashboard">
	
		<div class="dashboard-logo"><img src="img/tfs-logo.png" /></div>
		<div class="dashboard-welcome">Welcome!
		<div class="dashboard-gold-star">Star</div></div>
		<div class="dashboard-navigation">Nav List</div>
		<div class="dashboard-profile-settings">Profile Settings</div>
		<div class="dashboard-set-targets">Target Parameters</div>
		<div class="dashboard-daily-progress">Daily Progress Chart
			<div class="dashboard-lifetime-progress">Lifetime Progress</div>
		</div>
		<div class="dashboard-food-history">Food History Daily
			<div class="dashboard-food-history-lifetime">Food History Lifetime</div>
		</div>
	
	</div>


	<script>
	bus.on('loginComplete', function() {
		$.ajax({
			url: BASE_URL + "user/getProfile",
			type: "GET",
			datatype: "json",
		}).done(function (data) {
			if(data.status === "success") {
				console.log("Profile acquired!");
				if(data.value.name.length > 0) {
					$('.dashboard-welcome').text("Welcome, " + data.value.name + "!");
				}
			} else {
				console.log("No user in session");
			}
		}).fail(function(xhr, status, error) {
			console.log(error);
		});
	});
		
	</script>

</dashboard>