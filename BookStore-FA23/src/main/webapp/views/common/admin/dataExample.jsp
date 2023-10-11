<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="card mb-3">
    <div class="card-header">
        <i class="fas fa-table"></i>
        Data Table Example
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Image</th>
                        <th>Author</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Description</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>Name</th>
                        <th>Image</th>
                        <th>Author</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Description</th>
                    </tr>
                </tfoot>
                <tbody>
                    <c:forEach items="${listBook}" var= "book">
                        <tr>
                            <!--Name-->
                            <td>${book.name}</td>
                            <!--Image-->
                            <td>
                                <img  width="100px"
                                      height="100px"
                                      src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" 
                                      alt="..." class="card-img-top">
                            </td>
                            <!--Author-->
                            <td>${book.author}</td>
                            <!--Price-->
                            <td>${book.price}</td>
                            <!--Quantity-->
                            <td>${book.quantity}</td>
                            <!--Description-->
                            <td>${book.description}</td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
        </div>
    </div>
    <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
</div>
