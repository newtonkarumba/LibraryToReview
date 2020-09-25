<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" type="text/css" href="./css/style.css">
    <script src="./js/app.js"></script>
    <script src="./js/bookDesign.js"></script>
</head>
<body>
<h1>===Welcome!! This is a list of all the books===</h1>
<hr/>
<div class="navbar">
    <ul>
        <li><a class="active" href="Librarian.jsp">Home</a></li>
        <li><a href="addbook.html">Add Book</a></li>
        <li><a href="viewbook.html">View All Books</a></li>

    </ul>
</div>

<div id="bookContent"></div>
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
               Context context = new InitialContext();
                DataSource dataSource = (DataSource)context.lookup("java:jboss/datasources/LibraryAppDS");
               try
               {
                   Connection connection = dataSource.getConnection();
                   String query = "Select * from book";
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