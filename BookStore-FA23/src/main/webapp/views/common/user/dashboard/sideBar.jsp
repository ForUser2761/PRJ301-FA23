<%@page contentType="text/html" pageEncoding="UTF-8"%>
<ul class="sidebar navbar-nav">
    <li class="nav-item active">
        <a class="nav-link" href="#">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/dashboard?page=profile">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>Profile</span>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/dashboard?page=change-password">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>Change password</span>
        </a>
    </li>
    <c:if test="${sessionScope.account != null && sessionScope.account.roleId == 1}">
        <li class="nav-item">
            <a class="nav-link" href="#">
                <i class="fas fa-fw fa-table"></i>
                <span>Purchase</span>
            </a>
        </li>
    </c:if>
</ul>

