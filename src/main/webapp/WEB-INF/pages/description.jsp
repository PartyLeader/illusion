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
    <title>Инструкция продукта</title>
    <link href="<c:url value="/resources/css/application.min.css"/>" rel="stylesheet">
    <link rel="shortcut icon" href="<c:url value="/resources/img/favicon.png"/>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Illusion team">
</head>
<body>

<jsp:include page="header.jsp">
    <jsp:param name="pageTitle" value="description" />
</jsp:include>

<div class="content container wrap">
    <div class="row">
        <div class="col-md-12">
            <h2 class="page-title">Инструкция</h2>
        </div>
    </div>
    <div class="row">
        <section class="widget ">
            <div class="body">
                <div class="row">
                    <div class="col-md-7">
                        <section class="widget">
                                <h4>Информация о заказе</h4>
                                <div class="control-group">
                                    <label class="control-label">Номер заказа</label>
                                    <div class="controls form-group">
                                        <label class="control-label">${product.order}</label>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Заказчик</label>
                                    <div class="controls form-group">
                                        <label class="control-label">${userList[orderList[product.order-1].user-1].name}</label>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Дата выпуска</label>
                                    <div class="controls form-group">
                                        <label class="control-label">${orderList[product.order-1].enddate}</label>
                                    </div>
                                </div>
                                <h4>Информация о продукте</h4>
                                <div class="control-group">
                                    <label class="control-label">Номер продукта</label>
                                    <div class="controls form-group">
                                        <label class="control-label">${product.id}</label>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Фасон изделия</label>
                                    <div class="controls form-group">
                                        <label class="control-label">${fashionList[orderList[product.order-1].fashion-1].name}</label>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Цвет</label>
                                    <div class="controls form-group">
                                        <label class="control-label">${orderList[product.order-1].gen}</label>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Размер</label>
                                    <div class="controls form-group">
                                        <label class="control-label">${sizeList[orderList[product.order-1].size-1].name}</label>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Описание</label>
                                    <div class="controls form-group">
                                        <label class="control-label">${product.specification}</label>
                                    </div>
                                </div>
                                    <div class="control-group">
                                        <label class="control-label">Качество</label>
                                        <div class="controls form-group">
                                            <label class="control-label">${product.quality}</label>
                                        </div>
                                    </div>
                                <div class="form-actions">
                                    <c:if test="${userRole == 'ROLE_USER'}"><a href="<c:url value="/orders"/>" class="btn btn-inverse btn-lg"></c:if>
                                    <c:if test="${userRole == 'ROLE_ADMIN'}"><a href="<c:url value="/analyticView"/>" class="btn btn-inverse btn-lg"></c:if>
                                            <i class="fa eicon-cancel"></i> Закрыть</a>
                                </div>
                        </section>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
</body>
</html>