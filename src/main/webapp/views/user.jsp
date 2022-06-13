<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<s:set var="path"><%=request.getContextPath()%></s:set>
<html ng-app="CourseStruts">
<head>
    <title>Title</title>
    <jsp:include page="/components/layout/header.jsp"></jsp:include>
    <script src="<s:property value="#path"/>/js/modules/user/user.js"></script>
</head>
<body ng-controller="user">
<%--Navbar--%>
<jsp:include page="/components/navbar.jsp"></jsp:include>

<div class="container my-4 my-md-5">
    <div class="row">
        <div class="col">
            <div class="card shadow">
                <img src="..." class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
            </div>
            <h1>Gestión de usuarios</h1>

        </div>
    </div>
</div>

<button class="btn btn-success p-0 m-0" style="width: 60px; height: 60px; border-radius: 50%" ng-click="showRegister()">
    <i class="" data-feather="plus"></i>
</button>

<%--Modal registro--%>
<jsp:include page="/components/user/modalRegister.jsp"></jsp:include>
<%--Modal modificación--%>
<jsp:include page="/components/role/modalUpdate.jsp"></jsp:include>
<%--Modal detalles--%>
<jsp:include page="/components/role/modalDetails.jsp"></jsp:include>
<%--Modal Eliminación--%>
<jsp:include page="/components/role/modalDelete.jsp"></jsp:include>

<jsp:include page="/components/layout/footer.jsp"></jsp:include>
</body>
</html>
