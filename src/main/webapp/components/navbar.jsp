<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="navbar navbar-expand-lg navbar-light bg-light shadow sticky-top">
    <a class="navbar-brand" href="<s:property value="#path"/>/index">
        <img style="height: 48px" src="<s:property value="#path"/>/assets/logo.png">
        <span>Struts Curse</span>
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="<s:property value="#path"/>/roles">Gesión de roles</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="<s:property value="#path"/>/users">Gesión de usuarios</a>
            </li>
        </ul>
    </div>
</nav>