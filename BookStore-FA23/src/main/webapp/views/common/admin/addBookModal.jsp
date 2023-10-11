<%-- 
    Document   : addBookModal
    Created on : Oct 11, 2023, 7:46:06 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="addBookModal" tabindex="-1" role="dialog" aria-labelledby="addBookModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addBookModalLabel">Add Book</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="addBookForm" action="dashboard?action=add" method="POST" enctype="multipart/form-data">
                    <!--Name-->
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" class="form-control" id="nameInput" name="name">
                        <div id="nameError" class="error"></div>
                    </div>
                    <!--Author-->
                    <div class="form-group">
                        <label for="author">Author:</label>
                        <input type="text" class="form-control" id="authorInput" name="author">
                        <div id="authorError" class="error"></div>
                    </div>
                    <!--Price-->
                    <div class="form-group">
                        <label for="price">Price:</label>
                        <input type="text" class="form-control" id="priceInput" name="price">
                        <div id="priceError" class="error"></div>
                    </div>
                    <!--Quantity-->
                    <div class="form-group">
                        <label for="quantity">Quantity:</label>
                        <input type="text" class="form-control" id="quantityInput" name="quantity">
                        <div id="quantityError" class="error"></div>
                    </div>
                    <!--Category-->
                    <div class="form-group">
                        <label for="category">Category: </label>
                        <div class="input-group">
                            <select class="custom-select" id="category" name="category">
                                <c:forEach items ="${listCategories}" var="category">
                                    <option value="${category.id}">${category.name}</option>
                                </c:forEach>
                            </select>
                            <div class="input-group-append">
                                <button class="btn btn-outline-secondary" type="button">Category</button>
                            </div>
                        </div>
                    </div>
                    <!--Image-->
                    <div class="form-group">
                        <label for="image">Image: </label>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Upload</span>
                            </div>
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="image" name="image" onchange="displayImage(this)">
                                <label class="custom-file-label" >Choose file</label>
                            </div>
                        </div>
                        <img id="previewImage" src="#" alt="Preview"
                             style="display: none; max-width: 300px; max-height: 300px;">

                    </div>
                    <!--Description-->
                    <div class="form-group">
                        <label for="description">Description:</label>
                        <textarea class="form-control" name="description"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" form="addBookForm" onclick="validateForm()">Add</button>
            </div>
        </div>
    </div>
</div>

<script>
    function validateForm() {
        let name = $('#nameInput').val();
        let author = $('#authorInput').val();
        let price = $('#priceInput').val();
        let quantity = $('#quantityInput').val();

        //xoá thông báo lỗi hiện tại
        $('.error').html('');

        if (name === '') {
            $('#nameError').html('Tên sách không được để trống');
        }

        if (author === '') {
            $('#authorError').html('Tên tác giả không được để trống');
        }

        if (price === '') {
            $('#priceError').html('Giá của quyển sách không được để trống');
        } else if (!$.isNumeric(price) || parseFloat(price) < 0) {
            $('#priceError').html('Giá của quyển sách phải là số và không được nhỏ hơn 0');
        }

        if (quantity === '') {
            $('#quantityError').html('Số lượng sách không được để trống');
        } else if (!$.isNumeric(quantity) || parseInt(price) < 0) {
            $('#priceError').html('Số lượng của quyển sách phải là số và không được nhỏ hơn 0');
        }

        // Kiểm tra nếu không có lỗi thì submit form
        let error = '';
        $('.error').each(function () {
            error += $(this).html();
        });
        if (error === '') {
            $('#addProductForm').submit();
        } else {
            event.preventDefault();
        }
    }

    function displayImage(input) {
        var previewImage = document.getElementById("previewImage");
        var file = input.files[0];
        var reader = new FileReader();

        reader.onload = function (e) {
            previewImage.src = e.target.result;
            previewImage.style.display = "block";
        }

        reader.readAsDataURL(file);
    }


</script>


