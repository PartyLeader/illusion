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
    <title>Админка: Пользователи</title>
        <link href="<c:url value="/resources/css/application.min.css"/>" rel="stylesheet">
         <link rel="shortcut icon" href="<c:url value="/resources/img/favicon.png"/>">
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <meta name="author" content="Illusion team">
</head>
<body>
<jsp:include page="header.jsp">
  <jsp:param name="pageTitle" value="controlUsersCustomers" />
</jsp:include>
<div class="content container wrap">
    <div class="row">
        <div class="col-md-12">
            <h2 class="page-title">Админка: Пользователи</h2>
        </div>
    </div>
    <div class="row">
        <section class="widget">

        </section>
        <section class="widget">
                    <table>
                        <tr>

                            <%----%>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            <form:form action="controlUsersCustomers" modelAttribute="users" method="post" onsubmit="true">
                                                <table>
                                                    <h2> Таблица Заказчики:</h2>
                                                    <tr>
                                                        <td width="100рх">Ник:</td>
                                                        <td>
                                                            <form:input size="20" path="name"/>
                                                            <form:errors path="name" element="span"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="100рх">Пароль:</td>
                                                        <td>
                                                            <form:input size="20" path="password"/>
                                                            <form:errors path="password" element="span"/>
                                                        </td>
                                                        </tr>
                                                    <tr>
                                                        <td width="100рх">Емайл:</td>
                                                        <td>
                                                            <form:input size="20" path="email"/>
                                                            <form:errors path="email" element="span"/>
                                                        </td>
                                                        </tr>


                                                </table>
                                                <input type="submit" class="button-blue" value="Добавить"/>
                                                <%--<input type="submit" class="button-blue" value="Create Letter"/>--%>
                                            </form:form>
                                        </td>
                                        <td>

                                               <c:forEach items="${userslist}" var="item">
                                                   <table>
                                                   <tr>
                                                       <td>
                                                               ${item.id}
                                                       </td>
                                                       <td>
                                                               ${item.name}
                                                       </td>
                                                       <td>
                                                               ${item.password}
                                                       </td>
                                                       <td>
                                                               ${item.email}
                                                       </td>

                                                   </tr>
                                                       </table>
                                                   <%--<option value="${item.id}">${item.name}</option>--%>
                                               </c:forEach>
                                        </td>

                                    </tr>

                                </table>

                             </td>
                            <%----%>

                        </tr>

                    </table>
        </section>
    </div>
</div>
</body>
</html>
