<dashboard>

	<div class="dashboard">
		<div class="dashboard-banner">
			<div class="dashboard-logo">
				<img src="img/tfs-logo.png" />
			</div>
			<div class="dashboard-welcome">
				<h1>Welcome!</h1>
				<div class="dashboard-gold-star">
					Star
				</div>
			</div>
		</div>
		<div class="dashboard-navigation">
			<div class="dashboard-content-head">
				Nav List
			</div>
			<div class="dashboard-content">
				links
			</div>
		</div>
		<div class="dashboard-profile-settings">
			<div class="dashboard-content-head">
				Profile Settings<br>
			</div>
			<div class="dashboard-content">
				<button id="homepage-logout" onclick={logout}>Logout</button>
			</div>
		</div>
		<div class="dashboard-daily-progress">
			<div class="dashboard-set-targets">
				<div class="dashboard-content-head">
					Target Parameters
				</div>
				<div class="dashboard-content">
				</div>
			</div>
			<div class="dashboard-content-head">
				Daily Progress Chart
			</div>
			<div class="dashboard-content">
				<div class="dashboard-lifetime-progress">
					Lifetime Progress
				</div>
			</div>

		</div>
		<div class="dashboard-food-history">
			<div class="dashboard-content-head">
				Food History Daily
			</div>
			<div class="dashboard-content">
				<div class="dashboard-food-history-lifetime">
					Food History Lifetime
				</div>
			</div>
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
					$('.dashboard-welcome').html('<h1>Welcome, ' + data.value.name + '!</h1>');
				}
			} else {
				console.log("No user in session");
			}
		}).fail(function(xhr, status, error) {
			console.log(error);
		});
	});
	
	logout(e) {
		$.ajax({
			url: BASE_URL + "user/logout",
			type: "POST",
			datatype: "json",
		}).done(function (data) {
			if(data.status === "success") {
				console.log("Logout successful");
				$('dashboard').hide();
				$('homePage').show();
			} else {
				console.log("No user in session");
			}
		}).fail(function(xhr, status, error) {
			console.log(error);
		});
	};
		
	</script>

</dashboard>