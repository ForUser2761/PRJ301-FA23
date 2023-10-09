<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SB Admin - Dashboard</title>

        <!-- Custom fonts for this template-->
        <link href="../../../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

        <!-- Page level plugin CSS-->
        <link href="../../../vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="../../../css/sb-admin.css" rel="stylesheet">

        <link rel="stylesheet" href="../../../css/colReorder-bootstrap4.css">

    </head>

    <body id="page-top">
        <jsp:include page="../../common/admin/navigationBar.jsp"></jsp:include>

            <div id="wrapper">

                <!-- Sidebar -->
            <jsp:include page="../../common/admin/sideBar.jsp"></jsp:include>

                <div id="content-wrapper">

                    <div class="container-fluid">

                        <!-- Breadcrumbs-->
                    <jsp:include page="../../common/admin/breadCumb.jsp"></jsp:include>

                        <!-- Icon Cards-->
                    <jsp:include page="../../common/admin/iconCard.jsp"></jsp:include>


                        <!-- DataTables Example -->
                    <jsp:include page="../../common/admin/dataExample.jsp"></jsp:include>


                    </div>
                    <!-- /.container-fluid -->

                    <!-- Sticky Footer -->
                <jsp:include page="../../common/admin/stickFooter.jsp"></jsp:include>


                </div>
                <!-- /.content-wrapper -->

            </div>
            <!-- /#wrapper -->

            <!-- Scroll to Top Button-->
        <jsp:include page="../../common/admin/scrollUpToButton.jsp"></jsp:include>


            <!-- Logout Modal-->
        <jsp:include page="../../common/admin/logOutModal.jsp"></jsp:include>


        <!-- Bootstrap core JavaScript-->
        <script src="../../../vendor/jquery/jquery.min.js"></script>
        <script src="../../../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="../../../vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Page level plugin JavaScript-->
        <script src="../../../vendor/chart.js/Chart.min.js"></script>
        <script src="../../../vendor/datatables/jquery.dataTables.js"></script>
        <script src="../../../vendor/datatables/dataTables.bootstrap4.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="../../../js/sb-admin.min.js"></script>
        <script src="../../../js/colReorder-bootstrap4-min.js"></script>
        <script src="../../../js/colReorder-dataTables-min.js"></script>

        <!-- Demo scripts for this page-->
        <script src="../../../js/demo/datatables-demo.js"></script>
        <script src="../../../js/demo/chart-area-demo.js"></script>
        <script src="../../../js/colReorder-dataTables-min.js"></script>
        <script src="../../../js/colReorder-bootstrap4-min.js"></script>


    </body>

</html>
