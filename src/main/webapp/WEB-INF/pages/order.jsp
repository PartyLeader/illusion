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
 <title>Заказ клиента</title>
         <link href="<c:url value="/resources/css/application.min.css"/>" rel="stylesheet">
          <link rel="shortcut icon" href="<c:url value="/resources/img/favicon.png"/>">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <meta name="author" content="Illusion team">
</head>
<body>
<jsp:include page="header.jsp">

  <jsp:param name="pageTitle" value="order" />
</jsp:include>

<script type="text/javascript">

    function refreshImage(img){
        document.getElementById("showImg").src="<c:url value="/resources/img/fashionPictures/"/>" + (img-1) + ".jpg";
    }
    function dtval(d,e) {
        var pK = e ? e.which : window.event.keyCode;
        if (pK == 8) {d.value = substr(0,d.value.length-1); return;}
        var dt = d.value;
        var da = dt.split('/');
        for (var a = 0; a < da.length; a++) {if (da[a] != +da[a]) da[a] = da[a].substr(0,da[a].length-1);}
        if (da[0] > 31) {da[1] = da[0].substr(da[0].length-1,1);da[0] = '0'+da[0].substr(0,da[0].length-1);}
        if (da[1] > 12) {da[2] = da[1].substr(da[1].length-1,1);da[1] = '0'+da[1].substr(0,da[1].length-1);}
        if (da[2] > 9999) da[1] = da[2].substr(0,da[2].length-1);
        dt = da.join('/');
        if (dt.length == 2 || dt.length == 5) dt += '/';
        d.value = dt;
    }
    function checkform(f) {
        if (f.name.value=="") {
            alert("Заполните контактные данные");
            return false;
        }
        if (f.srok.value == "") {
            alert("Не указан срок изготовления");
            return false;
        }

        return true;
    }
