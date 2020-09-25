<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page isELIgnored ="false" %>
<html>
<head></head>
<body>
    <form action="#" method="post">
        Email:<input type="text" name="email"/>
        <input type="submit" value="Submit"/>
       </form>
         <c:set var="exampleVar" value="${param.email}" scope="application" />
            This is my email    <c:out value="${param.email}"/>



       <c:set var="exampleVar" value="This is a tag lib set" scope="session" />

       <c:out value="${exampleVar}"/>

       <br/>
       <a href="next.jsp"> Next</a>

</body>
</html>