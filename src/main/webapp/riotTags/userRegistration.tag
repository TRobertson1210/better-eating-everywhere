<userRegistration>
	
	<h3>{ title }</h3>
	
	<form onsubmit={register}>
		<label for="email">Email Address</label>
		<input id="email" type="text" name="email" placeholder="Email Address" /><br>
		<label for="password">Password</label>
		<input id="password" type="password" name="password" /><br>
		<input id="permissionLevel" type="hidden" value="2" name="permissionLevel" />
		<input type="submit" value="Register"/>
	</form>
	
	<script>
		this.title = opts.title;
		
		register(e) {
			$.ajax({
				url: "http://localhost:8080/capstone/user/register",
				type: "POST",
				datatype: "json",
			}).done(function (data) {
				console.log(data);
			}).fail(function(xhr, status, error) {
				console.log(error);
			}).always(function() {
				console.log("Gun");
			});
		};
	</script>

</userRegistration>