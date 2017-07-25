<userLogin>
	<div class="content-blocker">
	</div>

	<div class="login">
	<h3>{title}</h3>
	
	
	<form onsubmit={login}>
		<span id="email"></span>
		<label for="loginEmail">Email Address: </label>
		<input id="loginEmail" type="text" name="email" placeholder="Email Address" /><br>
		<span id="password"></span>
		<label for="loginPassword">Password: </label>
		<input id="loginPassword" type="password" name="password" /><br>
		<div class="loginButton"><input type="submit" value="Login"/></div>
	</form>
	
	</div>
	
	<script>
		this.title = opts.title;
		var self = this;
		var jsonResult = null;
		
		login(e) {
			e.preventDefault();
			$.ajax({
				url: "http://localhost:8080/capstone/user/login",
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
			}).fail(function(xhr, status, error) {
				console.log(error);
			}).always(function() {
				console.log("Gun");
			});
		}
		
		validate(jsonResult) {
			if(jsonResult.status === "failure") {
				if(jsonResult.value.email != null) {
					$('span#email').text(jsonResult.value.email);
				}
				if(jsonResult.value.password != null) {
					$('span#password').text(jsonResult.value.password);
				}
			}
		}
	</script>

</userLogin>