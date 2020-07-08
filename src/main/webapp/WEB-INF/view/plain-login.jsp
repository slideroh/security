<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Login Page</title>
</head>
<body>
<h3>My Custom Login Page</h3>
<form:form action="${pageContext.request.contextPath}/authenticateTheUser" method="POST">

    <!-- Check for login error -->
    <c:if test="${param.error != null}">
        <i style="color: crimson">Sorry! You entered invalid username/password.</i>
    </c:if>

    <p>User name: <label>
        <input type="text" name="username" />
    </label></p>

    <p>Password: <label>
        <input type="password" name="password" />
    </label></p>

    <input type="submit" value="Login" />
</form:form>

</body>
</html>
