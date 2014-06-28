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

  <jsp:param name="pageTitle" value="Order" />
</jsp:include>
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
                                                <label class="radio">
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
                                                <label class="radio">
                                                    <form:radiobutton class = "iCheck" path="priority" value="0"/>Срочный
                                                </label>
                                                <label class="radio">
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
                                                <label class="radio">
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
</body>
</html>