<userRegistration>
	<div class="content-blocker">
	</div>
		<div class="registration">
			<h3>{ title }</h3>
			<form onsubmit={register}>
				<span id="email"></span>
				<label>Email Address: </label>
				<input id="email" type="text" name="email" placeholder="Email Address" required /><br>
				<span id="password"></span>
				<label for="password">Password: </label>
				<input id="password" type="password" name="password" required /><br>
				<span id="confirmPassword"></span>
				<label for="confirmPassword">Confirm Password: </label>
				<input id="confirmPassword" type="password" name="confirmPassword" required /><br>
				<span id="name"></span>
				<label for="name">Name: </label>
				<input id="name" type="text" name="name" /><br>
		<!-- 		<label for="isImperial">Measurement System: </label>
				<input id="isImperial" type="radio" name="" value="true">Imperial
				<input id="isImperial" type="radio" name="" value="false">Metric<br> -->
				<span id="height"></span>
				<label for="height">Height: </label>
				<input id="height" type="number" name="height" min="0"/><br>
				<span id="weight"></span>
				<label for="weight">Current Weight: </label>
				<input id="weight" type="number" name="weight" min="0"/><br>
				<span id="sex"></span>
				<label for="sex">Sex: </label>
				<select id="sex" name="sex">
					<option value="M">Male</option>
					<option value="F">Female</option>
					<option value="O">Best</option>
				</select><br>
				<span id="targetWeight"></span>
				<label for="targetWeight">Target Weight: </label>
				<input id="targetWeight" type="number" name="targetWeight" min="0"/><br>
				<span id="targetBMI"></span>
				<label for="targetBMI">Target BMI: </label>
				<input id="targetBMI" type="number" name="targetBMI" min="0" max="40"/><br>
				<span id="phoneNumber"></span>
				<label for="phoneNumber">Phone Number: </label>
				<input id="phoneNumber" type="text" name="phoneNumber" /><br>
				<input id="permissionLevel" type="hidden" value="2" name="permissionLevel" />
				<div class="submitButton"><input type="submit" value="Register"/></div>
			</form>
		</div>
	
	
	<script>
		var self = this;
		this.title = opts.title;
		var jsonResult = null;
		
		register(e) {
			e.preventDefault();
			$.ajax({
				url: "http://localhost:8080/capstone/user/register",
				type: "POST",
				data: {
					"email" : $('#email').val(),
					"password" : $('#password').val(),
					"confirmPassword" : $('#confirmPassword').val(),
					"name" : $('#name').val(),
					"isImperial" : $('#isImperial').val(),
					"height" : $('#height').val(),
					"weight" : $('#weight').val(),
					"sex" : $('#sex').val(),
					"targetWeight" : $('#targetWeight').val(),
					"targetBMI" : $('#targetBMI').val(),
					"phoneNumber" : $('#phoneNumber').val(),
					"permissionLevel" : $('#permissionLevel').val(),
				},
				datatype: "json",
			}).done(function (data) {
				console.log(data);
				self.validate(data);
				jsonResult = data;
			}).fail(function(xhr, status, error) {
				console.log(error);
			});
		}
		
		validate(jsonResult) {
			if(jsonResult.status === "failure") {
				if(jsonResult.value.email != null) {
					$('span#email').text(jsonResult.value.email);
				}
			}
		}
		
		
	</script>

</userRegistration>