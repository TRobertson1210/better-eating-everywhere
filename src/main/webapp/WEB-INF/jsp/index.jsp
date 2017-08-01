<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<title>Buzz Buzz!</title>

	<link href="https://afeld.github.io/emoji-css/emoji.css" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Finger+Paint" rel="stylesheet">
	<link rel="stylesheet" href="https://unpkg.com/blaze">
	<link rel="shortcut icon" href="<c:url value="/img/burger.ico"/>"  type="image/x-icon" />
	<link href="<c:url value="/css/site.css" />" rel="stylesheet"/>
	<link href="<c:url value="/css/dashboard.css" />" rel="stylesheet"/>
	<link href="<c:url value="/css/login.css" />" rel="stylesheet"/>
	<link href="<c:url value="/css/registration.css" />" rel="stylesheet"/>	
	<link href="<c:url value="/css/food-lookup.css" />" rel="stylesheet"/>
	<link href="<c:url value="/css/edit-profile.css" />" rel="stylesheet"/>
	<link href="<c:url value="/css/progress-graph.css" />" rel="stylesheet" />
	<link href="<c:url value="/css/set-goals.css" />" rel="stylesheet" />
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/riot@3.6.1/riot+compiler.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/riotgear/latest/rg.min.js"></script>
</head>
<body>



	<homePage></homePage>
	<blogPage></blogPage>
	<userregistration></userregistration>
	<userLogin></userLogin>
	<foodLookup></foodLookup>
	<dashboard></dashboard>
	<editProfile></editProfile>
 	<setGoals></setGoals>
	
	<footer>Created by the members of Team Alpha</footer>
	
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
	
	<c:url value="/riotTags/progressGraph.tag" var="progressLocation" />
	<script src="${progressLocation}" type="riot/tag"></script>
	
	<c:url value="/riotTags/setGoals.tag" var="setGoalsLocation" />
	<script src="${setGoalsLocation}" type="riot/tag"></script>

	
	
		
	<script>
	window.BASE_URL = "<c:url value="/" />";
	
	riot.mount('*');
	
	function Bus() {
		var self = this;
		riot.observable(self);
	}
	
	var bus = new Bus();
	
	
	</script>
</body>
</html>