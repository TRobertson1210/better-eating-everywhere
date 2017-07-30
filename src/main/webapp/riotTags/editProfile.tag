<editProfile>
	<div class="content-blocker">
	
	
		<div onclick = {noPropagate} class="registration">
			<h3>Update Profile</h3> <i onclick= { close } class="em em-x window-close"></i>
			<form onsubmit={editProfile}>
				<label for="name">Name: </label>
				<div><input id="edit-name" type="text" name="name" /></div><br>
		 		<label for="isImperial">Measurement Units: </label>
		 		<div><select id="edit-isImperial" name="isImperial" onchange={changeImperialEdit}>
		 			<option value="T" selected>Imperial</option>
		 			<option value="F">Metric</option>
		 		</select></div><br>
		 		<div class="height-input-edit">
					<label class="height-feet-label">Height: </label>
					<div class="height-input-field-feet"><input id="edit-height-feet" type="number"/> ft.</div>
					<div class="height-input-field-inches"><input id="edit-height-inches" type="number"/> in.</div>
				</div><br>
				<label class="weight-label" for="edit-weight">Current Weight: </label>
				<div class="weight-input-edit"><input id="edit-weight" type="number" name="weight"/> lbs</div><br>
				<label for="edit-gender">Gender: </label>
				<div><input id="edit-gender" type="text" name="gender"></div><br>
				<div class="submitButton"><input type="submit" value="Update"/></div>
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
					"name" : $('#name').val(),
					"isImperial" : $('#isImperial').val(),
					"height" : height,
					"weight" : weight,
					"gender" : $('#gender').val(),
				},
				datatype: "json",
			}).done(function (data) {
				console.log(data);
				jsonResult = data;
				if(data.status === "success") {
					$('editProfile').hide();
					bus.trigger('profileAcquired');
				}
			}).fail(function(xhr, status, error) {
				console.log(error);
			});
		}
		
		changeImperialEdit() {
			if($('#isImperial').val() === "T") {
				$('.height-input-edit').html('<label class="height-feet-label">Height: </label><div class="height-input-field-feet"><input id="height-feet" type="number"/> ft.</div><div class="height-input-field-inches"><input id="height-inches" type="number"/> in.</div>');
				$('.weight-input-edit').html('<input id="weight" type="number" name="weight"/> lbs');
			} else {
				$('.height-input-edit').html('<label class="height-cm-label" for="height-cm">Height:</label><div class="height-input-field-cm"><input id="height-cm" type="number"/> cm</div>');
				$('.weight-input-edit').html('<input id="weight" type="number" name="weight"/> kg');
			}
		}
		
		
		
	</script>

</editProfile>