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
  <jsp:param name="pageTitle" value="planWorkAnal" />
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
        $('#datatable-table3').dataTable(default_options);
        $('#datatable-table4').dataTable(default_options);
    });
</script>
<div class="content container wrap">
    <div class="row">
        <div class="col-md-12">
            <h2 class="page-title">План работ</h2>
        </div>
    </div>
    <div class="alert alert-info row">
        <strong>
            <div class="col-md-1">
                <i class="fa fa-info-circle fa-4x"></i>
            </div>
            <div class="col-md-10">
                На этой странице Вы видите все заказы, которые в текущий момент находятся в процессе их выполнения. Чтобы добавить какие-либо заказы в "План работ" - зайдите в раздел "Аналитика" и возобновите приостановленные заказы или начните выполнение новых заказов. Система автоматически расчитает стадии для эти заказов и передаст их на выполнение.
            </div>
        </strong>
    </div>
    <div class="row">
        <section class="widget padding-bottom">
            <div class="body">
                <fieldset>
                    <legend>
                        У сборщика крапивы
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
                            <th>Действия</th>
                        </tr>
                        <thead>
                        <tbody>
                        <c:forEach items="${orders}" var="order">
                            <c:if test="${order.state == '2' && order.block !='1'}">
                                <tr>
                                    <td>${order.id}</td>
                                    <td><c:if test="${order.priority == '0'}">Срочный</c:if><c:if test="${order.priority != '0'}">Обычный</c:if></td>
                                    <td>${userList[order.user-1].name}</td>
                                    <td>${fashionList[order.fashion-1].name}</td>
                                    <td>${order.enddate}</td>
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
                        <strong><i class="fa fa-info-circle"></i> Внимание!</strong> К сожалению у вас еще нет заказов!
                    </div>
                </c:if>
            </div>
            <div class="body">
                <fieldset>
                    <legend>
                        У обработчика крапивы
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
                            <th>Действия</th>
                        </tr>
                        <thead>
                        <tbody>
                        <c:forEach items="${orders}" var="order">
                            <c:if test="${order.state == '3' && order.block !='1'}">
                                <tr>
                                    <td>${order.id}</td>
                                    <td><c:if test="${order.priority == '0'}">Срочный</c:if><c:if test="${order.priority != '0'}">Обычный</c:if></td>
                                    <td>${userList[order.user-1].name}</td>
                                    <td>${fashionList[order.fashion-1].name}</td>
                                    <td>${order.enddate}</td>
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
                        <strong><i class="fa fa-info-circle"></i> Внимание!</strong> К сожалению у вас еще нет заказов!
                    </div>
                </c:if>
            </div>
            <div class="body">
                <fieldset>
                    <legend>
                        У швеи
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
                            <th>Действия</th>
                        </tr>
                        <thead>
                        <tbody>
                        <c:forEach items="${orders}" var="order">
                            <c:if test="${order.state == '4' && order.block !='1'}">
                                <tr>
                                    <td>${order.id}</td>
                                    <td><c:if test="${order.priority == '0'}">Срочный</c:if><c:if test="${order.priority != '0'}">Обычный</c:if></td>
                                    <td>${userList[order.user-1].name}</td>
                                    <td>${fashionList[order.fashion-1].name}</td>
                                    <td>${order.enddate}</td>
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
                        <strong><i class="fa fa-info-circle"></i> Внимание!</strong> К сожалению у вас еще нет заказов!
                    </div>
                </c:if>
            </div>
            <div class="body">
                <fieldset>
                    <legend>
                        У мага
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
                            <th>Действия</th>
                        </tr>
                        <thead>
                        <tbody>
                        <c:forEach items="${orders}" var="order">
                            <c:if test="${order.state == '5' && order.block !='1'}">
                                <tr>
                                    <td>${order.id}</td>
                                    <td><c:if test="${order.priority == '0'}">Срочный</c:if><c:if test="${order.priority != '0'}">Обычный</c:if></td>
                                    <td>${userList[order.user-1].name}</td>
                                    <td>${fashionList[order.fashion-1].name}</td>
                                    <td>${order.enddate}</td>
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
                        <strong><i class="fa fa-info-circle"></i> Внимание!</strong> К сожалению у вас еще нет заказов!
                    </div>
                </c:if>
            </div>
        </section>
    </div>
</div>
</body>
</html>