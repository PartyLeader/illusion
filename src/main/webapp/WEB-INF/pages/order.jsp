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
         <link href="<c:url value="/resources/css/application.min.css"/>" rel="stylesheet">
          <link rel="shortcut icon" href="<c:url value="/resources/img/favicon.png"/>">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <meta name="author" content="Illusion team">
</head>
<body>
<jsp:include page="header.jsp">

  <jsp:param name="pageTitle" value="Login" />
</jsp:include>

<div id="leftcol">
</div>
<div id="middlecol2" class="note">
<c:forEach items="${requests}" var="request">
    <h2>Заказ клиента №<c:out value="${request.id}"/></h2>
    <table>
        <tr>
            <td width="100рх">Заказчик:</td>
            <td>
                <span>${request.name}</span>
            </td>
        </tr>
        <tr>
            <td width="100рх">Размер:</td>
            <td>
                <c:out value="${request.razmer}"/>
            </td>
        </tr>
        <tr>
            <td width="100рх">Срок изготовления:</td>
            <td>
                <c:out value="${request.srok}"/>

               Цвет:
                <c:out value="${request.gen}"/>
            </td>
        </tr>
        <tr>
            <td width="100рх">Фасон изделия:</td>
            <td>
               <c:out value="${request.fason}"/>

               Количество:
                1
            </td>
        </tr>
        <tr>
            <td width="100рх">Размер:</td>
            <td>
                <c:out value="${request.simptomi}"/>
            </td>
        </tr>
    </table>
</c:forEach>
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
         <c:forEach items="${orders}" var="order" varStatus="index">
                <tr class="${index.count % 2 == 0 ? 'even': 'odd'}"/>
                    <th>${index.count}</th>
                    <th><a href="<c:url value="/task/${order.id}"/>">${order.user.name}</a></th>
                    <th>${order.status}</th>
                    <th>${order.priority}</th>
                    <th>${order.createdate}</th>
                    <th>${order.enddate}</th>
                    <th>${order.countGood}</th>
                    <th>${order.good}</th>
                    <th>${order.message}</th>
                </tr>
         </c:forEach>
        </table>


<a href="<c:url value="/users"/>">Список заказов</a>
</div>
</body>
</html>