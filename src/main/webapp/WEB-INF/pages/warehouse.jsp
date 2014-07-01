<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Content-Language" content="English"/>
    <link rel="stylesheet" media="all" href="<c:url value="/resources/site.css"/>">
    <title>Склад</title>
    <link href="<c:url value="/resources/css/application.min.css"/>" rel="stylesheet">
    <link rel="shortcut icon" href="<c:url value="/resources/img/favicon.png"/>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Illusion team">
</head>
<body>

<jsp:include page="header.jsp">
    <jsp:param name="pageTitle" value="warehouse" />
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
            "aoColumnDefs": [
                { "sWidth": "40%", "aTargets": [ -1 ] }
            ],
            "bProcessing": false
        };
        $('#datatable-table').dataTable(default_options);
        $('#datatable-table2').dataTable(default_options);
        $('#datatable-table3').dataTable(default_options);
    });
</script>
<div class="content container wrap">
    <div class="row">
        <div class="col-md-12">
            <h2 class="page-title">Склад</h2>
        </div>
    </div>
    <div class="row">
        <section class="widget padding-bottom">
            <div class="padding-bottom">
                <c:if test="${userRole == 'ROLE_VAHTANG'}">
                    <a href="<c:url value="/add-good"/>" class="btn btn-success"><i class="fa fa-plus"></i> Добавить крапиву на склад</a>
                </c:if>
                <c:if test="${userRole == 'ROLE_HANDLER'}">
                    <a href="<c:url value="/add-good"/>" class="btn btn-success"><i class="fa fa-plus"></i> Добавить нити на склад</a>
                    <a href="<c:url value="/get-good"/>" class="btn btn-success"><i class="fa fa-minus"></i> Взять крапиву со склада</a>
                </c:if>
                <c:if test="${userRole == 'ROLE_TAILOR'}">
                    <a href="<c:url value="/add-good"/>" class="btn btn-success"><i class="fa fa-plus"></i> Добавить изделие на склад</a>
                    <a href="<c:url value="/get-good"/>" class="btn btn-success"><i class="fa fa-minus"></i> Взять нити со склада</a>
                </c:if>
                <c:if test="${userRole == 'ROLE_MAGIC'}">
                    <a href="<c:url value="/get-good"/>" class="btn btn-success"><i class="fa fa-minus"></i> Взять изделие со склада</a>
                </c:if>
            </div>
            <c:if test="${userRole == 'ROLE_ADMIN' || userRole == 'ROLE_HANDLER' || userRole == 'ROLE_VAHTANG'}">
                <div class="body">
                    <fieldset>
                        <legend>
                            Крапива
                        </legend>
                    </fieldset>
                    <c:if test="${!empty warehouses}">
                        <table id="datatable-table" class="table table-striped">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Наименование</th>
                                <th>Качество</th>
                                <th>Количество (в бегемотиках)</th>
                            </tr>
                            <thead>
                            <tbody>
                            <c:forEach items="${warehouses}" var="warehouses">
                                <c:if test="${goodTypeList[goodList[warehouses.good-1].type-1].id == 1}">
                                    <tr>
                                        <td>${warehouses.id}</td>
                                        <td>${warehouses.name}</td>
                                        <td>
                                            <c:if test="${goodList[warehouses.good-1].quality == true}">Трушное</c:if>
                                            <c:if test="${goodList[warehouses.good-1].quality != true}">Фуфловое</c:if>
                                        </td>
                                        <td>${warehouses.count}</td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                    <c:if test="${empty warehouses}">
                        <div class="alert alert-info">
                            <strong><i class="fa fa-info-circle"></i> Внимание!</strong> К сожалению склад опустел!
                        </div>
                    </c:if>
                </div>
            </c:if>
            <c:if test="${userRole == 'ROLE_ADMIN' || userRole == 'ROLE_TAILOR' || userRole == 'ROLE_HANDLER'}">
                <div class="body">
                    <fieldset>
                        <legend>
                            Нити
                        </legend>
                    </fieldset>
                    <c:if test="${!empty warehouses}">
                        <table id="datatable-table2" class="table table-striped">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Наименование</th>
                                <th>Качество</th>
                                <th>Количество (в бегемотиках)</th>
                            </tr>
                            <thead>
                            <tbody>
                            <c:forEach items="${warehouses}" var="warehouses">
                                <c:if test="${goodTypeList[goodList[warehouses.good-1].type-1].id == 2}">
                                    <tr>
                                        <td>${warehouses.id}</td>
                                        <td>${warehouses.name}</td>
                                        <td>
                                            <c:if test="${goodList[warehouses.good-1].quality == true}">Трушное</c:if>
                                            <c:if test="${goodList[warehouses.good-1].quality != true}">Фуфловое</c:if>
                                        </td>
                                        <td>${warehouses.count}</td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                    <c:if test="${empty warehouses}">
                        <div class="alert alert-info">
                            <strong><i class="fa fa-info-circle"></i> Внимание!</strong> К сожалению склад опустел!
                        </div>
                    </c:if>
                </div>
            </c:if>
            <c:if test="${userRole == 'ROLE_ADMIN' || userRole == 'ROLE_MAGIC' || userRole == 'ROLE_TAILOR'}">
                <div class="body">
                    <fieldset>
                        <legend>
                            Изделия
                        </legend>
                    </fieldset>
                    <c:if test="${!empty warehouses}">
                        <table id="datatable-table3" class="table table-striped">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Наименование</th>
                                <th>Качество</th>
                                <th>Количество (в штуках)</th>
                            </tr>
                            <thead>
                            <tbody>
                            <c:forEach items="${warehouses}" var="warehouses" varStatus="index">
                                <c:if test="${goodTypeList[goodList[warehouses.good-1].type-1].id == 3}">
                                    <tr>
                                        <td>${warehouses.id}</td>
                                        <td>${warehouses.name}</td>
                                        <td>
                                            <c:if test="${goodList[warehouses.good-1].quality == true}">Трушное</c:if>
                                            <c:if test="${goodList[warehouses.good-1].quality != true}">Фуфловое</c:if>
                                        </td>
                                        <td>${warehouses.count}</td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                    <c:if test="${empty warehouses}">
                        <div class="alert alert-info">
                            <strong><i class="fa fa-info-circle"></i> Внимание!</strong> К сожалению склад опустел!
                        </div>
                    </c:if>
                </div>
            </c:if>
        </section>
    </div>
</div>
</body>
</html>