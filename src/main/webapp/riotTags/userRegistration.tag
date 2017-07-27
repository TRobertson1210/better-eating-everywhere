<userRegistration>
	<div class="content-blocker">
	
		<div onclick = {noPropagate} class="registration">
			<h3>Registration</h3> <i onclick= { close } class="em em-x window-close"></i>
			<form onsubmit={register}>
				<span id="email-error"></span>
				<label>Email Address: </label>
				<div><input id="email" type="email" name="email" placeholder="example@mail.com" /></div><br>
				<span id="password-error"></span>
				<label for="password">Password: </label>
				<div><input id="password" type="password" name="password" /></div><br>
				<span id="confirmPassword-error"></span>
				<label for="confirmPassword">Confirm Password: </label>
				<div><input id="confirmPassword" type="password" name="confirmPassword" /></div><br>
				<label for="name">Name: </label>
				<div><input id="name" type="text" name="name" /></div><br>
		<!-- 		<label for="isImperial">Measurement System: </label>
				<input id="isImperial" type="radio" name="" value="true">Imperial
				<input id="isImperial" type="radio" name="" value="false">Metric<br> -->
				<label for="height">Height: </label>
				<div><input id="height" type="number" name="height"/></div><br>
				<label for="weight">Current Weight: </label>
				<div><input id="weight" type="number" name="weight"/></div><br>
				<label for="sex">Sex: </label>
				<div><select id="sex" name="sex">
					<option value="M">Male</option>
					<option value="F">Female</option>
					<option value="O">Best</option>
				</select></div><br>
				<label for="targetWeight">Target Weight: </label>
				<div><input id="targetWeight" type="number" name="targetWeight"/></div><br>
				<label for="targetBMI">Target BMI: </label>
				<div><input id="targetBMI" type="number" name="targetBMI"/></div><br>
				<input id="permissionLevel" type="hidden" value="2" name="permissionLevel" />
				<div class="submitButton"><input type="submit" value="Register"/></div>
			</form>
		</div>
	</div>
	
	<script>
		this.title = opts.title;
		var self = this;
		var jsonResult = null;
		
		close(e) {
			$('userRegistration').hide();
		}
		
		noPropagate(e) {
			e.stopPropagation();
		}
		
		register(e) {
			e.preventDefault();
			$.ajax({
				url: BASE_URL + "/user/register",
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