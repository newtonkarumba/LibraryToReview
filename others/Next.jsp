<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page isELIgnored ="false" %>
<html>
<head></head>
<body>
    <form action="#" method="post">
        Email:<input type="text" name="email"/>
        <input type="submit" value="Submit"/>
       </form>

            This is email from the previous page    <c:out value="${param.email}"/>


</body>
</html>