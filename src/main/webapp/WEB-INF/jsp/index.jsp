<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<link href="<c:url value="/css/site.css" />" rel="stylesheet"/>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/riot@3.6.1/riot+compiler.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>



	<homePage></homePage>
	<userregistration class="userRegistration"></userregistration>
	<userLogin class="userLogin"></userLogin>
	
	<c:url value="/riotTags/userRegistration.tag" var="userRegistrationLocation" />
	<script src="${userRegistrationLocation}" type="riot/tag"></script>
		
	<c:url value="/riotTags/userLogin.tag" var="userLoginLocation" />
	<script src="${userLoginLocation}" type="riot/tag"></script>
	
	<c:url value="/riotTags/foodLookup.tag" var="foodLookupLocation"/>
	<script src="${foodLookupLocation}" type="riot/tag"></script>
	
	<c:url value="/riotTags/homePage.tag" var="homePageLocation" />
	<script src="${homePageLocation}" type="riot/tag"></script>
		
	<script>
	window.BASE_URL = "<c:url value='/' />";
	
	riot.mount('homePage');
	riot.mount('userRegistration', {
		title: 'Register',
	});
	riot.mount('userLogin', {
		title: 'Login',
	});
	riot.mount('foodLookup',{
		title: 'Food Lookup',
	});
	</script>
</body>
</html>