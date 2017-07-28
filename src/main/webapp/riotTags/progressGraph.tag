<progressGraph>
	<canvas id="myChart" width="400" height="400"></canvas>


	<script>
		new Chart(document.getElementById("myChart"), {
		    type: 'doughnut',
		    data: {
		      labels: ["Eaten", "Remaining"],
		      datasets: [
		        {
		          label: "Calories",
		          backgroundColor: ["#FF0000", "#00FF00"],
		          data: [50,50]
		        }
		      ]
		    },
		    options: {
		      title: {
		        display: true,
		        text: "Today's calorie intake"
		      }
		    }
		});

	</script>
</progressGraph>