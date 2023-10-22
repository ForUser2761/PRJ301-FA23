<%-- 
    Document   : product
    Created on : Oct 2, 2023, 8:19:13 PM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section id="product">
    <div class="row">
        <div class="col-md-2 mb-sm-5">
            <ul class="list-group">
                <c:forEach items="${listCategory}" var = "category">
                    <li class="list-group-item" >
                        <a href="home?action=category&categoryId=${category.id}" >${category.name}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <!-- Product details -->
        <div class="col-md-10 product-details">
            <!-- First row -->
            <div class="row">

                <c:forEach items="${listBook}" var="book">
                    <!-- First product - first row -->
                    <div class="col-lg-4 mb-md-5 ">
                        <div class="card h-100">
                            <img src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" 
                                 alt="..." class="card-img-top">
                            <div class="card-body">
                                <div class="text-center">
                                    <!--Name Product-->
                                    <h5 class="card-title">${book.name}</h5>
                                    <!--Price-->
                                    ${book.price} $
                                </div>
                            </div>

                            <div class="card-footer  bg-transparent border-top-0">
                                <div class="text-center">
                                    <a href="${pageContext.request.contextPath}/product-details?id=${book.id}" 
                                       class="btn btn-outline-dark">View option</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>


        </div>
    </div>
</section>
