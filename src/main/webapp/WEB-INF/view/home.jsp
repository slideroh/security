<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>LK Home Page</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="resources/images/icons/favicon.ico"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="resources/vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="resources/fonts/iconic/css/material-design-iconic-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="resources/vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="resources/vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="resources/vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="resources/vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="resources/vendor/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="resources/css/util.css">
    <link rel="stylesheet" type="text/css" href="resources/css/main.css">
    <!--===============================================================================================-->
</head>
<body>

<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100 p-t-25 p-b-20">
            <h1 class="text-center">LK Home Page</h1>
            <p class="text-info">User: <security:authentication property="principal.username" /> | Role(s): <security:authentication property="principal.authorities" /></p>
            <hr>
            <p class="text-center">Welcome to the LK company home page!</p>
            <hr>
            <security:authorize access="hasRole('MANAGER')">
                <!-- Add a link to point to / leaders ... this is for the managers -->
                <p><a href="${pageContext.request.contextPath}/leaders" class="badge badge-primary">Leadership Meeting</a>(Only for Manager)</p>
            </security:authorize>
            <security:authorize access="hasRole('ADMIN')">
                <p><a href="${pageContext.request.contextPath}/systems" class="badge badge-primary">IT Systems Meeting</a>(Only for Admin)</p>
            </security:authorize>
            <!-- Logout button -->
            <form:form action="${pageContext.request.contextPath}/logout" method="POST">
                <div class="text-right"><input type="submit" value="Logout" class="btn btn-info mb-2" /></div>
            </form:form>
        </div>
    </div>
</div>


<div id="dropDownSelect1"></div>

<!--===============================================================================================-->
<script src="resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="resources/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="resources/vendor/bootstrap/js/popper.js"></script>
<script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="resources/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="resources/vendor/daterangepicker/moment.min.js"></script>
<script src="resources/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script src="resources/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
<script src="resources/js/main.js"></script>

</body>
</html>