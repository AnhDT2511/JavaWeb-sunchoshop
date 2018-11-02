<%-- 
    Document   : cart.jsp
    Created on : Oct 10, 2018, 8:06:01 PM
    Author     : nhatl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>My cart</title>
        <!-- Custom Fonts -->
        <script defer src="font-awesome/js/fontawesome-all.js"></script>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap/bootstrap.min.css">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/common.css">

        <style>
            .btn-number{
                padding: 2px 8px;
            }

            table {
                border-bottom: 1px solid #dee2e6;
            }
            
            table tr td a:hover {
                color: #f96332;
                text-decoration: none;
            }           
        </style>
    </head>
    <body>
        <%@include file="common/nav.jsp"%>

        <div class="container pt-5 pb-5">
            <c:if test="${listOrder eq null}">
                <h5 class="text-center">Không có sản phẩm nào trong giỏ hàng.</h5>
                <div class="text-center">
                    <a href="products.jsp" class="btn btn-info mt-3">Tiếp tục mua hàng</a>
                </div>
            </c:if>
            <c:if test="${listOrder ne null}">
                <h5>Giỏ hàng của bạn:</h5>
                <table class="table table-striped mt-3">
                    <thead>
                        <tr>
                            <th scope="col">STT</th>
                            <th scope="col">Tên sản phẩm</th>
                            <th scope="col">Giá</th>
                            <th scope="col">Số lượng</th>
                            <th scope="col">Tổng</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${listOrder eq null}">
                            <tr>
                                <td colspan="6">
                                    Không có sản phẩm nào trong giỏ hàng.
                                </td>
                            </tr>
                        </c:if>
                        <c:if test="${listOrder ne null}">
                            <c:forEach items="${listOrder}" var="i" varStatus="no">
                                <tr>
                                    <th scope="row">${no.index+1}</th>
                                    <td>
                                        <a href="product?id=${i.productId}" target="_blank">${i.name}</a>
                                    </td>
                                    <td>
                                        <fmt:formatNumber type="number" maxFractionDigits="3" value="${i.unitPrice}"/><sup>đ</sup>
                                    </td>
                                    <td>
                                        <a class="btn-number " href="calculatecart?more=1&id=${i.productId}">-</a>
                                        ${i.quantity}
                                        <a class="btn-number" href="calculatecart?more=2&id=${i.productId}">+</a>
                                    </td>
                                    <td>
                                        <fmt:formatNumber type="number" maxFractionDigits="3" value="${i.unitPrice * i.quantity}"/><sup>đ</sup>
                                    </td>
                                    <td>
                                        <a href="calculatecart?more=0&id=${i.productId}">Xóa</a>
                                    </td>
                                </tr>
                            </c:forEach> 
                        </c:if>
                    </tbody>
                </table>
                <h4 class="text-right mb-3">
                    <c:if test="${totalPrice eq null}">
                        Tổng: 0
                    </c:if>
                    <c:if test="${totalPrice ne null}">
                        Tổng: <fmt:formatNumber type="number" maxFractionDigits="3" value="${totalPrice}"/><sup>đ</sup>
                    </c:if>
                </h4>
                <a href="products.jsp" class="btn btn-info mt-3">Tiếp tục mua hàng</a>
                <a href="checkout.jsp" class="btn btn-success float-right mt-3">Tiếp tục thanh toán</a>
                <a href="removeCart" class="btn btn-danger float-right mt-3 mr-2">Xóa giỏ hàng</a>
            </c:if>
        </div>

        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="js/jquery/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="js/bootstrap/bootstrap.min.js"></script>
    </body>
</html>
