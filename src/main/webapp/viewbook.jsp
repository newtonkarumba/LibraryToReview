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
<script>
        AssignmentJsLib.viewBook.call();
    </script>
</body>
</html>