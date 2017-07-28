<homePage>
	<div class="homepage-content">
		<div class="homepage-signup">
			<div class="homepage-navbar">
				<div class="banner"><img src="img/tfs-logo.png" />
				
				<div class="blur"></div>
				
				<div class="banner-content">
					<h2>Join the fastest growing weight loss app around!</h2>
					<h4>With 100% growth in user base in the past 5 minutes, Tech Fitness Studio is sure to be on all the top companies' radars.</h4>
					<h6>Join now while it's free!</h6>
					<button id="homepage-register">Register</button>
					<button id="homepage-login">Login</button>
					<button id="homepage-foodlookup">Food Look Up</button>
				</div>
				
				</div>	
			</div>
		</div>
	</div>
	
	<script>
	$(document).ready(function () {
		$('button#homepage-register').on('click', function(e) {
			$('userRegistration').show();
		});
		
		$('div.content-blocker').on('click', function(e) {
			bus.trigger('removeRegForm');
			$('userRegistration').hide();
		});
		
		$('button#homepage-login').on('click', function(e) {
			$('userLogin').show();
		});
		
		$('div.content-blocker').on('click', function(e) {
			bus.trigger('removeLoginInfo');
			$('userLogin').hide();
		});
		$('button#homepage-foodlookup').on('click', function(e) {
			$('homePage').hide();
			$('foodLookup').show();
		});
	});
	</script>

</homePage>