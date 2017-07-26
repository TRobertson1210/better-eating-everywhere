<userLogin>
	<div class="content-blocker">
	</div>

	<div class="login">
	<h3>{title}</h3>
	
	
	<form onsubmit={login}>
		<span id="loginEmail-error"></span>
		<label for="loginEmail">Email Address: </label>
		<div><input id="loginEmail" type="text" name="email" placeholder="example@mail.com" /></div><br>
		<span id="loginPassword-error"></span>
		<label for="loginPassword">Password: </label>
		<input id="loginPassword" type="password" name="password" /><br>
		<div class="loginButton"><input type="submit" value="Login"/></div>
	</form>
	
	</div>
	
	<script>
		this.title = opts.title;
		var self = this;
		var jsonResult;
		
		login(e) {
			e.preventDefault();
			$.ajax({
<<<<<<< HEAD
				url: BASE_URL.base_url + "/user/login",
=======
				url: BASE_URL + "user/login",
>>>>>>> 2e4825423f003b8c2e13f99e8df627a44baf2abe
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
				$('userLogin').hide();
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