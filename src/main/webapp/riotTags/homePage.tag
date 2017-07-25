<homePage>
	<div class="homepage-content">
		<div class="homepage-signup">
			<div class="homepage-navbar">
				<nav class="navbar">
   					<img src="#" width="30" height="30" class="d-inline-block align-top" alt="">Tech Fitness Pal
				</nav>		
			</div>
			<div class="signup-content">
				<h2>Join the fastest growing weight loss app around!</h2>
				<h4>With 100% growth in user base in the past 5 minutes, Tech Fitness Studio is sure to be on all the top companies' radars.</h4>
				<h6>Join now while it's free!</h6>
				<button id="homepage-register">Register</button>
				<button id="homepage-login">Login</button>
			</div>
		</div>
	</div>
	
	<script>
	$(document).ready(function () {
		$('button#homepage-register').on('click', function(e) {
			$('homePage').after('<userRegistration class="userRegistration"></userRegistration>')
		});
		
		$('div.content-blocker').on('click', function(e) {
			$('userRegistration.userRegistration').remove()
		});
		$('button#homepage-login').on('click', function(e) {
			$('homePage').after('<userLogin class="userLogin"></userLogin>')
		});
		
		$('div.content-blocker').on('click', function(e) {
			$('userLogin.userLogin').remove()
		});
	});
	</script>

</homePage>