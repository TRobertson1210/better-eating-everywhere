<editProfile>
	<div class="content-blocker">
	
	
		<div onclick = {noPropagate} class="registration">
			<h3>Registration</h3> <i onclick= { close } class="em em-x window-close"></i>
			<form onsubmit={editProfile}>
				<label for="name">Name: </label>
				<div><input id="edit-name" type="text" name="name" /></div><br>
		 		<label for="isImperial">Measurement Units: </label>
		 		<div><select id="edit-isImperial" name="isImperial" onchange={changeImperial}>
		 			<option value="T" selected>Imperial</option>
		 			<option value="F">Metric</option>
		 		</select></div><br>
		 		<div class="height-input">
					<label class="height-feet-label">Height: </label>
					<div class="height-input-field-feet"><input id="edit-height-feet" type="number"/> ft.</div>
					<div class="height-input-field-inches"><input id="edit-height-inches" type="number"/> in.</div>
				</div><br>
				<label class="weight-label" for="weight">Current Weight: </label>
				<div class="weight-input"><input id="weight" type="number" name="weight"/> lbs</div><br>
				<label for="gender">Gender: </label>
				<div><input id="gender" type="text" name="gender"></div><br>
				<div class="submitButton"><input type="submit" value="Register"/></div>
			</form>
		</div>
		
	</div>
	
	<script>
		var self = this;
		var jsonResult = null;
		
		bus.on("profileAcquired", function(){
			getProfile();
		});
		
		
			
		function getProfile() {
			$.ajax({
				url: BASE_URL + "user/getProfile",
				type: "GET",
				datatype: "json",
			}).done(function(data){
				console.log(data);
				if(data.status === "success"){
					$("#edit-name").val(data.value.name);
					$("#edit-height").val(data.value.height);
					$("#edit-weight").val(data.value.weight);
			 		$("#edit-gender").val(data.value.gender);
				}
			}).fail(function(xhr, status, error){
				console.log(error);
			});
		}
	
		

		close(e) {
			$('editProfile').hide();
		}
		
		noPropagate(e) {
			e.stopPropagation();
		}
		
		editProfile(e) {
			e.preventDefault();
			$.ajax({
				url: BASE_URL + "user/updateProfile",
				type: "POST",
				data: {
					"name" : $('#edit-name').val(),
					"height" : $('#edit-height').val(),
					"weight" : $('#edit-weight').val(),
					"sex" : $('#edit-sex').val(),
				},
				datatype: "json",
			}).done(function (data) {
				console.log(data);
				jsonResult = data;
				if(data.status === "success") {
					$('editProfile').hide();
					bus.trigger('editProfileComplete');
				}
			}).fail(function(xhr, status, error) {
				console.log(error);
			});
		}
		
		
	</script>

</editProfile>