
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.assignment.utilities.*" %>
<%@page import="com.assignment.model.*" %>
<%@page import="com.assignment.servlets.*" %>
<%@page import="javax.sql.DataSource" %>
<%@page import="javax.annotation.Resource" %>
<%@page import="javax.naming.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" type="text/css" href="./css/style.css">
    <script src="./js/app.js"></script>
    <script src="./js/organization.js"></script>
</head>
<body>
<h1>===Welcome!! This is a list of all your members===</h1>
<hr/>

<%@ include file="./Page/membernavbar.jsp" %>


<div id="studentContent"></div>
   <table align = "center" >
   		<tr>
   		    <thead class="thead-dark">
                   <th >Name</th>
                   <th >Address</th>
                   <th >Id</th>
                   <th >RegistrationNumber</th>
                   <th >ExpiryDate</th>
               </thead>
   		</tr><br>
               <%
                   InitialContext context = new InitialContext() ;
                DataSource dataSource = (DataSource)context.lookup("java:jboss/datasources/LibraryAppDS");
               try
               {
                   Connection connection = dataSource.getConnection();
                   String query = "Select * from member";
                   Statement statement = connection.createStatement();
                   ResultSet result = statement.executeQuery(query);
                   int count = 0;
                   while(result.next())
                   {
                   count += 1;
                   %>

                   <tr>
                   <td><%=count%></td>
                   <td><%=result.getString("name")%></td>
                   <td><%=result.getString("address")%></td>
                   <td><%=result.getString("id")%></td>
                   <td><%=result.getString("regNo")%></td>
                   <td><%=result.getString("expiryDate")%></td>

                   </tr>
                   <%
                   }
               }
               catch(Exception ex)
               {
                   out.println("Exception:" +ex.getMessage());
                   ex.printStackTrace();
               }
               %>
   	</table>
</body>
</html>