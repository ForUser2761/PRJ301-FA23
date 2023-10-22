<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Template Mẫu</title>

        <!-- Bootstrap CDN -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />

        <!-- CSS stylesheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" />

        <!-- Font Awesome -->
        <script src="https://kit.fontawesome.com/65d7426ab6.js" crossorigin="anonymous"></script>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />

    </head>

    <body>

        <!-- Navigation Bar -->
        <jsp:include page="../../common/user/navigationBar.jsp"></jsp:include>

            <!--Cart Details-->
            <section id="cart-details">
            <c:if test="${sessionScope.cart.listOrderDetails.isEmpty() || sessionScope.cart == null}">
                <h1>Shopping Cart Is Empty</h1>
            </c:if>


            <!--Shopping cart have order-->
            <c:if test="${!sessionScope.cart.listOrderDetails.isEmpty() && sessionScope.cart != null}">
                <h1 style="text-align: center">Shopping Cart</h1>
                <table class="table table-hover">
                    <thead class="thead-light">
                        <tr>
                            <th scope="col">No</th>
                            <th scope="col">Image</th>
                            <th scope="col">Name</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Price</th>
                            <th scope="col">Amount</th>
                            <th scope="col">Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${sessionScope.cart.listOrderDetails}" var="orderDetails" varStatus="status">
                            <c:forEach items="${listBook}" var="bookInList">
                                <c:if test="${bookInList.id == orderDetails.bookId}">
                                    <c:set var="currentBook" value="${bookInList}"></c:set>
                                </c:if>
                            </c:forEach>
                        <tr>
                            
                            <fmt:setLocale value = "en_US"/>
                            <th scope="row">${status.index + 1}</th>

                            <!--Image-->
                            <td>
                                <img src="${currentBook.image}" 
                                     width = "100" height = "100" alt="alt"/> 
                            </td>
                            <!--Name-->
                            <td>${currentBook.name}</td>

                            <!--Quantity-->
                            <td>
                                <form action="cart?action=change-quantity" method ="POST">
                                    <input type="hidden"
                                           name="id" 
                                           value="${currentBook.id}" />

                                    <div class="input-group mr-3">
                                        <!-- Minus button -->
                                        <div class="input-group-prepend">
                                            <button class="btn btn-outline-dark" type="button" onclick="decreaseQuantity(${currentBook.id})">
                                                <i class="fas fa-minus"></i>
                                            </button>
                                        </div>
                                        <!-- Input button -->
                                        <input class="form-control text-center" id="inputQuantity_${currentBook.id}"
                                               type="text" style="max-width: 3rem;" value="${orderDetails.quantity}" data-original-value="1" name="quantity">
                                        <!-- Plus button -->
                                        <div class="input-group-append">
                                            <button class="btn btn-outline-dark" type="button" onclick="increaseQuantity(${currentBook.id})">
                                                <i class="fas fa-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </td>

                            <!--Price-->
                            <td>
                                ${currentBook.price}
                            </td>

                            <!--Amount-->
                            <td class="amount-cell">
                                <p>${currentBook.price * orderDetails.quantity}</p>
                            </td>

                            <!--Delete action-->
                            <td>
                                <form action="cart?action=delete&id=${currentBook.id}" method="POST">
                                    <a onclick="this.closest('form').submit()">
                                        <i class="fa-solid fa-trash fa-2x text-danger"></i>
                                    </a> 
                                </form>
                            </td>
                        </tr>

                    </c:forEach>
                    <!--Total Money-->
                    <tr>
                        <td></td>
                        <td>
                            <h3>Total Money</h3>
                        </td>
                        <td colspan="3"></td>
                        <td>
                            <p id="totalMoney"></p>
                        </td>
                        <td colspan="1"></td>
                    </tr>
                    </tbody>
                </table>
                <div class="d-flex justify-content-center">
                    <a class="btn btn-info btn-lg text-white" href="${pageContext.request.contextPath}/check-out">
                        Check Out
                    </a>
                </div>

            </c:if>

        </section>


    </body>
    <!-- Bootstrap Scripts -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
    crossorigin="anonymous"></script>
    <script>
                                    window.addEventListener('DOMContentLoaded', function () {
                                        calculateTotalMoney();
                                    });

                                    function calculateTotalMoney() {
                                        var amountCells = document.querySelectorAll('.amount-cell');
                                        var totalMoney = 0;

                                        amountCells.forEach(function (cell) {
                                            var amountValue = parseFloat(cell.innerText);
                                            totalMoney += amountValue;
                                        });

                                        var totalMoneyElement = document.getElementById('totalMoney');
                                        totalMoneyElement.innerText = totalMoney.toFixed(2) + "$";
                                    }
    </script>
    <script>
        function decreaseQuantity(productId) {
            let x = 'inputQuantity_' + productId;
            const inputQuantity = document.getElementById(x);
            let quantity = parseInt(inputQuantity.value);

            if (quantity > 1) {
                quantity--;
                inputQuantity.value = quantity;
            }

            // Lấy đối tượng form chứa inputQuantity
            const form = inputQuantity.closest('form');
            // Submit form
            form.submit();
        }

        function increaseQuantity(productId) {
            let x = 'inputQuantity_' + productId;
            const inputQuantity = document.getElementById(x);
            let quantity = parseInt(inputQuantity.value);

            quantity++;
            inputQuantity.value = quantity;

            // Lấy đối tượng form chứa inputQuantity
            const form = inputQuantity.closest('form');
            // Submit form
            form.submit();
        }

        const inputQuantities = document.querySelectorAll('[id^="inputQuantity_"]');

        inputQuantities.forEach((inputQuantity) => {
            inputQuantity.addEventListener('input', function (e) {
                this.value = this.value.replace(/[^0-9]/g, '');
            });

            inputQuantity.addEventListener('mouseenter', function (e) {
                if (this.value === '') {
                    this.value = this.dataset.originalValue;
                }
            });

            inputQuantity.addEventListener('mouseleave', function (e) {
                this.dataset.originalValue = this.value;
                if (this.value === '') {
                    this.value = '1';
                }
            });
        });
    </script>
