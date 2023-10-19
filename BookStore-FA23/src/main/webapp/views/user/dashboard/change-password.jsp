
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!-- Custom fonts for this template-->
        <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

        <!-- Page level plugin CSS-->
        <link href="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="${pageContext.request.contextPath}/css/sb-admin.css" rel="stylesheet">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/colReorder-bootstrap4.css">
    </head>
    <body id="page-top">
        <jsp:include page="../../common/user/dashboard/navigationBar.jsp"></jsp:include>

            <div id="wrapper">

                <!-- Sidebar -->
            <jsp:include page="../../common/user/dashboard/sideBar.jsp"></jsp:include>

                <div id="content-wrapper">

                    <div class="container-fluid">

                        <!-- Breadcrumbs-->
                    <jsp:include page="../../common/user/dashboard/breadCumb.jsp"></jsp:include>
                        <div class="container-fluid">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-12 text-center">
                                            <h4>Thay đổi mật khẩu</h4>
                                            <hr>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12 justify-content-center">
                                            <form class="justify-content-center" action="${pageContext.request.contextPath}/dashboard?action=change-password"
                                              method="POST"
                                              onsubmit="return validateForm(this);">
                                            <!-- Username -->
                                            <div class="form-group justify-content-center row" style="display:none">
                                                <label for="username" class="col-2 col-form-label">Tài khoản</label>
                                                <div class="col-6">
                                                    <input id="username" name="username" placeholder="" readonly class="form-control here"
                                                           type="text" value="${sessionScope.account.username}">
                                                </div>
                                            </div>
                                            <!-- Password -->
                                            <div class="form-group justify-content-center row">
                                                <label for="password" class="col-2 col-form-label">Mật khẩu hiện tại</label>
                                                <div class="col-6">
                                                    <input id="password" name="password" placeholder=""  class="form-control here"
                                                           type="text" value="">
                                                </div>
                                            </div>
                                            <!-- New password -->
                                            <div class="form-group justify-content-center row">
                                                <label for="newPassword" class="col-2 col-form-label">New password</label>
                                                <div class="col-6">
                                                    <input id="newPassword" name="newPassword" placeholder="" class="form-control here" 
                                                           type="password" value="">
                                                </div>
                                            </div>
                                            <!-- Re enter passoword -->
                                            <div class="form-group justify-content-center row">
                                                <label for="newPassword2" class="col-2 col-form-label">Re-enter password</label>
                                                <div class="col-6">
                                                    <input id="newPassword2" name="newPassword2" placeholder="" 
                                                           class="form-control here" type="password"
                                                           value="">
                                                </div>
                                            </div>
                                            <!--Error-->
                                            <div class="form-group justify-content-center row">
                                                <label for="newPassword" class="col-2 col-form-label"></label>
                                                <div class="col-6">
                                                    <div id="errorDiv" style="color: red;">${error}</div> <!-- Thông báo lỗi ở đây -->
                                                </div>
                                            </div>
                                            <div class="form-group justify-content-center row">
                                                <div class="offset-4 col-8">
                                                    <button name="submit" type="submit" class="btn btn-primary">Lưu thông tin</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>

                            </div>
                        </div>


                    </div>
                </div>
                <!-- /.container-fluid -->

                <!-- Sticky Footer -->
                <jsp:include page="../../common/user/dashboard/stickyFooter.jsp"></jsp:include>


                </div>
                <!-- /.content-wrapper -->

            </div>
            <!-- /#wrapper -->

            <!-- Scroll to Top Button-->
        <jsp:include page="../../common/user/dashboard/scrollTopButton.jsp"></jsp:include>


            <!-- Logout Modal-->
        <jsp:include page="../../common/user/dashboard/logOutModal.jsp"></jsp:include>

            <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="${pageContext.request.contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Page level plugin JavaScript-->
        <script src="${pageContext.request.contextPath}/vendor/chart.js/Chart.min.js"></script>
        <script src="${pageContext.request.contextPath}/vendor/datatables/jquery.dataTables.js"></script>
        <script src="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="${pageContext.request.contextPath}/js/sb-admin.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/colReorder-bootstrap4-min.js"></script>
        <script src="${pageContext.request.contextPath}/js/colReorder-dataTables-min.js"></script>

        <!-- Demo scripts for this page-->
        <script src="${pageContext.request.contextPath}/js/demo/datatables-demo.js"></script>
        <script src="${pageContext.request.contextPath}/js/demo/chart-area-demo.js"></script>
        <script src="${pageContext.request.contextPath}/js/colReorder-dataTables-min.js"></script>
        <script src="${pageContext.request.contextPath}/js/colReorder-bootstrap4-min.js"></script>

        <script>
                                                  function validateForm(form) {
                                                      const newPassword = form.newPassword.value;
                                                      const newPassword2 = form.newPassword2.value;
                                                      console.log(newPassword);
                                                      console.log(newPassword2);
                                                      var errorDiv = document.getElementById('errorDiv');
                                                      if (!errorDiv) {
                                                          errorDiv = document.createElement('div');
                                                          errorDiv.id = 'errorDiv';
                                                          errorDiv.style.color = 'red';
                                                          form.insertBefore(errorDiv, form.querySelector('button[name="submit"]'));
                                                      }

                                                      if (newPassword !== newPassword2) {
                                                          errorDiv.textContent = 'Mật khẩu mới và mật khẩu nhập lại không trùng khớp!';
                                                          console.log("khong trung nhau")
                                                          return false; // This prevents the form from submitting
                                                      } else {
                                                          errorDiv.textContent = ''; // Clears the error message
                                                          console.log(" trung nhau")

                                                          return true; // Allows the form to submit
                                                      }
                                                  }

        </script>

    </body>
</html>
