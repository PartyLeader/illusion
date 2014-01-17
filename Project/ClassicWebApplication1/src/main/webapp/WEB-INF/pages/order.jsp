<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
 <meta http-equiv="Content-Language" content="English"/>
 <link rel="stylesheet" media="all" href="<c:url value="/resources/site.css"/>">
 <title>Заказ клиента</title>
</head>
<body>
<div id="leftcol">
    <img src="<c:url value="/images/logo.gif" />" width="100" height="50" alt="Logo"/>
</div>
<div id="middlecol2">
<c:forEach items="${users}" var="user">
    <h2>Заказ клиента №<c:out value="${user.id}"/></h2>
    <table>
        <tr>
            <td width="100рх">Заказчик:</td>
            <td>
                <form:input  size="30" path="${user.name}"/>
            </td>
        </tr>
        <tr>
            <td width="100рх">Размер:</td>
            <td>
                <form:input  path="${user.razmer}"/>
            </td>
        </tr>
        <tr>
            <td width="100рх">Срок изготовления:</td>
            <td>
               <form:input  path="${user.srok}"/>
               Цвет:
                <form:input  path="${user.gen}"/>
            </td>
        </tr>
        <tr>
            <td width="100рх">Фасон изделия:</td>
            <td>
               <form:input  path="${user.fason}"/>
               Количество:
                1
            </td>
        </tr>
        <tr>
            <td width="100рх">Размер:</td>
            <td>
                <form:input  path="${user.simptomi}"/>
            </td>
        </tr>
    </table>
    <h3>Стадии выполнения:</h3>
     <table>
         <tr>
         <th>№</th>
         <th>Работник</th>
         <th>Прогресс</th>
         <th>Приоритет</th>
         <th>Начало</th>
         <th>Конец</th>
         <th>Кол-во</th>
         <th>Материал</th>
         <th>Комментарий</th>
         </tr>
                <tr>
                <th>1</th>
                <th>Сборщик</th>
                <th>100%</th>
                <th>средне</th>
                <th>1/12/2013</th>
                <th>2/12/2013</th>
                <th>3</th>
                <th>крапива</th>
                <th>-</th>
                </tr>
                <tr>
                <th>2</th>
                <th>Обработчик</th>
                <th>30%</th>
                <th>средне</th>
                <th>2/12/2013</th>
                <th>10/12/2013</th>
                <th>8</th>
                <th>нитки</th>
                <th>Необходимо выполнить план</th>
                </tr>
        </table>
</c:forEach>

<a href="<c:url value="/users"/>">Список заказов</a>
</div>
</body>
</html>