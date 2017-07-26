<homePage>
	<div class="homepage-content">
		<div class="homepage-signup">
			<div class="homepage-navbar">
				<nav class="navbar">
   					Tech Fitness Studio
				</nav>		
			</div>
			<div class="signup-content">
				<h2>Join the fastest growing weight loss app around!</h2>
				<h4>With 100% growth in user base in the past 5 minutes, Tech Fitness Studio is sure to be on all the top companies' radars.</h4>
				<h6>Join now while it's free!</h6>
				<button id="homepage-register">Register</button>
				<button id="homepage-login">Login</button>
				<button id="homepage-logout">Logout</button>
				<button id="homepage-foodlookup">Food Look Up</button>
			</div>
		</div>
	</div>
	
	<script>
	$(document).ready(function () {
		$('button#homepage-register').on('click', function(e) {
			$('userRegistration').show();
		});
		
		$('div.content-blocker').on('click', function(e) {
			$('userRegistration').hide()
		});
		
		$('button#homepage-login').on('click', function(e) {
			$('userLogin').show();
		});
		
		$('div.content-blocker').on('click', function(e) {
			$('userLogin').hide()
		});
		$('button#homepage-foodlookup').on('click', function(e) {
			$('homePage').hide();
			$('foodLookup').show();
		});
		
		$('button#homepage-logout').on('click', function(e) {
			$.ajax({
<<<<<<< HEAD
				url: BASE_URL.base_url + "/user/logout",
=======
				url: BASE_URL + "user/logout",
>>>>>>> 2e4825423f003b8c2e13f99e8df627a44baf2abe
				type: "POST",
				datatype: "json",
			}).done(function (data) {
				if(data.status === "success") {
					console.log("Logout successful");
				} else {
					console.log("No user in session");
				}
			}).fail(function(xhr, status, error) {
				console.log(error);
			}).always(function() {
				console.log("Gun");
			});
		});
	});
	</script>

</homePage>