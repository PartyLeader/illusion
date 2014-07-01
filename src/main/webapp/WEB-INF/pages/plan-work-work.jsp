<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
 <meta http-equiv="Content-Language" content="English"/>
 <link rel="stylesheet" media="all" href="<c:url value="/resources/site.css"/>">
 <title>План работ</title>
         <link href="<c:url value="/resources/css/application.min.css"/>" rel="stylesheet">
          <link rel="shortcut icon" href="<c:url value="/resources/img/favicon.png"/>">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <meta name="author" content="Illusion team">
</head>
<body>

<jsp:include page="header.jsp">
  <jsp:param name="pageTitle" value="planWorkWork" />
</jsp:include>
<script>
    $(document).ready(function(){
        var default_options = {
            "oLanguage": {
                "sLengthMenu": "Отображено _MENU_ записей на страницу",
                "sSearch": "Поиск:",
                "sZeroRecords": "Ничего не найдено - извините",
                "sInfo": "Показано с _START_ по _END_ из _TOTAL_ записей",
                "sInfoEmpty": "Показано с 0 по 0 из 0 записей",
                "sInfoFiltered": "(filtered from _MAX_ total records)",
                "oPaginate": {
                    "sFirst": "Первая",
                    "sLast":"Посл.",
                    "sNext":"След.",
                    "sPrevious":"Пред."
                }
            },
            "bSort": true,
            "aaSorting": [[ 1, "desc" ]],
            "aoColumnDefs": [
                { "sWidth": "40%", "aTargets": [ -1 ] }
            ],
            "bProcessing": false
        };
        $('#datatable-table').dataTable(default_options);
        $('#datatable-table2').dataTable(default_options);
    });
