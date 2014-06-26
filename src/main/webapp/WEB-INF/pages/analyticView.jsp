<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
 <meta http-equiv="Content-Language" content="English"/>
 <link rel="stylesheet" media="all" href="<c:url value="/resources/site.css"/>">
 <title>Аналитика</title>
         <link href="<c:url value="/resources/css/application.min.css"/>" rel="stylesheet">
          <link rel="shortcut icon" href="<c:url value="/resources/img/favicon.png"/>">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <meta name="author" content="Illusion team">
</head>
<body>

<jsp:include page="header.jsp">
  <jsp:param name="pageTitle" value="Analytic" />
</jsp:include>
<div class="content container wrap">
    <div class="row">
        <div class="col-md-12">
            <h2 class="page-title">Аналитика</h2>
        </div>
    </div>
    <div class="row">
        <section class="widget">
            <div>
                        <a href="<c:url value="/create-order"/>" class="btn btn-primary">Создать заказ</a>
                        <a href="<c:url value="/orderfilters"/>" class="btn btn-default">Фильтр</a>
                        <a href="<c:url value="/orders"/>" class="btn btn-default">Снять фильтр</a>
            </div>
            <div class = "form-actions">
                                <c:if test="${!empty orders}">
                                    <table>
                                     <tr>
                                     <th>№</th>
                                     <th>ФИО</th>
                                     <th>Размер</th>
                                     <th>Срок изготовления</th>
                                     <th>Тип изделия</th>
                                     <th>Фасон изделия</th>
                                     <th>Симптомы</th>
                                     <th>Приоритет</th>
                                      <th></th>
                                     </tr>
                                     <c:forEach items="${orders}" var="order" varStatus="index">
                                         <tr class="${index.count % 2 == 0 ? 'even': 'odd'}"/>
                                            <td>${index.count}</td>
                                            <td><a href="order/${order.id}">${order.id}</a></td>
                                            <td>${order.user}</td>
                                            <td>${order.fashion}</td>
                                            <td>${order.gen}</td>
                                            <td>${order.recipe}</td>
                                            <td>${order.state}</td>
                                            <td><a href="delete-order/${order.id}"><img src="<c:url value="/resources/images/delete.png" />"/>Удалить</a></td>
                                         </tr>
                                     </c:forEach>
                                    </table>
                                </c:if>
            </div>
        </section>
    </div>
</div>
</body>
</html>