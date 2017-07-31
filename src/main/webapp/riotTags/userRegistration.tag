<userRegistration>
	<div class="content-blocker" onclick={close}>
	
		<div onclick = {noPropagate} class="registration">
			<h3>Registration</h3> <i onclick= { close } class="em em-x window-close"></i>
			<form onsubmit={register}>
				<span id="email-error"></span>
				<label>Email Address: </label>
				<div><input id="email" type="email" name="email" placeholder="example@mail.com" /></div><br>
				<span id="password-error"></span>
				<label for="password">Password: </label>
				<div><input id="password" type="password" name="password" /></div><br />
				<span id="confirmPassword-error"></span>
				<label for="confirmPassword">Confirm Password: </label>
				<div><input id="confirmPassword" type="password" name="confirmPassword" /></div><br />
				<label for="name">Name: </label>
				<div><input id="name" type="text" name="name" /></div><br />
		 		<label for="isImperial">Measurement Units: </label>
		 		<div><select id="isImperial" name="isImperial" onchange={changeImperial}>
		 			<option value="T" selected>Imperial</option>
		 			<option value="F">Metric</option>
		 		</select></div><br>
		 		<div class="height-input">
					<label class="height-feet-label">Height: </label>
					<div class="height-input-field-feet"><input id="height-feet" type="number"/> ft.</div>
					<div class="height-input-field-inches"><input id="height-inches" type="number"/> in.</div>
				</div><br />
				<label class="weight-label" for="weight">Current Weight: </label>
				<div class="weight-input"><input id="weight" type="number" name="weight"/> lbs</div><br />
				<label for="gender">Gender: </label>
				<div><input id="gender" type="text" name="gender"></div><br />
				<label class="targetWeight-label" for="targetWeight">Target Weight: </label>
				<div class="targetWeight-input"><input id="targetWeight" type="number" name="targetWeight"/> lbs</div><br />
				<label for="targetCalories">Target Daily Calories: </label>
				<div><input id="targetCalories" type="number" name="targetCalories"/></div><br />
				<input id="permissionLevel" type="hidden" value="2" name="permissionLevel" />
				<div class="submitButton"><input type="submit" value="Register"/></div>
			</form>
		</div>
	</div>
	
	<script>
		var self = this;
		var jsonResult = null;
		var height = null;
		var weight = null;
		var targetWeight = null;
		
		bus.on('removeRegForm', function() {
			removeRegisterInfo();
		});
		
		close(e) {
			removeRegisterInfo();
			$('userRegistration').hide();
		};
		
		changeImperial() {
			if($('#isImperial').val() === "T") {
				$('.height-input').html('<label class="height-feet-label">Height: </label><div class="height-input-field-feet"><input id="height-feet" type="number"/> ft.</div><div class="height-input-field-inches"><input id="height-inches" type="number"/> in.</div>');
				$('.weight-input').html('<input id="weight" type="number" name="weight"/> lbs');
				$('.targetWeight-input').html('<input id="targetWeight" type="number" name="targetWeight"/> lbs');
			} else {
				$('.height-input').html('<label class="height-cm-label" for="height-cm">Height:</label><div class="height-input-field-cm"><input id="height-cm" type="number"/> cm</div>');
				$('.weight-input').html('<input id="weight" type="number" name="weight"/> kg');
				$('.targetWeight-input').html('<input id="targetWeight" type="number" name="targetWeight"/> kg');
			}
		}
		
		function removeRegisterInfo() {
			$('#email').val(null);
			$('#password').val(null);
			$('#confirmPassword').val(null);
			$('#name').val(null);
			$('#isImperial').val("T");
			$('#height-feet').val(null);
			$('#height-inches').val(null);
			$('#height-cm').val(null);
			$('#weight').val(null);
			$('#gender').val(null);
			$('#targetWeight').val(null);
			$('#targetCalories').val(null);
			$('#permissionLevel').val(null);
			$('#email-error').text(null);
			$('#password-error').text(null);
			$('#confirmPassword-error').text(null);
		};
		
		noPropagate(e) {
			e.stopPropagation();
		};
		
		
		function convertToImperial() {
			if($('#isImperial').val() === "T") {
				var feet = $('#height-feet').val();
				var inches = $('#height-inches').val();
				var pounds = $('#weight').val();
				var targetPounds = $('#targetWeight').val();
				height = (((+feet * 12) + +inches) * 2.54).toFixed();
				weight = (+pounds / 2.20462).toFixed(2);
				targetWeight = (+targetPounds / 2.20462).toFixed(2);
			} else {
				height = $('#height-cm').val();
				weight = $('#weight').val();
				targetWeight = $('#targetWeight').val();
			}
		}
		
		
		
		register(e) {
			e.preventDefault();
			convertToImperial();
			$.ajax({
				url: BASE_URL + "user/register",
				type: "POST",
				data: {
					"email" : $('#email').val(),
					"password" : $('#password').val(),
					"confirmPassword" : $('#confirmPassword').val(),
					"name" : $('#name').val(),
					"isImperial" : $('#isImperial').val(),
					"height" : height,
					"weight" : weight,
					"gender" : $('#gender').val(),
					"targetWeight" : targetWeight,
					"targetCalories" : $('#targetCalories').val(),
					"permissionLevel" : $('#permissionLevel').val(),
				},
				datatype: "json",
			}).done(function (data) {
				console.log(data);
				self.validate(data);
				jsonResult = data;
				if(data.status === "success") {
					removeRegisterInfo();
					$('userRegistration').hide();
					$('userLogin').show();
				}
			}).fail(function(xhr, status, error) {
				console.log(error);
			});
		};
		
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
			}
		};
		
		
	</script>

</userRegistration>