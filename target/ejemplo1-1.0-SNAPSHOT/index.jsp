<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<s:set var="path"><%=request.getContextPath()%>
</s:set>
<!DOCTYPE html>
<html ng-app="CourseStruts">
<head>
    <title>Course Struts</title>
    <jsp:include page="components/layout/header.jsp"></jsp:include>
    <script src="<s:property value="#path"/>/js/modules/user/user.js"></script>
</head>
<body ng-controller="user">
<jsp:include page="components/navbar.jsp"></jsp:include>
<h1 ng-bind="saludo"></h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>
<jsp:include page="components/layout/footer.jsp"></jsp:include>
</body>
</html>