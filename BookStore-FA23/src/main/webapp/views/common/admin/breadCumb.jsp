<%-- 
    Document   : breadCumb
    Created on : Oct 9, 2023, 9:12:25 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<ol class="breadcrumb">
    <li class="breadcrumb-item">
        <a href="#">Dashboard</a>
    </li>
    <li class="breadcrumb-item active">Overview</li>
    <li class="breadcrumb-item ml-auto">
        <button class="btn btn-success" type="button" data-toggle="modal" data-target="#addBookModal">
            <i class="fas fa-plus"></i> Add book
        </button>
    </li>
</ol>