</script>
<div class="content container wrap">
    <div class="row">
        <div class="col-md-12">
            <h2 class="page-title">План работ</h2>
        </div>
    </div>
    <div class="row">
        <section class="widget padding-bottom">
            <div class="body">
                <fieldset>
                    <legend>
                        Новые заказы на выполнение
                    </legend>
                </fieldset>
                <c:if test="${!empty orders}">
                    <table id="datatable-table" class="table table-striped">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Статус</th>
                            <th>Заказчик</th>
                            <th>Что надо?</th>
                            <th>Количество</th>
                            <th>Срок изготовления</th>
                            <th>Действия</th>
                        </tr>
                        <thead>
                        <tbody>
                        <c:forEach items="${orders}" var="order">
                            <c:if test="${userRole == 'ROLE_VAHTANG' && order.state =='2' && order.block == '0'}">
                                <tr>
                                    <td>${order.id}</td>
                                    <td><c:if test="${order.priority == '0'}">Срочный</c:if><c:if test="${order.priority != '0'}">Обычный</c:if></td>
                                    <td>${userList[order.user-1].name}</td>
                                    <td>$</td>
                                    <td>${sizeList[order.size-1].value * recipes[order.recipe-1].count}</td>
                                    <td>${order.enddate}</td>
                                    <td>
                                        <a href="change-order-state/${order.id}" class="btn btn-success"><i class="fa fa-check-circle"></i> Выполнено</a>
                                    </td>
                                </tr>
                            </c:if>
                            <c:if test="${userRole == 'ROLE_HANDLER' && order.state =='3' && order.block == '0'}">
                                <tr>
                                    <td>${order.id}</td>
                                    <td><c:if test="${order.priority == '0'}">Срочный</c:if><c:if test="${order.priority != '0'}">Обычный</c:if></td>
                                    <td>${userList[order.user-1].name}</td>
                                    <td></td>
                                    <td></td>
                                    <td>${order.enddate}</td>
                                    <td>
                                        <a href="change-order-state/${order.id}" class="btn btn-success"><i class="fa fa-check-circle"></i> Выполнено</a>
                                    </td>
                                </tr>
                            </c:if>
                            <c:if test="${userRole == 'ROLE_TAILOR' && order.state =='4' && order.block == '0'}">
                                <tr>
                                    <td>${order.id}</td>
                                    <td><c:if test="${order.priority == '0'}">Срочный</c:if><c:if test="${order.priority != '0'}">Обычный</c:if></td>
                                    <td>${userList[order.user-1].name}</td>
                                    <td></td>
                                    <td></td>
                                    <td>${order.enddate}</td>
                                    <td>
                                        <a href="change-order-state/${order.id}" class="btn btn-success"><i class="fa fa-check-circle"></i> Выполнено</a>
                                        <a href="write-description/${order.id}" class="btn btn-inverse"><i class="fa fa-edit"></i> Описание товара</a>
                                    </td>
                                </tr>
                            </c:if>
                            <c:if test="${userRole == 'ROLE_MAGIC' && order.state =='5' && order.block == '0'}">
                                <tr>
                                    <td>${order.id}</td>
                                    <td><c:if test="${order.priority == '0'}">Срочный</c:if><c:if test="${order.priority != '0'}">Обычный</c:if></td>
                                    <td>${userList[order.user-1].name}</td>
                                    <td></td>
                                    <td></td>
                                    <td>${order.enddate}</td>
                                    <td>
                                        <a href="change-order-state/${order.id}" class="btn btn-success"><i class="fa fa-check-circle"></i> Выполнено</a>
                                        <a href="write-description/${order.id}" class="btn btn-inverse"><i class="fa fa-edit"></i> Описание товара</a>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>
                <c:if test="${empty orders}">
                    <div class="alert alert-info">
                        <strong><i class="fa fa-info-circle"></i> Внимание!</strong> К сожалению у вас еще нет работы!
                    </div>
                </c:if>
            </div>
            <div class="body">
                <fieldset>
                    <legend>
                        Выполненная работа
                    </legend>
                </fieldset>
                <c:if test="${!empty orders}">
                    <table id="datatable-table2" class="table table-striped">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Статус</th>
                            <th>Заказчик</th>
                            <th>Срок изготовления</th>
                        </tr>
                        <thead>
                        <tbody>
                        <c:forEach items="${orders}" var="order">
                            <c:if test="${userRole == 'ROLE_VAHTANG' && order.state =='3'}">
                                <tr>
                                    <td>${order.id}</td>
                                    <td><c:if test="${order.priority == '0'}">Срочный</c:if><c:if test="${order.priority != '0'}">Обычный</c:if></td>
                                    <td>${userList[order.user-1].name}</td>
                                    <td>${order.enddate}</td>
                                </tr>
                            </c:if>
                            <c:if test="${userRole == 'ROLE_HANDLER' && order.state =='4'}">
                                <tr>
                                    <td>${order.id}</td>
                                    <td><c:if test="${order.priority == '0'}">Срочный</c:if><c:if test="${order.priority != '0'}">Обычный</c:if></td>
                                    <td>${userList[order.user-1].name}</td>
                                    <td>${order.enddate}</td>
                                </tr>
                            </c:if>
                            <c:if test="${userRole == 'ROLE_TAILOR' && order.state =='5'}">
                                <tr>
                                    <td>${order.id}</td>
                                    <td><c:if test="${order.priority == '0'}">Срочный</c:if><c:if test="${order.priority != '0'}">Обычный</c:if></td>
                                    <td>${userList[order.user-1].name}</td>
                                    <td>${order.enddate}</td>
                                </tr>
                            </c:if>
                            <c:if test="${userRole == 'ROLE_MAGIC' && order.state =='6'}">
                                <tr>
                                    <td>${order.id}</td>
                                    <td><c:if test="${order.priority == '0'}">Срочный</c:if><c:if test="${order.priority != '0'}">Обычный</c:if></td>
                                    <td>${userList[order.user-1].name}</td>
                                    <td>${order.enddate}</td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>
                <c:if test="${empty orders}">
                    <div class="alert alert-info">
                        <strong><i class="fa fa-info-circle"></i> Внимание!</strong> К сожалению вы вообще не работаете!
                    </div>
                </c:if>
            </div>
        </section>
    </div>
</div>
</body>
</html>