<%-- 
    Document   : pagination
    Created on : Oct 2, 2023, 8:20:07 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section id="page-navigation" class="d-flex justify-content-center">
    <ul class="pagination">
        <!--Home-->
        <c:if test="${pageControl.page > 1}">
            <li class="page-item">
                <a class="page-link" href="${pageControl.urlPattern}page=1">Home</a>
            </li>
        </c:if>

        <!--Previous Disable-->
        <c:if test="${pageControl.page == '1'}">
            <li class="page-item disabled">
                <a class="page-link" >Previous</a>
            </li>
        </c:if>

        <!--Previous-->
        <c:if test="${pageControl.page > 1}">
            <li class="page-item">
                <a class="page-link" href="${pageControl.urlPattern}page=${pageControl.page - 1}">Previous</a>
            </li>
        </c:if>

        <!--PAGE - 2 (in case last page )-->
        <c:if test="${pageControl.page == pageControl.totalPage}">
            <li class="page-item">
                <a class="page-link" href="${pageControl.urlPattern}page=${pageControl.page - 2}">${pageControl.page - 2}</a>
            </li>
        </c:if>

        <!--PAGE - 1 (in case last page )-->
        <c:if test="${pageControl.page == pageControl.totalPage}">
            <li class="page-item">
                <a class="page-link" href="${pageControl.urlPattern}page=${pageControl.page - 1}">${pageControl.page - 1}</a>
            </li>
        </c:if>

        <!--PAGE-->
        <li class="page-item">
            <a class="page-link" href="${pageControl.urlPattern}page=${pageControl.page}">${pageControl.page}</a>
        </li>

        <!--PAGE + 1-->
        <c:if test="${pageControl.page < pageControl.totalPage}">
            <li class="page-item">
                <a class="page-link" href="${pageControl.urlPattern}page=${pageControl.page + 1}">${pageControl.page + 1}</a>
            </li>
        </c:if>

        <!--PAGE + 2-->
        <c:if test="${pageControl.page + 1 < pageControl.totalPage}">
            <li class="page-item">
                <a class="page-link" href="${pageControl.urlPattern}page=${pageControl.page + 2}">${pageControl.page + 2}</a>
            </li>
        </c:if>

        <!--NEXT-->
        <c:if test="${pageControl.page != pageControl.totalPage}">
            <!--NEXT-->
            <li class="page-item">
                <a class="page-link" href="${pageControl.urlPattern}page=${pageControl.page + 1}">Next</a>
            </li>
        </c:if>

        <!--LAST-->
        <c:if test="${pageControl.page != pageControl.totalPage}" >
            <li class="page-item">
                <a class="page-link" href="${pageControl.urlPattern}page=${pageControl.totalPage}">Last</a>
            </li>
        </c:if>
    </ul>
</section>
