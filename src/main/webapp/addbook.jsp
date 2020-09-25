<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" type="text/css" href="./css/style.css">
    <script src="./js/app.js"></script>
</head>
<body>
<h1>===Welcome to Book Manager ===</h1>
<h4>Use the form below to add a new book</h4>
<hr/>
<div class="navbar">
    <ul>
        <li><a class="active" href="Librarian.jsp">Home</a></li>
        <li><a href="addbook.html">Add A Book</a></li>
        <li><a href="viewbook.html">View All Books</a></li>


    </ul>
</div>
<form action="#" method="post" >
    Name: <input id="name" type="text" name="name" required/>
   Book-Id: <input id="bookId" type="text" name="bookId" required/>
   Author: <input id="author" type="text" name="author" required/>
   Title: <input id="title" type="text" name="title" required/>
   Price: <input id="price" type="text" name="price" required/>


   <button type="submit">Add Member</button>

</form>
<p id='result'></p>



</body>

</html>