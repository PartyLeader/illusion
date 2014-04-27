<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
 <meta http-equiv="Content-Language" content="English"/>
 <link rel="stylesheet" media="all" href="<c:url value="/resources/site.css"/>">
 <title>Аналитика предприятия</title>
</head>
<body>
<jsp:include page="header.jsp">

  <jsp:param name="pageTitle" value="Login" />
</jsp:include>
<div id="leftcol">
</div>
<div id="middlecol2">
    <h2>Аналитика предприятия</h2>
    <c:if test="${!empty requests}">
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
         <c:forEach items="${requests}" var="request" varStatus="index">
             <tr class="${index.count % 2 == 0 ? 'even': 'odd'}"/>
                <td>${index.count}</td>
                <td><a href="order/${request.id}">${request.name}</a></td>
                <td>${request.razmer}</td>
                <td>${request.srok}</td>
                <td>${request.fason}</td>
                <td>${request.gen}</td>
                <td>${request.simptomi}</td>
                <td>${request.urgency}</td>
                <td><a href="delete-request/${request.id}"><img src="<c:url value="/resources/images/delete.png" />"/>Удалить</a></td>
             </tr>
         </c:forEach>
        </table>
    </c:if>
    <br/>
    <a href="<c:url value="/create-request"/>">Создать заказ</a>
    <a href="<c:url value="/requestfilters"/>">Фильтр</a>
    <a href="<c:url value="/requests"/>">Снять фильтр</a>
</div>
</body>
</html>