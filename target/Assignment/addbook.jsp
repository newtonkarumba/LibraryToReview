<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" type="text/css" href="./css/style.css">
    <script src="./js/app.js"></script>
    <style>
  <style>
  body {
    margin: 0;
    font-family: Arial, Helvetica, sans-serif;
  }

  .hero-image {
    background-image: url("./img/woodbg.jpg");
    background-color: #cccccc;
    height: 500px;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    position: relative;
  }

  .hero-text {
    text-align: center;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    color: white;
  }
    </style>

</head>
<body>
<div class="hero-image">
  <div class="hero-text">

          <form method="post" action="bookServlet">
                Name: <input id="name" type="text" name="name" required/>
              BookID: <input id="bookId" type="text" name="bookId" required/>
                Author: <input id="author" type="text" name="author" required/>
                Title: <input id="title" type="text" name="title" required/>
                Price: <input id="price" type="text" name="price" required/>
                Available: <input id="Available" type="text" name="Available" required/>

                <button type="submit">Add Book</button>

            </form>

    </div>
</div>
  <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; LibraryApp 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

</body>
</html>