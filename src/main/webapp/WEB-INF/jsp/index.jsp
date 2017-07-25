<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/riot@3.6.1/riot+compiler.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>

	<userRegistration></userRegistration>
	<userLogin></userLogin>
	
	<c:url value="/riotTags/userRegistration.tag" var="userRegistrationLocation" />
	<script src="${userRegistrationLocation}" type="riot/tag"></script>
		
	<c:url value="/riotTags/userLogin.tag" var="userLoginLocation" />
	<script src="${userLoginLocation}" type="riot/tag"></script>
		
	<script>
	window.CREATE_URL = "<c:url value="/users/register/"/>"
	
	riot.mount('userRegistration', {
		title: 'Registration',
	});
	riot.mount('userLogin', {
		title: 'Login',
	});
	</script>
</body>



</html>