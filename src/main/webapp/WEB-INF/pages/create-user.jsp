<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page trimDirectiveWhitespaces="true" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Content-Language" content="English"/>
    <link rel="stylesheet" media="all" href="<c:url value="/resources/site.css"/>">
    <title>Добавление пользователя</title>
        <link href="<c:url value="/resources/css/application.min.css"/>" rel="stylesheet">
         <link rel="shortcut icon" href="<c:url value="/resources/img/favicon.png"/>">
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <meta name="author" content="Illusion team">
</head>
<body>
<jsp:include page="header.jsp">
  <jsp:param name="pageTitle" value="createUser" />
</jsp:include>

<div class="content container wrap">
    <div class="row">
        <div class="col-md-12">
            <h2 class="page-title">Добавление пользователя</h2>
        </div>
    </div>
    <div class="row">
        <section class="widget">
            <div class="body">
                <form:form action="controlUsers" modelAttribute="users" method="post" onsubmit="true" class="form-horizontal label-left">
                    <div class="control-group">
                        <label for="name" class="control-label">Ник</label>
                        <div class="controls form-group padding-left">
                            <input id="name" name="name" class="form-control parsley-validated" required="required">
                            <form:errors path="name" element="span"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">E-mail</label>
                        <div class="controls form-group padding-left">
                            <input id="email" name="email" class="form-control parsley-validated" required="required" type="email">
                            <form:errors path="email" element="span"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Пароль</label>
                        <div class="controls form-group padding-left">
                            <input id="password" name="password" class="form-control parsley-validated" required="required" type="password">
                            <form:errors path="password" element="span"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Роль пользователя</label>
                        <div class="controls form-group">
                            <c:forEach items="${rolelist}" var="item">
                                <c:if test="${item.role !='ROLE_ANONYMOUS'}">
                                    <label class="radio">
                                        <form:radiobutton class = "iCheck" path="role" value="${item.id}"/>${item.role}
                                    </label>
                                </c:if>
                            </c:forEach>
                        </div>
                        <form:errors path="role" element="span"/>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Доступность учетной записи</label>
                        <div class="controls form-group">
                            <label class="checkbox">
                                    <form:checkbox path="enabled" id="enabled" checked="checked" class="iCheck"/>Учетная запись активна
                            </label>
                        </div>
                    </div>
                    <div class="form-actions">
                        <button type="submit" class="btn btn-success btn-lg"><i class="fa fa-check"></i> Добавить</button>
                        <a href="<c:url value="/controlUsers"/>" class="btn btn-inverse btn-lg"><i class="fa eicon-cancel"></i> Отмена</a>
                    </div>
                </div>
            </form:form>
        </section>
    </div>
</div>
</body>
</html>
