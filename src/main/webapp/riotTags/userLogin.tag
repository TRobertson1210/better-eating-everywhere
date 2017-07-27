<userLogin>
<div class="content-blocker">


	<div onclick = {noPropagate} class="login">
		<div><i class="em em-clap"></i><i class="em em-clap"></i><i class="em em-clap"></i></div>
		<i onclick= { close } class="em em-x window-close"></i>

		<form onsubmit={login}>
			<span id="loginEmail-error"></span> <label for="loginEmail">Email
				Address: </label>
			<div>
				<input id="loginEmail" type="text" name="email"
					placeholder="example@mail.com" />
			</div>
			<br> <span id="loginPassword-error"></span> <label
				for="loginPassword">Password: </label> <div><input id="loginPassword"
				type="password" name="password" /></div><br>
			<div class="loginButton">
				<input type="submit" value="Login" />
			</div>
		</form>
	</div>
</div>

<script>
		this.title = opts.title;
		var self = this;
		var jsonResult;
		
		close(e) {
			$('userLogin').hide();
		}
		
		noPropagate(e) {
			e.stopPropagation();
		}
		
		login(e) {
			e.preventDefault();
			$.ajax({

				url: BASE_URL + "user/login",
				type: "POST",
				data: {
					"email" : $('#loginEmail').val(),
					"password" : $('#loginPassword').val(),
				},
				datatype: "json",
			}).done(function (data) {
				console.log(data);
				self.validate(data);
				jsonResult = data;
				if(data.status === "success") {
					$('userLogin').hide();
					$('homePage').hide();
					$('dashboard').show();
					bus.trigger('loginComplete');
				}
			}).fail(function(xhr, status, error) {
				console.log(error);
			}).always(function() {
				console.log("Gun");
			});
		}
		
		validate(jsonResult) {
			if(jsonResult.status === "failure") {
				if(jsonResult.value.email != null) {
					$('span#loginEmail-error').text(jsonResult.value.email);
				}
				if(jsonResult.value.password != null) {
					$('span#loginPassword-error').text(jsonResult.value.password);
				}
			}
		}
	</script>

</userLogin>