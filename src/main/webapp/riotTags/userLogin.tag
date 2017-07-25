<userLogin>

	<h3>{title}</h3>
	
	
	<form onsubmit={login}>
		<label for="loginEmail">Email Address</label>
		<input id="loginEmail" type="text" name="email" placeholder="Email Address" /><br>
		<label for="loginPassword">Password</label>
		<input id="loginPassword" type="password" name="password" /><br>
		<input type="submit" value="Login"/>
	</form>
	
	<script>
		this.title = opts.title;
		
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
			}).fail(function(xhr, status, error) {
				console.log(error);
			}).always(function() {
				console.log("Gun");
			});
		}
	</script>

</userLogin>