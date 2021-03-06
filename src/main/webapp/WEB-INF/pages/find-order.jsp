<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
 <meta http-equiv="Content-Language" content="English"/>
 <link rel="stylesheet" media="all" href="<c:url value="/resources/site.css"/>">
 <title>Поиск заказа</title>
         <link href="<c:url value="/resources/css/application.min.css"/>" rel="stylesheet">
          <link rel="shortcut icon" href="<c:url value="/resources/img/favicon.png"/>">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <meta name="author" content="Illusion team">
</head>
<body>

<jsp:include page="header.jsp">
  <jsp:param name="pageTitle" value="findOrder" />
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
    });
</script>
<div class="content container wrap">
    <div class="row">
        <div class="col-md-12">
            <h2 class="page-title">Поиск заказа</h2>
        </div>
    </div>
    <div class="row">
        <section class="widget padding-bottom">
            <div class="body">
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
                            <th>Действия/Инструкция</th>
                        </tr>
                        <thead>
                        <tbody>
                        <c:forEach items="${orders}" var="orders" varStatus="index">
                            <tr>
                                <td>${index.count}</td>
                                <td><c:if test="${orders.priority == '0'}">Срочный</c:if><c:if test="${orders.priority != '0'}">Обычный</c:if></td>
                                <td>${userList[orders.user-1].name}</td>
                                <td>${fashionList[orders.fashion-1].name}</td>
                                <td>${orders.enddate}</td>
                                <td>
                                    <c:if test="${(orders.state == '0' || orders.state == '1') && orders.block != 1}">
                                            <span class="label label-default">
                                        </c:if>
                                        <c:if test="${(orders.state == '2' || orders.state == '3' || orders.state =='4' || orders.state == '5') && orders.block != 1}">
                                            <span class="label label-success">
                                        </c:if>
                                        <c:if test="${orders.block == '1'}" >
                                            <span class="label label-danger">
                                        </c:if>
                                        <c:if test="${orders.state == '6'}">
                                            <span class="label label-info">
                                        </c:if>
                                                    ${stateList[orders.state].name}</span>
                                </td>
                                <td>
                                    <c:if test="${(orders.state == '0' || orders.state == '1') && orders.block != 1}">
                                        <a href="order/${orders.id}" class="btn btn-primary"><i class="fa fa-edit"></i> Редактировать</a>
                                        <a href="delete-order/${orders.id}" class="btn-danger btn"><i class="fa eicon-trash"></i> Удалить</a>
                                        <a href="start-order/${orders.id}" class="btn btn-success"><i class="fa fa-play"></i> Начать выполнение</a>
                                        <a href="stay-handler/${orders.id}" class="btn-default btn"><i class="fa fa-step-forward"></i> Поставить в обработку</a>
                                    </c:if>
                                    <c:if test="${(orders.state == '2' || orders.state == '3' || orders.state =='4' || orders.state == '5') && orders.block != 1}">
                                        <a href="order/${orders.id}" class="btn btn-primary"><i class="fa fa-edit"></i> Редактировать</a>
                                        <a href="delete-order/${orders.id}" class="btn-danger btn"><i class="fa eicon-trash"></i> Удалить</a>
                                        <a href="block-order/${orders.id}" class="btn btn-danger"><i class="fa fa-pause"></i> Заблокировать</a>
                                    </c:if>
                                    <c:if test="${orders.block == '1'}" >
                                        <a href="order/${orders.id}" class="btn btn-primary"><i class="fa fa-edit"></i> Редактировать</a>
                                        <a href="delete-order/${orders.id}" class="btn-danger btn"><i class="fa eicon-trash"></i> Удалить</a>
                                        <a href="block-order/${orders.id}" class="btn btn-info"><i class="fa fa-eject"></i> Продолжить выполнение</a>
                                    </c:if>
                                    <c:if test="${orders.state == '6'}">
                                        <a href="instruction/${orders.id}" class="btn btn-primary"><i class="fa eicon-right"></i> Просмотр</a>
                                        <a href="print/${orders.id}" class="btn-inverse btn"><i class="fa fa-print"></i> Печать</a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>
                <c:if test="${empty orders}">
                    <div class="alert alert-info">
                        <strong><i class="fa fa-info-circle"></i> Внимание!</strong> К сожалению заказы не найдены!
                    </div>
                </c:if>
            </div>
        </section>
    </div>
</div>
</body>
</html>