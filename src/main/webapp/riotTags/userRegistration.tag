<userRegistration>
	<div class="content-blocker">
	</div>
		<div class="registration">
			<h3>{ title }</h3>
			<form onsubmit={register}>
				<span id="email-error"></span>
				<label>Email Address: </label>
				<div><input id="email" type="email" name="email" placeholder="example@mail.com" /></div><br>
				<span id="password-error"></span>
				<label for="password">Password: </label>
				<input id="password" type="password" name="password" /><br>
				<span id="confirmPassword-error"></span>
				<label for="confirmPassword">Confirm Password: </label>
				<input id="confirmPassword" type="password" name="confirmPassword" /><br>
				<span id="name"></span>
				<label for="name">Name: </label>
				<input id="name" type="text" name="name" /><br>
		<!-- 		<label for="isImperial">Measurement System: </label>
				<input id="isImperial" type="radio" name="" value="true">Imperial
				<input id="isImperial" type="radio" name="" value="false">Metric<br> -->
				<span id="height"></span>
				<label for="height">Height: </label>
				<div><input id="height" type="number" name="height"/></div><br>
				<span id="weight"></span>
				<label for="weight">Current Weight: </label>
				<div><input id="weight" type="number" name="weight"/></div><br>
				<span id="sex"></span>
				<label for="sex">Sex: </label>
				<select id="sex" name="sex">
					<option value="M">Male</option>
					<option value="F">Female</option>
					<option value="O">Best</option>
				</select><br>
				<span id="targetWeight"></span>
				<label for="targetWeight">Target Weight: </label>
				<div><input id="targetWeight" type="number" name="targetWeight"/></div><br>
				<span id="targetBMI"></span>
				<label for="targetBMI">Target BMI: </label>
				<div><input id="targetBMI" type="number" name="targetBMI"/></div><br>
				<input id="permissionLevel" type="hidden" value="2" name="permissionLevel" />
				<div class="submitButton"><input type="submit" value="Register"/></div>
			</form>
		</div>
	
	
	<script>
		this.title = opts.title;
		var self = this;
		var jsonResult = null;
		
		register(e) {
			e.preventDefault();
			$.ajax({
				url: BASE_URL.base_url + "/user/register",
				type: "POST",
				data: {
					"email" : $('#email').val(),
					"password" : $('#password').val(),
					"confirmPassword" : $('#confirmPassword').val(),
					"name" : $('#name').val(),
					"height" : $('#height').val(),
					"weight" : $('#weight').val(),
					"sex" : $('#sex').val(),
					"targetWeight" : $('#targetWeight').val(),
					"targetBMI" : $('#targetBMI').val(),
					"permissionLevel" : $('#permissionLevel').val(),
				},
				datatype: "json",
			}).done(function (data) {
				console.log(data);
				self.validate(data);
				jsonResult = data;
				$('userRegistration').hide();
			}).fail(function(xhr, status, error) {
				console.log(error);
			});
		}
		
		validate(jsonResult) {
			if(jsonResult.status === "failure") {
				if(jsonResult.value.email != null) {
					$('span#email-error').text(jsonResult.value.email);
				}
				if(jsonResult.value.password != null) {
					$('span#password-error').text(jsonResult.value.password);
				}
				if(jsonResult.value.confirmPassword != null) {
					$('span#confirmPassword-error').text(jsonResult.value.confirmPassword);
				}
				if(jsonResult.value.phoneNumber != null) {
					$('span#phoneNumber-error').text(jsonResult.value.phoneNumber);
				}
			}
		}
		
		
	</script>

</userRegistration>