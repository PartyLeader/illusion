<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>Ошибка 403</title>
    <link href="<c:url value="/resources/css/application.min.css"/>" rel="stylesheet">

    <script src="<c:url value="/resources/lib/jquery/jquery-2.1.1.js"/>"></script>
    <script src="<c:url value="/resources/lib/jquery/jquery-2.1.1.min.js"/>"></script>
    <link rel="shortcut icon" href="img/favicon.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta charset="utf-8">
    <script src="<c:url value="/resources/lib/jquery-pjax/jquery.pjax.js"/>"></script>
    <script src="<c:url value="/resources/lib/parsley/parsley.js"/>"> </script>
</head>
<body>
<div class="single-widget-container error-page">
    <section class="widget transparent widget-404">
        <div class="body">
            <div class="row">
                <div class="col-md-5">
                    <h1 class="text-align-center">403</h1>
                </div>
                <div class="col-md-7">
                    <div class="description">
                        <h3>Opps, Вы кажется не авторизованы для таких запросов!</h3>
                    </div>
                </div>
            </div>
        </div>
</div>
</body>
</html>