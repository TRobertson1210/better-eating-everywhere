<changePassword>
	<div class="content-blocker">
	
		<div onclick = {noPropagate} class="edit-password">
			<h3>Change Password</h3> <i onclick= { close } class="em em-x window-close"></i>
			<form onsubmit={editPassword}>
				<label for="currentPassword">Password: </label>
				<div><input id="edit-current-password" type="password" name="currentPassword"/></div><br/>
				<label for="newPassword">New Password: </label>
				<div><input id="edit-new-password" type="password" name="newPassword" /></div><br>
				<label for="confirmPassword">Confirm New Password: </label>
				<div><input id="edit-confirm-new-password" type="password" name="confirmPassword" /></div><br>
				<div class="submitButton"><input type="submit" value="Change Password"/></div>
			</form>
		</div>
	</div>
	
	<script>
		this.title = opts.title;
		var self = this;
		var jsonResult = null;

		close(e) {
			$('changePassword').hide();
		}
		
		noPropagate(e) {
			e.stopPropagation();
		}
		
		editProfile(e) {
			e.preventDefault();
			$.ajax({
				url: BASE_URL + "user/changePassword",
				type: "POST",
				data: {
					"currentPassword" : $('#edit-current-password').val(),
					"newPassword" : $('#edit-password').val(),
					"confirmNewPassword" : $('#edit-confirmPassword').val(),
				},
				datatype: "json",
			}).done(function (data) {
				console.log(data);
				jsonResult = data;
				if(data.status === "success") {
					$('changePassword').hide();
				}
			}).fail(function(xhr, status, error) {
				console.log(error);
			});
		}
		
		
	</script>

</changePassword>