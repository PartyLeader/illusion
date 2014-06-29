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
    <title>Добавление рецепта</title>
        <link href="<c:url value="/resources/css/application.min.css"/>" rel="stylesheet">
         <link rel="shortcut icon" href="<c:url value="/resources/img/favicon.png"/>">
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <meta name="author" content="Illusion team">
</head>
<body>
<jsp:include page="header.jsp">
  <jsp:param name="pageTitle" value="createRecipe" />
</jsp:include>
<div class="content container wrap">
    <div class="row">
        <div class="col-md-12">
            <h2 class="page-title">Добавление рецепта</h2>
        </div>
    </div>
    <div class="row">
        <section class="widget">
            <div class="body">
                <div class="row">
                    <div class="col-md-7">
                        <section class="widget">
                            <form:form action="adminPageRecipe" modelAttribute="recipe" method="post" onsubmit="true" class="form-horizontal label-left">
                                <div class="control-group">
                                    <label class="control-label">Рецепт</label>
                                    <div class="controls form-group">
                                        <input id="name" name="name" class="form-control parsley-validated" required="required">
                                        <form:errors path="name" element="span"/>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Спецификация</label>
                                    <div class="controls form-group">
                                        <textarea rows="3" id="specification" name="specification" class="form-control parsley-validated" required="required"></textarea>
                                        <form:errors path="name" element="span"/>
                                    </div>
                                </div>
                                <div class="form-actions">
                                    <button type="submit" class="btn btn-success btn-lg"><i class="fa fa-check"></i> Добавить</button>
                                    <a href="<c:url value="/adminPageRecipe"/>" class="btn btn-inverse btn-lg"><i class="fa eicon-cancel"></i> Отмена</a>
                                </div>
                            </form:form>
                        </section>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
</body>
</html>
