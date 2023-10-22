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

            <section id="product-item">
                <div class="row">
                    <!-- Image product item -->
                    <img class="col-sm-6" src="${book.image}" alt="" />
                <!-- Description -->
                <div class="product-description col-sm-6">
                    <!-- Name product -->
                    <h1>${book.name}</h1>
                    <!-- Price -->
                    Giá tiền: <span class="text-muted product-price" >${book.price}$</span>
                    <!-- Description -->
                    <br/><br/>
                    <h4>Chi tiết sản phẩm:</h4>
                    <p class="discription">${book.description}</p>
                    <!--Form cart-->
                    <form action="cart?action=add-product" method="POST">
                        <div class="product-cart align-items-center">
                            <div style="display:none">
                                <input name="id" value="${book.id}">
                            </div>
                            <div class="input-group mr-3">
                                <!-- Minus button -->
                                <div class="input-group-prepend">
                                    <button class="btn btn-outline-dark" type="button" onclick="decreaseQuantity()">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                                <!-- Input button -->
                                <input class="form-control text-center" id="inputQuantity"
                                       type="text" style="max-width: 3rem;" value="1" data-original-value="1" name="quantity">
                                <!-- Plus button -->
                                <div class="input-group-append">
                                    <button class="btn btn-outline-dark" type="button" onclick="increaseQuantity()">
                                        <i class="fas fa-plus"></i>
                                    </button>
                                </div>
                            </div>
                            <!-- Add to cart -->
                            <button class="btn btn-outline-dark mt-3" type="submit">
                                <i class="fas fa-cart-plus"></i>
                                Thêm vào giỏ hàng
                            </button>
                    </form>
                </div>
            </div>
        </div>
    </section>





    <!-- Footer -->
    <jsp:include page="../../common/user/footer.jsp"></jsp:include>




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
                                        function decreaseQuantity() {
                                            const inputQuantity = document.getElementById('inputQuantity');
                                            let quantity = parseInt(inputQuantity.value);

                                            if (quantity > 1) {
                                                quantity--;
                                                inputQuantity.value = quantity;
                                            }
                                        }

                                        function increaseQuantity() {
                                            const inputQuantity = document.getElementById('inputQuantity');
                                            let quantity = parseInt(inputQuantity.value);

                                            quantity++;
                                            inputQuantity.value = quantity;
                                        }

                                        const inputQuantity = document.getElementById('inputQuantity');

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
</script>
