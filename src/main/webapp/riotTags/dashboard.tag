<dashboard>

	<div class="dashboard">
		<div class="dashboard-banner">
			<div class="dashboard-logo">
				<img src="img/tfs-white.png" />
			</div>
			<div class="dashboard-welcome">
				<h1 class="dashboard-title">Welcome!</h1>
			</div>
		</div>
		<div class="hamburger-bar">
			<button class="hamburger .hamburger--3dx" type="button">
				  <span class="hamburger-box">
					    <span class="hamburger-inner">
					    	<ul class="mobile-menu-items">
					    		<button id="mobile-dashboard-foodlookup">Food Look Up</button>
					    		<button id="mobile-dashboard-edit-profile" onclick={showEditProfile}>Edit Profile</button><br />
								<button id="mobile-dashboard-set-goals" onclick={showSetGoals}>Set Goals</button>
								<button id="mobile-dashboard-logout" onclick={logout}>Logout</button>
					    	</ul>
					    </span>
				  </span>
			</button>
		</div>
		<div class="dashboard-navigation">
			<div class="dashboard-content-head">
				Nav List
			</div>
			<div class="dashboard-content">
				<button id="dashboard-foodlookup">Food Look Up</button>
			</div>
		</div>
		<div class="dashboard-profile-settings">
			<div class="dashboard-content-head">
				Profile Settings
			</div>
			<div class="dashboard-content">
				<button id="dashboard-edit-profile" onclick={showEditProfile}>Edit Profile</button><br />
				<button id="dashboard-set-goals" onclick={showSetGoals}>Set Goals</button>
				<button id="dashboard-logout" onclick={logout}>Logout</button>
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
				<progressGraph></progressGraph>
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
	bus.on('profileAcquired', function() {
		updateWelcomeMessage();
	});
	
	function updateWelcomeMessage() {
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
	}
	
	showEditProfile() {
		$('editProfile').show();
	}
	
	showSetGoals() {
		$('setGoals').show();
	}
	
	logout(e) {
		$.ajax({
			url: BASE_URL + "user/logout",
			type: "POST",
			datatype: "json",
		}).done(function (data) {
			if(data.status === "success") {
				console.log("Logout successful");
				$('dashboard').hide();
				$('.dashboard-welcome').html('<h1>Welcome!</h1>');
				$('homePage').show();
				$('.dummy-content').show();
				sessionStorage.setItem("loggedIn", null);
			} else {
				console.log("No user in session");
			}
		}).fail(function(xhr, status, error) {
			console.log(error);
		});
	};
	
	$('#dashboard-foodlookup').on('click', function(e) {
		$('dashboard').hide();
		$('foodLookup').show();
	});
	
	$('button.hamburger').on('click', function(e) {
		$('button.hamburger').toggleClass('is-active');
		console.log('hamboigahs');
	    // Do something else, like open/close menu
	});
		
	</script>

</dashboard>