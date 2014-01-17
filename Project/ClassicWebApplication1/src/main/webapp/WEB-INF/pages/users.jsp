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
<div id="leftcol">
    <img src="<c:url value="/resources/images/logo.jpg" />" width="100" height="50" alt="Logo"/>
</div>
<div id="middlecol2">
    <h2>Аналитика предприятия</h2>
    <c:if test="${!empty users}">
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
         <c:forEach items="${users}" var="user" varStatus="index">
             <tr class="${index.count % 2 == 0 ? 'even': 'odd'}"/>
                <td>${index.count}</td>
                <td>${user.name}</td>
                <td>${user.razmer}</td>
                <td>${user.srok}</td>
                <td>${user.fason}</td>
                <td>${user.gen}</td>
                <td>${user.simptomi}</td>
                <td>${user.urgency}</td>
                <td><a href="delete-user/${user.id}"><img src="<c:url value="/resources/images/delete.png" />"/>Удалить</a></td>
             </tr>
         </c:forEach>
        </table>
    </c:if>
    <br/>
    <a href="<c:url value="/create-user"/>">Создать заказ</a>
    <a href="<c:url value="/userfilters"/>">Фильтр</a>
    <a href="<c:url value="/users"/>">Снять фильтр</a>
</div>
</body>
</html>