</script>
<div class="content container wrap">
    <div class="row">
        <div class="col-md-12">
            <h2 class="page-title">Редактирование заказа</h2>
        </div>
    </div>
    <div class="row">
        <section class="widget">
            <div class="body no-margin">
                <div class="row">
                    <div class="col-md-7">
                        <section class="widget">
                            <div class="body">
                                <form:form modelAttribute="order" method="post" class="form-horizontal label-left" onsubmit="true">
                                    <c:if test="${order.state < '2'}">
                                    <div class="control-group">
                                        <c:if test="${userRole == 'ROLE_ADMIN'}">
                                            <div class="control-group">
                                                <label class="control-label">Заказчик</label>
                                                <div class="controls form-group padding-left">
                                                    <form:select path="user" class="selectpicker" data-style="btn-default" id="user">
                                                        <c:forEach items="${userList}" var="item">
                                                            <c:if test="${item.role == '3'}">
                                                                <form:option value="${item.id}" label="${item.name}"/>
                                                            </c:if>
                                                        </c:forEach>
                                                    </form:select>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">Фасон изделия</label>
                                        <div class="controls form-group">
                                            <c:forEach items="${fashionList}" var="item">
                                                <label class="radio" id="fashion" onclick="refreshImage(${item.id})">
                                                    <form:radiobutton class = "iCheck fashioncheck" path="fashion" value="${item.id}"/>${item.name}
                                                </label>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">Парамерты</label>
                                        <div class="control-label padding-left">
                                        <span class="padding-left">
                                            <form:select name="size" class="selectpicker " data-style="btn-default" id="size" path="size">
                                                <c:forEach items="${sizeList}" var="item">
                                                    <form:option value="${item.id}" label="${item.name}"/>
                                                </c:forEach>
                                            </form:select>
                                        </span>
                                        <span class="input-group padding-left margin-top">
                                            <form:input id="color" class="colorpicker" type="text" name="gen" value="" path="gen"/>
                                            <span id="color-holder" class="input-group-addon" >&nbsp;&nbsp;&nbsp;</span>
                                        </span>
                                        </div>
                                        <form:errors path="size" element="span"/>
                                    </div>
                                    <div class="control-group margin-top">
                                        <label class="control-label">Тип заказа</label>
                                        <div class="controls form-group">
                                            <label class="radio" id="priority1">
                                                <form:radiobutton class = "iCheck" path="priority" value="0"/>Срочный
                                            </label>
                                            <label class="radio" id="priority2">
                                                <form:radiobutton class = "iCheck" path="priority" value="1"/>Обычный
                                            </label>
                                            <form:errors path="priority" element="span"/>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">Срок изготовления (dd/mm/yyyy)</label>
                                        <div class="controls form-group padding-left">
                                            <form:input id="in-place-date" class="form-control date-picker parsley-validated" required="required" type="text" name="enddate" value="" path="enddate"/>
                                            <form:errors path="enddate" element="span"/>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">Симптомы</label>
                                        <div class="controls form-group">
                                            <c:forEach items="${recipeList}" var="item">
                                                <label class="radio" id="recipe">
                                                    <form:radiobutton class = "iCheck" path="recipe" value="${item.id}"/>${item.name}
                                                </label>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div class="form-actions">
                                        <button type="submit" class="btn btn-success btn-lg"><i class="fa fa-check"></i> Сохранить</button>
                                        <c:if test="${userRole == 'ROLE_USER'}">
                                            <a href="<c:url value="/orders"/>" class="btn btn-inverse btn-lg"><i class="fa eicon-cancel"></i> Отмена</a>
                                        </c:if>
                                        <c:if test="${userRole == 'ROLE_ADMIN'}">
                                            <a href="<c:url value="/analyticView"/>" class="btn btn-inverse btn-lg"><i class="fa eicon-cancel"></i> Отмена</a>
                                        </c:if>
                                    </div>
                                    </c:if>
                                    <c:if test="${order.state >= '2'}">
                                        <div class="control-group">
                                            <c:if test="${userRole == 'ROLE_ADMIN'}">
                                                <div class="control-group">
                                                    <label class="control-label">Заказчик</label>
                                                    <div class="controls form-group padding-left">
                                                        <label>${userList[order.user-1].name}</label>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">Фасон изделия</label>
                                            <div class="controls form-group padding-left">
                                                <label>${fashionList[order.fashion-1].name}</label>
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">Парамерты</label>
                                            <div class="control-label padding-left">
                                                <span class="padding-left">
                                                    <label>${sizeList[order.size-1].name}</label>
                                                </span>
                                                <span class="input-group padding-left margin-top">
                                                    <label>${order.gen}</label>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">Тип заказа</label>
                                            <div class="controls form-group  padding-left">
                                                <label>${order.priority}</label>
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">Срок изготовления (dd/mm/yyyy)</label>
                                            <div class="controls form-group padding-left">
                                                <form:input id="in-place-date" class="form-control date-picker parsley-validated" required="required" type="text" name="enddate" value="" path="enddate"/>
                                                <form:errors path="enddate" element="span"/>
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">Симптомы</label>
                                            <div class="controls form-group padding-left">
                                                <label>${recipeList[order.recipe-1].name}</label>
                                            </div>
                                        </div>
                                        <div class="form-actions">
                                            <button type="submit" class="btn btn-success btn-lg"><i class="fa fa-check"></i> Сохранить</button>
                                            <c:if test="${userRole == 'ROLE_USER'}">
                                                <a href="<c:url value="/orders"/>" class="btn btn-inverse btn-lg"><i class="fa eicon-cancel"></i> Отмена</a>
                                            </c:if>
                                            <c:if test="${userRole == 'ROLE_ADMIN'}">
                                                <a href="<c:url value="/analyticView"/>" class="btn btn-inverse btn-lg"><i class="fa eicon-cancel"></i> Отмена</a>
                                            </c:if>
                                        </div>
                                    </c:if>
                                </form:form>
                            </div>
                        </section>
                    </div>
                    <div class="col-md-5">
                        <section class="widget">
                            <header>
                                <h4>
                                    <i class="fa fa-star"></i>
                                    Предпросмотр
                                </h4>
                            </header>
                            <div class="body">
                                <ul class="row thumbnails">
                                    <li class="col-sm-4">
                                        <c:if test="${order.state >= '2'}">
                                            <img id="showImg" src="<c:url value="/resources/img/fashionPictures/${order.fashion-1}.jpg"/>" alt="">
                                        </c:if>
                                        <c:if test="${order.state < '2'}">
                                            <img id="showImg" src="<c:url value="/resources/img/fashionPictures/1.jpg"/>" alt="">
                                        </c:if>
                                    </li>
                                </ul>
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