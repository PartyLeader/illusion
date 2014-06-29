<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
 <meta http-equiv="Content-Language" content="English"/>
 <link rel="stylesheet" media="all" href="<c:url value="/resources/site.css"/>">
 <title>Детализация состояния заказа</title>
         <link href="<c:url value="/resources/css/application.min.css"/>" rel="stylesheet">
          <link rel="shortcut icon" href="<c:url value="/resources/img/favicon.png"/>">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <meta name="author" content="Illusion team">
</head>
<body>
<jsp:include page="header.jsp">
  <jsp:param name="pageTitle" value="orderStateView" />
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
                "aaSorting": [[ 0, "asc" ]],
            "bProcessing": false
        };
        $('#datatable-table').dataTable(default_options);
    });
</script>
<div class="content container wrap">
    <div class="row">
        <div class="col-md-12">
            <h2 class="page-title">Детализация состояния заказа</h2>
        </div>
    </div>
    <div class="row">
        <section class="widget padding-bottom">
            <div class="body">
                <div class="control-group col-lg-3"><h4>
                    <div><label class="control-label">Заказ №</label></div>
                    <div><label class="control-label">Текущее состояние</label></div>
                </h4></div>
                <div class="control-group col-lg-3"><h4>
                    <div><label class="control-label padding-left">${orderID}</label></div>
                    <div>
                        <label class="control-label padding-left">
                            <c:if test="${orderslist[orderID-1].block == '1'}">
                                Заблокирован
                            </c:if>
                            <c:if test="${orderslist[orderID-1].block != '1'}">
                                ${stateList[orderslist[orderID-1].state].name}
                            </c:if>
                        </label>
                    </div>
                </h4></div>
                <fieldset>
                    <legend>
                        Выполнение заказа
                    </legend>
                </fieldset>
                <table id="datatable-table" class="table table-striped">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Состояние</th>
                        <th>Прогресс</th>
                    </tr>
                    <thead>
                    <tbody>
                    <c:forEach items="${stateList}" var="states" varStatus="index">
                                <tr>
                                    <td>${index.count}</td>
                                    <td>
                                        <c:if test="${orderslist[orderID-1].block != '0' && states.id == orderslist[orderID-1].state + 1}">
                                            <b>Заблокирован в состоянии: </b>
                                        </c:if>
                                            ${states.name}
                                    </td>
                                    <td>
                                        <c:if test="${states.id < orderslist[orderID-1].state + 1}">
                                            <div class="badge badge-success">Выполнено</div>
                                        </c:if>
                                        <c:if test="${states.id == orderslist[orderID-1].state + 1}">
                                            <div class="badge badge-warning">В процессе</div>
                                        </c:if>
                                        <c:if test="${states.id > orderslist[orderID-1].state + 1}">
                                            <div class="badge badge-danger">Не выполнено</div>
                                        </c:if>
                                    </td>
                                </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </section>
    </div>
</div>
</body>
</html>