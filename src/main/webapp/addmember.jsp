<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" type="text/css" href="./css/style.css">
    <script src="./js/app.js"></script>

</head>
<body>
        <h1>===Welcome to Member Manager ===</h1>
        <h4>Use the form below to add a new member</h4>
        <hr/>

        <%@ include file="./Page/membernavbar.jsp" %>

          <form method="post" action="memberServlet">
                Name: <input id="name" type="text" name="name" required/>
                Address: <input id="address" type="text" name="address" required/>
                Id: <input id="id" type="text" name="id" required/>
                Registration No: <input id="regNo" type="text" name="regNo" required/>

                <button type="submit">Add Member</button>

            </form>

</body>
</html>