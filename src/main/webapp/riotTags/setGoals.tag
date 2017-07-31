<setGoals>
	<div class="content-blocker" onclick={close}>
	
		<div onclick = {noPropagate} class="set-goals">
			<h3>Set Goals</h3> <i onclick= { close } class="em em-x window-close"></i>
			<form onsubmit={editGoals}>
				<label for="targetWeight">Target Weight: </label>
				<div class="edit-targetWeight-container"><input id="edit-targetWeight" type="text" name="targetWeight" /> lbs</div><br>
				<label for="targetCalories">Daily Calories: </label>
				<div class="edit-targetCalories-container"><input id="edit-targetCalories" type="text" name="targetCalories" /></div><br>
				<div class="submitButton"><input type="submit" value="Set Goals"/></div>
			</form>
		</div>
	</div>
	
	<script>
		var self = this;

		close() {
			$('setGoals').hide();
		}
		
		noPropagate(e) {
			e.stopPropagation();
		}
		
		bus.on('profileAcquired', function() {
			getProfile();
		});
		
		function getProfile() {
			$.ajax({
				url: BASE_URL + "user/getGoals",
				type: "GET",
				datatype: "json",
			}).done(function(data){
				imperial = data.value.isImperial;
				console.log(data);
				if(data.status === "success"){
					$('#edit-targetCalories').val(data.value.targetCalories);
					if(imperial === "T") {
						$('.edit-targetWeight-container').html('<input id="edit-targetWeight" type="text" name="targetWeight" /> lbs');
						var pounds = (+data.value.targetWeight * 2.20462).toFixed(2);
						$("#edit-targetWeight").val(pounds);
					} else {
						$('.edit-targetWeight-container').html('<input id="edit-targetWeight" type="text" name="targetWeight" /> kg');
						$("#edit-targetWeight").val(data.value.targetWeight);
					}
				}
			}).fail(function(xhr, status, error){
				console.log(error);
			});
		}
			
		function convertToImperial() {
			if(imperial === "T") {
				var targetPounds = $('#edit-targetWeight').val();
				targetWeight = (+targetPounds / 2.20462).toFixed(2);
			} else {
				targetWeight = $('#edit-targetWeight').val();
			}
		}
		
		editGoals(e) {
			e.preventDefault();
			convertToImperial();
			var pounds = $('#edit-targetWeight').val();
			$.ajax({
				url: BASE_URL + "user/updateGoals",
				type: "POST",
				data: {
					"targetWeight" : targetWeight,
					"targetCalories" : $('#edit-targetCalories').val(),
				},
				datatype: "json",
			}).done(function (data) {
				console.log(data);
				if(data.status === "success") {
					$('setGoals').hide();
				}
			}).fail(function(xhr, status, error) {
				console.log(error);
			});
		}
		
		
	</script>

</setGoals>