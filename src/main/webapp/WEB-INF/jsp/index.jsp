<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<link href="https://afeld.github.io/emoji-css/emoji.css" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Finger+Paint" rel="stylesheet">
	<link rel="stylesheet" href="https://unpkg.com/blaze">
	<link href="<c:url value="/css/site.css" />" rel="stylesheet"/>
	<link href="<c:url value="/css/dashboard.css" />" rel="stylesheet"/>
	<link href="<c:url value="/css/login.css" />" rel="stylesheet"/>
	<link href="<c:url value="/css/registration.css" />" rel="stylesheet"/>	
	<link href="<c:url value="/css/food-lookup.css" />" rel="stylesheet"/>
	<link href="<c:url value="/css/edit-profile.css" />" rel="stylesheet"/>
	<link href="/css/hamburgers.css" rel="stylesheet">
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/riot@3.6.1/riot+compiler.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
</head>
<body>



	<homePage></homePage>
	<div class = "dummy-content">
		<blogPage></blogPage>
		<newsPage></newsPage>
	</div>
	<userregistration></userregistration>
	<userLogin></userLogin>
	<foodLookup></foodLookup>
	<dashboard></dashboard>
	<editProfile></editProfile>
	<rg-chart></rg-chart>
	
	<c:url value="/riotTags/userRegistration.tag" var="userRegistrationLocation" />
	<script src="${userRegistrationLocation}" type="riot/tag"></script>
		
	<c:url value="/riotTags/userLogin.tag" var="userLoginLocation" />
	<script src="${userLoginLocation}" type="riot/tag"></script>
	
	<c:url value="/riotTags/foodLookup.tag" var="foodLookupLocation"/>
	<script src="${foodLookupLocation}" type="riot/tag"></script>
	
	<c:url value="/riotTags/homePage.tag" var="homePageLocation" />
	<script src="${homePageLocation}" type="riot/tag"></script>
	
	<c:url value="/riotTags/dashboard.tag" var="dashboardLocation" />
	<script src="${dashboardLocation}" type="riot/tag"></script>
	
	<c:url value="/riotTags/editProfile.tag" var="editProfileLocation" />
	<script src="${editProfileLocation}" type="riot/tag"></script>
	
	<c:url value="/riotTags/blogPage.tag" var="blogPageLocation" />
	<script src="${blogPageLocation}" type="riot/tag"></script>
	
	<c:url value="/riotTags/newsPage.tag" var="newsPageLocation" />
	<script src="${newsPageLocation}" type="riot/tag"></script>
	

	
	
		
	<script>
	window.BASE_URL = "<c:url value="/" />";
	
	function Bus() {
		var self = this;
		riot.observable(self);
	}
	
	var bus = new Bus();
	
	$(document).ready(function(){
		userCheck();
	});
	
	function userCheck() {
		$.ajax({
			url: BASE_URL + "user/getProfile",
			type: "GET",
			datatype: "json",
		}).done(function (data) {
			if(data.status === "success") {
				$('homePage').hide();
				$('.dummy-content').hide();
				$('dashboard').show();
				bus.trigger('profileAcquired');
			} else {
				console.log("No user in session");
			}
		}).fail(function(xhr, status, error) {
			console.log(error);
		});
	}

	riot.mount('*');
	</script>
</body>
</html>