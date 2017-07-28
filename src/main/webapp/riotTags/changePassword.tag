<changePassword>
	<div class="content-blocker">
	
		<div onclick = {noPropagate} class="edit-password">
			<h3>Change Password</h3> <i onclick= { close } class="em em-x window-close"></i>
			<form onsubmit={editPassword}>
				<label for="password">Password: </label>
				<div><input id="edit-password" type="password" name="password" /></div><br>
				<label for="confirmPassword">Confirm Password: </label>
				<div><input id="edit-confirmPassword" type="password" name="confirmPassword" /></div><br>
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
					"name" : $('#edit-password').val(),
					"height" : $('#edit-confirmPassword').val(),
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