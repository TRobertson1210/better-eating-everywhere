<userRegistration>
	
	<h3>{ title }</h3>
	
	<form onsubmit={register} method="POST">
		<label for="email">Email Address</label>
		<input type="text" name="email" placeholder="Email Address" /><br>
		<label for="password">Password</label>
		<input type="password" name="password" /><br>
		<input type="hidden" value="2" name="permissionLevel" />
		<input type="submit" value="Register"/>
	</form>
	
	<script>
		this.title = opts.title;
		
		register(e) {
			e.preventDefault();
			$.ajax({
				url: "http://localhost:8080/capstone/users/register",
				type: "PUT",
				datatype: "json",
			}).done(function () {
				console.log("Success!");
			}).fail(function(xhr, status, error) {
				console.log(error);
			}).always(function() {
				console.log("Gun");
			});
		}
	</script>

</userRegistration>