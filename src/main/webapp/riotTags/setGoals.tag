<changePassword>
	<div class="content-blocker">
	
		<div onclick = {noPropagate} class="edit-goals">
			<h3>Set Goals</h3> <i onclick= { close } class="em em-x window-close"></i>
			<form onsubmit={editGoals}>
				<label for="targetWeight">Target Weight: </label>
				<div><input id="edit-targetWeight" type="number" name="targetWeight" /></div><br>
				<label for="targetCalories">Daily Calories: </label>
				<div><input id="edit-targetCalories" type="number" name="targetCalories" /></div><br>
				<div class="submitButton"><input type="submit" value="Set Goals"/></div>
			</form>
		</div>
	</div>
	
	<script>
		this.title = opts.title;
		var self = this;
		var jsonResult = null;

		close(e) {
			$('setGoals').hide();
		}
		
		noPropagate(e) {
			e.stopPropagation();
		}
		
		editProfile(e) {
			e.preventDefault();
			$.ajax({
				url: BASE_URL + "user/updateGoals",
				type: "POST",
				data: {
					"targetWeight" : $('#edit-targetWeight').val(),
					"targetCalories" : $('#edit-targetCalories').val(),
				},
				datatype: "json",
			}).done(function (data) {
				console.log(data);
				jsonResult = data;
				if(data.status === "success") {
					$('setGoals').hide();
				}
			}).fail(function(xhr, status, error) {
				console.log(error);
			});
		}
		
		
	</script>

</changePassword>