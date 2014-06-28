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
    <title>Админка: Рецепты</title>
        <link href="<c:url value="/resources/css/application.min.css"/>" rel="stylesheet">
         <link rel="shortcut icon" href="<c:url value="/resources/img/favicon.png"/>">
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <meta name="author" content="Illusion team">
</head>
<body>
<jsp:include page="header.jsp">
    <jsp:param name="pageTitle" value="adminPageRecipe"/>
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
                { "sWidth": "50%", "aTargets": [ -1 ] }
            ],
            "bProcessing": false
        };
        $('#datatable-table').dataTable(default_options);
    });
</script>

<div class="content container wrap">
    <div class="row">
        <div class="col-md-12">
            <h2 class="page-title">Админка: Рецепты</h2>
        </div>
    </div>
    <div class="row">
        <section class="widget padding-bottom">
            <div class="padding-bottom">
                <a href="<c:url value="/create-recipe"/>" class="btn btn-success"><i class="fa fa-plus"></i> Добавить рецепт</a>
            </div>
            <c:if test="${!empty recipeList}">
                <table id="datatable-table" class="table table-striped">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Название</th>
                        <th>Спецификация</th>
                    </tr>
                    <thead>
                    <tbody>
                    <c:forEach items="${recipeList}" var="recipes" varStatus="index">
                        <tr>
                            <td>${index.count}</td>
                            <td>${recipes.name}</td>
                            <td>${recipes.specification}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <c:if test="${empty recipeList}">
                <div class="alert alert-info">
                    <strong><i class="fa fa-info-circle"></i> Внимание!</strong> К сожалению у вас еще нет рецептов!
                </div>
            </c:if>
        </section>
    </div>
</div>
</body>
</html>

