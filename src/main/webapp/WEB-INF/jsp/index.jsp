<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<link href="https://afeld.github.io/emoji-css/emoji.css" rel="stylesheet" />
	<link href="<c:url value="/css/site.css" />" rel="stylesheet"/>
	<link href="<c:url value="/css/dashboard.css" />" rel="stylesheet"/>
	<link href="<c:url value="/css/login.css" />" rel="stylesheet"/>
	<link href="<c:url value="/css/registration.css" />" rel="stylesheet"/>
	<link href="<c:url value="/css/progressGraph.css" />" rel="stylesheet"/>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/riot@3.6.1/riot+compiler.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="pretty-doughtnut.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.1/Chart.min.js"></script>
</head>
<body>



	<homePage></homePage>
	<userregistration></userregistration>
	<userLogin></userLogin>
	<foodLookup></foodLookup>
	<dashboard></dashboard>
	<progressGraph></progressGraph>
	
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
	
	<c:url value="/riotTags/progressGraph.tag" var="graphLocation" />
	<script src="${graphLocation}" type="riot/tag"></script>
	
		
	<script>
	window.BASE_URL = "<c:url value="/" />";
	
	function Bus() {
		var self = this;
		riot.observable(self);
	}
	
	var bus = new Bus();

	riot.mount('*');
	</script>
</body>
</html>