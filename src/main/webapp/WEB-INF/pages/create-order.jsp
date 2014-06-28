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

    <title>Создание заказ</title>

    <link href="<c:url value="/resources/css/application.min.css"/>" rel="stylesheet">
    <link rel="shortcut icon" href="<c:url value="/resources/img/favicon.png"/>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Illusion team">
</head>
<body class="background-dark wysihtml5-supported">

    <script type="text/javascript">
        $(document).ready(function () {
        $('.fashioncheck input:radio').change(function () {
                alert("Radio button selection changed. Selected: ");
            });
        });

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
    <jsp:include page="header.jsp">
      <jsp:param name="pageTitle" value="СreateOrder" />
    </jsp:include>

<div class="content container wrap">
    <div class="row">
        <div class="col-md-12">
            <h2 class="page-title">Создание нового заказа</h2>
        </div>
    </div>
    <div class="row">
        <section class="widget">
            <div class="body no-margin">
                <div class="row">
                    <div class="col-md-7">
                        <section class="widget">
                            <div class="body">
                                 <form:form modelAttribute="order" method="post" class="form-horizontal label-left" onsubmit="return checkform(this)">
                                    <div class="control-group">
                                        <label for="description" class="control-label">Контакты</label>
                                        <div class="controls form-group padding-left">
                                            <textarea id="description" rows="3" name="text" class="form-control parsley-validated" required="required"></textarea>
                                        </div>
                                    </div>
                                   <div class="control-group">
                                        <label class="control-label">Фасон изделия</label>
                                        <div class="controls form-group">
                                             <c:forEach items="${fashionList}" var="item">
                                                <label class="radio" id="fashion">
                                                    <form:radiobutton class = "iCheck fashioncheck" path="fashion" value="${item.id}"/>${item.name}
                                                </label>
                                            </c:forEach>
                                        </div>
                                    </div>
                                   <div class="control-group">
                                        <label for="description" class="control-label">Парамерты</label>
                                       <div class="control-label padding-left">
                                        <span class="padding-left">
                                            <select name="size" class="selectpicker " data-style="btn-default">
                                                <c:forEach items="${sizeList}" var="item">
                                                        <option value="${item.id}">${item.name}</option>
                                                </c:forEach>
                                            </select>
                                        </span>
                                        <span class="input-group padding-left margin-top">
                                            <input id="color" class="colorpicker" type="text" name="gen" value="#eac85e">
                                            <span id="color-holder" class="input-group-addon" style="background-color: #eac85e;">&nbsp;&nbsp;&nbsp;</span>
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
                                        <label for="description" class="control-label">Срок изготовления (dd/mm/yyyy)</label>
                                        <div class="controls form-group padding-left">
                                           <input id="in-place-date" class="form-control date-picker parsley-validated" required="required" type="text" name="enddate" value="">
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
                                        <button type="submit" class="btn btn-success btn-lg"><i class="fa fa-check"></i> Создать</button>
                                        <button type="button" class="btn btn-inverse btn-lg"><i class="fa eicon-cancel"></i> Отмена</button>
                                    </div>
                                </form>
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
                                            <img src="<c:url value="/resources/img/fashionPictures/1.jpg"/>" alt="">
                                    </li>
                                </ul>
                             </div>
                        </section>
                </div>
            </div>
          </div>
        </section>
    </div>
	</form:form>
</div>
</body>
</html>