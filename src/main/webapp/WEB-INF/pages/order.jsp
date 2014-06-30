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
 <title>Заказ клиента</title>
         <link href="<c:url value="/resources/css/application.min.css"/>" rel="stylesheet">
          <link rel="shortcut icon" href="<c:url value="/resources/img/favicon.png"/>">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <meta name="author" content="Illusion team">
</head>
<body>
<jsp:include page="header.jsp">

  <jsp:param name="pageTitle" value="order" />
</jsp:include>
<div class="col-md-7">
                        <section class="widget">
                            <div class="body">
                                <form:form modelAttribute="order" method="post" class="form-horizontal label-left" onsubmit="true">
                                    <div class="control-group">
                                        <c:if test="${userRole == 'ROLE_ADMIN'}">
                                            <div class="control-group">
                                                <label for="description" class="control-label">Заказчик</label>
                                                <div class="controls form-group padding-left">
                                                    <select name="user" class="selectpicker " data-style="btn-default" id="user" path="user">
                                                        <c:forEach items="${userList}" var="item">
                                                            <c:if test="${item.role == '3'}">
                                                                <option value="${item.id}" path="user">${item.name}</option>
                                                            </c:if>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </c:if>
                                        <label for="description" class="control-label">Контакты</label>
                                        <div class="controls form-group padding-left">
                                            <textarea id="description" rows="3" name="text" class="form-control parsley-validated" required="required"></textarea>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">Фасон изделия</label>
                                        <div class="controls form-group">
                                            <c:forEach items="${fashionList}" var="item">
                                                <label class="radio" id="fashion">
                                                    <form:radiobutton class = "iCheck fashioncheck" path="fashion" value="${item.id}"/>${item.name}
                                                </label>
                                            </c:forEach>
                                        </div>
                                    </div>

                                    <div class="form-actions">
                                        <button type="submit" class="btn btn-success btn-lg"><i class="fa fa-check"></i> Сохранить</button>
                                        <c:if test="${userRole == 'ROLE_USER'}">
                                            <a href="<c:url value="/orders"/>" class="btn btn-inverse btn-lg"><i class="fa eicon-cancel"></i> Отмена</a>
                                        </c:if>
                                        <c:if test="${userRole == 'ROLE_ADMIN'}">
                                            <a href="<c:url value="/analyticView"/>" class="btn btn-inverse btn-lg"><i class="fa eicon-cancel"></i> Отмена</a>
                                        </c:if>
                                    </div>
                                </form:form>
                            </div>
                        </section>
</div>

</body>
</html>