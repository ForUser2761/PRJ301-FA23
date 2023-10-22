<%-- 
    Document   : navigationBar
    Created on : Oct 2, 2023, 8:16:33 PM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section id="navigation-bar">
    <div class="container-fluid">
        <nav class="navbar navbar-expand-lg navbar-light ">
            <a href="${pageContext.request.contextPath}/home" class="navbar-brand">4USER</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01"
                    aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item"> <a href="#" class="nav-link">Home</a> </li>
                    <li class="nav-item"><a href="#" class="nav-link">About</a></li>
                    <li class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" id="navbarDropdownMenuLink"
                           data-toggle="dropdown" aria-expanded="false">Download</a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <li><a class="dropdown-item" href="#">All Products</a></li>
                            <li class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="#">Popular Items</a></li>
                            <li><a class="dropdown-item" href="#">New Arrivals</a></li>

                        </ul>
                    </li>
                </ul>

                <nav class="navbar navbar-light bg-light pl-sm-0">
                    <form class="form-inline" action="home" method="GET">
                        <input type="text" name="action" style="visibility: hidden" value="search"/>
                        <input class="form-control mr-sm-2" 
                               type="search" 
                               placeholder="Tìm kiếm tên sách" 
                               aria-label="Search"
                               name="keyword">
                        <button class="btn btn-outline-success my-2 my-sm-0 ml-sm-0" type="submit">Search</button>
                    </form>
                </nav>
                <!--Nếu như account trên session = null => hiển thị ra nút Login-->
                <c:if test="${sessionScope.account == null}">
                    <a href="${pageContext.request.contextPath}/authen?action=login">
                        <button class="btn btn-outline-primary ml-2">Login</button>
                    </a>
                </c:if>
                <!--Nếu như account trên sesson != null => hiển thị ra nút logout-->
                <c:if test="${sessionScope.account != null}">
                    <a href="${pageContext.request.contextPath}/cart">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="fa-solid fa-cart-shopping"></i>Cart
                            <span class="badge bg-dark text-white mr-auto rounded-pill">0</span>
                        </button>
                    </a>
                    <a href="${pageContext.request.contextPath}/authen?action=logout">
                        <button class="btn btn-outline-primary">
                            Logout
                        </button>
                    </a>
                    <c:if test="${sessionScope.account.roleId == 2}">
                        <a href="${pageContext.request.contextPath}/dashboard" class="ml-3">
                            <button class="btn btn-outline-success">
                                ${sessionScope.account.username}
                            </button>
                        </a>
                    </c:if>
                    <c:if test="${sessionScope.account.roleId == 1}">
                        <a href="${pageContext.request.contextPath}/admin/dashboard" class="ml-3">
                            <button class="btn btn-outline-success">
                                ${sessionScope.account.username}
                            </button>
                        </a>
                    </c:if>

                </c:if>
            </div>

        </nav>
    </div>
</section>
