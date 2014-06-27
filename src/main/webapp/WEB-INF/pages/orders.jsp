<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
 <meta http-equiv="Content-Language" content="English"/>
 <link rel="stylesheet" media="all" href="<c:url value="/resources/site.css"/>">
 <title>Заказы</title>
         <link href="<c:url value="/resources/css/application.min.css"/>" rel="stylesheet">
          <link rel="shortcut icon" href="<c:url value="/resources/img/favicon.png"/>">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <meta name="author" content="Illusion team">
</head>
<body>
<jsp:include page="header.jsp">
  <jsp:param name="pageTitle" value="Orders" />
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
                        "sPrevious":"Пред.",
                    }
                },
                "bSort": true,
                "aaSorting": [[ 1, "desc" ]],
            "bProcessing": false
        };
        $('#datatable-table').dataTable(default_options);
    });
</script>
<div class="content container wrap">
    <div class="row">
        <div class="col-md-12">
            <h2 class="page-title">Заказы</h2>
        </div>
    </div>
    <div class="row">
        <section class="widget padding-bottom">
            <div class="padding-bottom">
                <a href="<c:url value="/create-order"/>" class="btn btn-success"><i class="fa fa-plus"></i> Создать заказ</a>
                <a href="<c:url value="/orders"/>" class="btn btn-inverse pull-right">Снять фильтр</a>
                <a href="<c:url value="/orderfilters"/>" class="btn btn-inverse pull-right">Фильтр</a>
            </div>
            <div class="body">
                <c:if test="${!empty orders}">
                    <table id="datatable-table" class="table table-striped">
                        <thead>
                             <tr>
                                 <th>#</th>
                                 <th>Статус</th>
                                 <th>Фасон</th>
                                 <th>Срок изготовления</th>
                                 <th>Состояние</th>
                                 <th>Действия</th>
                             </tr>
                        <thead>
                        <tbody>
                             <c:forEach items="${orders}" var="order" varStatus="index">
                                    <tr class="${index.count % 2 == 0 ? 'even': 'odd'}"/>
                                        <td>${index.count}</td>
                                        <td>${order.priority}</td>
                                        <td>${order.fashion}</td>
                                        <td>${order.enddate}</td>
                                        <td>${order.state}</td>
                                        <td>
                                            <a href="order/${order.id}" class="btn btn-primary"><i class="fa fa-edit"></i> Редактировать</a>
                                            <a href="delete-order/${order.id}" class="btn-danger btn"><i class="fa eicon-trash"></i> Удалить</a>
                                        </td>
                                     </tr>
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