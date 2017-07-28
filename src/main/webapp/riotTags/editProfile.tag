<editProfile>
	<div class="content-blocker">
	
		<div onclick = {noPropagate} class="edit-profile">
			<h3>Edit Profile</h3> <i onclick= { close } class="em em-x window-close"></i>
			<form onsubmit={editProfile}>
				<label>Name: </label>
				<div><input id="edit-name" type="text" name="name" /></div><br>
				<label for="height">Height: </label>
				<div><input id="edit-height" type="number" name="height" /></div><br>
				<label for="weight">Weight: </label>
				<div><input id="edit-weight" type="number" name="weight" /></div><br>
				<label for="sex">Sex: </label>
				<div><select id="edit-sex" name="sex">
					<option value="M">Male</option>
					<option value="F">Female</option>
					<option value="O">Best</option>
				</select></div><br>
				<div class="submitButton"><input type="submit" value="Edit Profile"/></div>
			</form>
		</div>
	</div>
	
	<script>
		this.title = opts.title;
		var self = this;
		var jsonResult = null;
		
		$(document).ready(function(){
			
			getProfile(e) {
				e.preventDefault();
				$.ajax({
					url: BASE_URL + "user/getProfile",
					type: "GET",
					datatype: "json",
				}).done(function(data){
					jsonResult = data;
				}).fail(function(xhr, status, error){
					console.log(error);
				})
			}
			
			$("#edit-name").html("value=" + jsonResult.value.name);
			$("#edit-height").html("value=" + jsonResult.value.height);
			$("#edit-weight").html("value=" + jsonResult.value.weight);
	/* 		$("#edit-sex").html("value=" + jsonResult.value.sex); */	
		})

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