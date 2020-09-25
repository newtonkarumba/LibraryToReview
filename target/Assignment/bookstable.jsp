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

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Books</title>

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/datatables-demo.js"></script>


</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="librarianDashboard.html">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">WELCOME LIBRARIAN</div>
        </a>



        <!-- Nav Item - Dashboard -->
        <li class="nav-item">
            <a class="nav-link" href="librarianDashboard.html">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Dashboard</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">


        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
                <i class="fas fa-fw fa-table"></i>
                <span>Tasks</span>
            </a>
            <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Available Tables:</h6>
                    <a class="collapse-item" href="tables.jsp">Members</a>
                    <a class="collapse-item" href="bookstable.jsp">Books</a>

                </div>
            </div>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
         <!--   <button class="rounded-circle border-0" id="sidebarToggle"></button> -->
        </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                <!-- Sidebar Toggle (Topbar) -->
                <form class="form-inline">
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>
                </form>

            </nav>
                <!-- Topbar Navbar -->
                <ul class="navbar-nav ml-auto">


            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <h1 class="h3 mb-2 text-gray-800">Books</h1>
                <p class="mb-4">These are all the books in the database</p>
            <a href="addbook.jsp" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Add Book</a>

                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Books</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <thead>
        <tr>
            <th>Name</th>
            <th>BookId</th>
            <th>Author</th>
            <th>Title</th>
            <th>Price</th>
            <th>Available</th>

        </tr>
        </thead>
<%
       InitialContext context = new InitialContext() ;
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

        <tbody>
<tr>

         <td><%=result.getString("name")%></td>
         <td><%=result.getString("bookId")%></td>
         <td><%=result.getString("author")%></td>
         <td><%=result.getString("title")%></td>
         <td><%=result.getString("price")%></td>
         <td><%=result.getString("Available")%></td>

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


        </tbody>
    <tfoot>
        <tr>
            <th>Name</th>
            <th>BookId</th>
            <th>Author</th>
            <th>Title</th>
            <th>Price</th>
            <th>Available</th>
        </tr>
    </tfoot>
</table>
                    </div>
                </div>
            </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy; LibraryApp 2020</span>
                </div>
            </div>
        </footer>
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>



</body>

</html>
