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
                <div class="card-header bg-light">
                    <div class="row">
                        <div class="col align-self-center">
                            <h4 class="m-0" >Roles</h4>
                        </div>
                        <div class="col-auto">
                            <button class="btn btn-outline-success" ng-click="showRegister()">
                                <i data-feather="plus"></i>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <table class="table m-0 border-bottom">
                                <thead>
                                <tr class="text-center">
                                    <th scope="col">#</th>
                                    <th scope="col">Nombre</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Acciones</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr ng-repeat="role in roles" class="text-center">
                                    <th class="align-middle" ng-bind="$index + 1"></th>
                                    <td class="align-middle" ng-bind="role.name"></td>
                                    <td class="align-middle">
                                        <span class="badge text-white" ng-bind="role.status.name" ng-class="role.status.name === 'Activo' ? 'bg-success' : 'bg-secondary'"></span>
                                    </td>
                                    <td class="align-middle">
                                        <button class="btn btn-info" ng-click="showDetails(role.id)">Detalles</button>
                                        <button class="btn btn-primary" ng-click="showUpdate(role.id)" ng-disabled="role.status.id === 2">Modificar</button>
                                        <button class="btn btn-danger" ng-click="showDelete(role.id)" ng-disabled="role.status.id === 2">Eliminar</button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--Modal registro--%>
<jsp:include page="/components/user/modalRegister.jsp"></jsp:include>
<%--Modal modificación--%>
<jsp:include page="/components/user/modalUpdate.jsp"></jsp:include>
<%--Modal detalles--%>
<jsp:include page="/components/user/modalDetails.jsp"></jsp:include>
<%--Modal Eliminación--%>
<jsp:include page="/components/user/modalDelete.jsp"></jsp:include>

<jsp:include page="/components/layout/footer.jsp"></jsp:include>
</body>
</html>
