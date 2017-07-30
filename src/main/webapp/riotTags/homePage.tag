<homePage>
	<div class="homepage-content">
		<div class="homepage-signup">
			<div class="homepage-navbar">
				<div class="banner"><img src="img/tfs-logo.png" />	
				
				<div class="banner-content">
					<h2>Join the fastest growing weight loss app around!</h2>
					<h4>With 100% growth in user base in the past 5 minutes, Tech Fitness Studio is sure to be on all the top companies' radars.</h4>
					<h6>Join now while it's free!</h6>
					<div class="button-container">
					<button onclick={showRegister}>Register</button>
					<button onclick={showLogin}>Login</button>
					</div>
				</div>
				
				</div>	
			</div>
		</div>
	</div>
	
<script>
	showRegister() {
		$('userRegistration').show();
	}
	
	showLogin() {
		$('userLogin').show();
	}
	
	$('div.content-blocker').on('click', function(e) {
		bus.trigger('removeRegForm');
		bus.trigger('removeLoginInfo');
		$('userRegistration').hide();
		$('userLogin').hide();
		$('editProfile').hide();
	});
		
</script>

</homePage>