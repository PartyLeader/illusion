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
                { "sWidth": "35%", "aTargets": [ -1 ] }
            ],
            "bProcessing": false
        };
        $('#datatable-table').dataTable(default_options);
        $('#datatable-table2').dataTable(default_options);
        $('#datatable-table3').dataTable(default_options);
        $('#datatable-table4').dataTable(default_options);
    });
</script>
<div class="content container wrap">
    <div class="row">
        <div class="col-md-12">
            <h2 class="page-title">Аналитика</h2>
        </div>
    </div>
    <div class="row">
        <section class="widget padding-bottom">
            <div class="padding-bottom">
                <a href="<c:url value="/create-order"/>" class="btn btn-success"><i class="fa fa-plus"></i> Создать заказ</a>
                <a href="<c:url value="/find-order"/>" class="btn btn-primary"><i class="fa fa-search"></i> Найти заказ</a>
            </div>
            <div class="body">
                <fieldset>
                    <legend>
                        Новые заказы
                        <a href="" class="btn-inverse btn pull-right"><i class="fa fa-print"></i> Распечатать лист новых заказов</a>
                    </legend>
                </fieldset>
                <c:if test="${!empty orders}">
                    <table id="datatable-table" class="table table-striped">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Статус</th>
                            <th>Заказчик</th>
                            <th>Фасон</th>
                            <th>Срок изготовления</th>
                            <th>Состояние</th>
                            <th>Действия</th>
                        </tr>
                        <thead>
                        <tbody>
                        <c:forEach items="${orders}" var="order">
                            <c:if test="${(order.state == '0' || order.state == '1') && order.block !='1'}">
                                <tr>
                                    <td>${order.id}</td>
                                    <td><c:if test="${order.priority == '0'}">Срочный</c:if><c:if test="${order.priority != '0'}">Обычный</c:if></td>
                                    <td>${userList[order.user-1].name}</td>
                                    <td>${fashionList[order.fashion-1].name}</td>
                                    <td>${order.enddate}</td>
                                    <td><span class="label label-default">${stateList[order.state].name}</span><a href="orderStateView/${order.id}" class="label label-info" style="margin-left: 5px">...</a></td>
                                    <td>
                                        <a href="order/${order.id}" class="btn btn-primary"><i class="fa fa-edit"></i> Редактировать</a>
                                        <a href="delete-order/${order.id}" class="btn-danger btn"><i class="fa eicon-trash"></i> Удалить</a>
                                        <a href="start-order/${order.id}" class="btn btn-success"><i class="fa fa-play"></i> Начать выполнение</a>
                                        <a href="stay-handler/${order.id}" class="btn-default btn"><i class="fa fa-step-forward"></i> В обработку</a>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>
                <c:if test="${empty orders}">
                    <div class="alert alert-info">
                        <strong><i class="fa fa-info-circle"></i> Внимание!</strong> К сожалению у вас еще нет заказов!
                    </div>
                </c:if>
            </div>
            <div class="body">
                <fieldset>
                    <legend>
                        Заблокированные заказы
                        <a href="" class="btn-inverse btn pull-right"><i class="fa fa-print"></i> Распечатать лист заблокированных заказов</a>
                    </legend>
                </fieldset>
                <c:if test="${!empty orders}">
                    <table id="datatable-table2" class="table table-striped">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Статус</th>
                            <th>Заказчик</th>
                            <th>Фасон</th>
                            <th>Срок изготовления</th>
                            <th>Состояние</th>
                            <th>Действия</th>
                        </tr>
                        <thead>
                        <tbody>
                        <c:forEach items="${orders}" var="order">
                            <c:if test="${order.block =='1'}">
                                <tr>
                                    <td>${order.id}</td>
                                    <td><c:if test="${order.priority == '0'}">Срочный</c:if><c:if test="${order.priority != '0'}">Обычный</c:if></td>
                                    <td>${userList[order.user-1].name}</td>
                                    <td>${fashionList[order.fashion-1].name}</td>
                                    <td>${order.enddate}</td>
                                    <td><span class="label label-danger">Заблокирован</span><a href="orderStateView/${order.id}" class="label label-info" style="margin-left: 5px">...</a></td>
                                    <td>
                                        <a href="order/${order.id}" class="btn btn-primary"><i class="fa fa-edit"></i> Редактировать</a>
                                        <a href="delete-order/${order.id}" class="btn-danger btn"><i class="fa eicon-trash"></i> Удалить</a>
                                        <a href="block-order/${order.id}" class="btn btn-info"><i class="fa fa-eject"></i> Продолжить выполнение</a>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>
                <c:if test="${empty orders}">
                    <div class="alert alert-info">
                        <strong><i class="fa fa-info-circle"></i> Внимание!</strong> К сожалению у вас нет заблокированных заказов!
                    </div>
                </c:if>
            </div>
            <div class="body">
                <fieldset>
                    <legend>
                        Текущие заказы
                        <a href="" class="btn-inverse btn pull-right"><i class="fa fa-print"></i> Распечатать лист текущих заказов</a>
                    </legend>
                </fieldset>
                <c:if test="${!empty orders}">
                    <table id="datatable-table3" class="table table-striped">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Статус</th>
                            <th>Заказчик</th>
                            <th>Фасон</th>
                            <th>Срок изготовления</th>
                            <th>Состояние</th>
                            <th>Действия</th>
                        </tr>
                        <thead>
                        <tbody>
                        <c:forEach items="${orders}" var="order">
                            <c:if test="${(order.state == '2' || order.state == '3' || order.state =='4' || order.state == '5') && order.block !='1'}">
                                <tr>
                                    <td>${order.id}</td>
                                    <td><c:if test="${order.priority == '0'}">Срочный</c:if><c:if test="${order.priority != '0'}">Обычный</c:if></td>
                                    <td>${userList[order.user-1].name}</td>
                                    <td>${fashionList[order.fashion-1].name}</td>
                                    <td>${order.enddate}</td>
                                    <td><span class="label label-success">${stateList[order.state].name}</span><a href="orderStateView/${order.id}" class="label label-info" style="margin-left: 5px">...</a></td>
                                    <td>
                                        <a href="order/${order.id}" class="btn btn-primary"><i class="fa fa-edit"></i> Редактировать</a>
                                        <a href="delete-order/${order.id}" class="btn-danger btn"><i class="fa eicon-trash"></i> Удалить</a>
                                        <a href="block-order/${order.id}" class="btn btn-danger"><i class="fa fa-pause"></i> Заблокировать</a>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>
                <c:if test="${empty orders}">
                    <div class="alert alert-info">
                        <strong><i class="fa fa-info-circle"></i> Внимание!</strong> К сожалению у вас еще нет заказов в процессе выполнения!
                    </div>
                </c:if>
            </div>
            <div class="body">
                <fieldset>
                    <legend>
                        Выполненные заказы
                    </legend>
                </fieldset>
                <c:if test="${!empty orders}">
                    <table id="datatable-table4" class="table table-striped">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Статус</th>
                            <th>Заказчик</th>
                            <th>Фасон</th>
                            <th>Срок изготовления</th>
                            <th>Инструкция</th>
                        </tr>
                        <thead>
                        <tbody>
                        <c:forEach items="${orders}" var="order">
                            <c:if test="${order.state == '6'}">
                                <tr>
                                    <td>${order.id}</td>
                                    <td><c:if test="${order.priority == '0'}">Срочный</c:if><c:if test="${order.priority != '0'}">Обычный</c:if></td>
                                    <td>${userList[order.user-1].name}</td>
                                    <td>${fashionList[order.fashion-1].name}</td>
                                    <td>${order.enddate}</td>
                                    <td>
                                        <a href="instruction/${order.id}" class="btn btn-primary"><i class="fa eicon-right"></i> Просмотр</a>
                                        <a href="print/${order.id}" class="btn-inverse btn"><i class="fa fa-print"></i> Печать</a>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>
                <c:if test="${empty orders}">
                    <div class="alert alert-info">
                        <strong><i class="fa fa-info-circle"></i> Внимание!</strong> К сожалению у вас еще нет выполненных заказов!
                    </div>
                </c:if>
            </div>
        </section>
    </div>
</div>
</body>
</html>