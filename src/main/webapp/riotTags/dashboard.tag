<dashboard>

	<div class="dashboard">
		<div class="dashboard-banner">
			<div class="dashboard-logo">
				<img src="img/bee-white.png" />
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
			<div class="dashboard-content-head">
				Daily Progress Chart
			</div>
			<div class="dashboard-content">
				<progressGraph></progressGraph>
			</div>
		</div>
		<div class="dashboard-food-history">
			<div class="dashboard-content-head">
				Today's Food History
			</div>
			<div class="dashboard-content">
				<div class="dashboard-food-history-lifetime">
					<table id= "food-table">
						
					</table>
				</div>
			</div>
		</div>
	</div>


	<script>
	
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

	bus.on('profileAcquired', function() {
		updateWelcomeMessage();
		populateDaysFood();
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
	
	function populateDaysFood() {
		var self = this;
		$.ajax({
			url: BASE_URL + "foodEvent/getEvents/day",
			type: "GET",
			data: {
				"searchDate" : currentDate
			},
			datatype: "json",
		}).done(function (data) {
			if(data.status === "success") {
				$("#food-table").empty();
				$("#food-table").append("<tr><th>Name</th><th>Calories</th><th>Servings</th><th>Delete</th></tr>");
				if(data.value.length > 0) {
					console.log(data);
					 for (var i = 0; i < data.value.length; i++) {
						 tempId = data.value[i].id;
						 $("#food-table").append("<tr><td>" + data.value[i].name + "</td><td>" + 
								 data.value[i].eventCalories + "</td><td>" + data.value[i].amountOfServings + 
								 "</td><td class='food-delete'><button onclick='$(\"dashboard\")[0]._tag.deleteFoodEvent("+ 
										 tempId + ")'>Delete</button></td></tr>");
					}
				}
			} else {
				console.log("No food events, you idiot.");
			}
		}).fail(function(xhr, status, error) {
			console.log(error);
		});
	}
	
	deleteFoodEvent(id) {
		$.ajax({
			url: BASE_URL + "foodEvent/delete",
			type: "POST",
			data: {
				"id": id,
			},
			datatype: "json",
		}).done(function (data) {
			console.log(data);
			populateDaysFood();
			bus.trigger('profileAcquired');
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
	
	logout() {
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
				$('blogPage').show();
				sessionStorage.setItem("loggedIn", null);
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
		
	
	/* //Open the menu
    jQuery("#hamburger").click(function() {
        ...
    });
 
    //close the menu
    jQuery("#contentLayer").click(function() {
        ...
    }); */
    
	$('button.hamburger').on('click', function(e) {
		$('button.hamburger').toggleClass('is-active');
		console.log('hamboigahs');
	    
	});
	
	$('mobile-menu-items').on('click', function(e) {
		$('button.hamburger').toggleClass('is-active')
	});
	
	$('#dashboard-foodlookup').on('click', function(e) {
		$('dashboard').hide();
		$('foodLookup').show();
	});
	</script>

</dashboard>