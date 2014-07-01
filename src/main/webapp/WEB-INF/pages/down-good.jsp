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
    <title>Забор со склада</title>
    <link href="<c:url value="/resources/css/application.min.css"/>" rel="stylesheet">
    <link rel="shortcut icon" href="<c:url value="/resources/img/favicon.png"/>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Illusion team">
</head>
<body>

<jsp:include page="header.jsp">
    <jsp:param name="pageTitle" value="downgood" />
</jsp:include>

<div class="content container wrap">
    <div class="row">
        <div class="col-md-12">
            <h2 class="page-title">Взять
                <c:if test="${userRole == 'ROLE_HANDLER'}"> крапиву </c:if>
                <c:if test="${userRole == 'ROLE_TAILOR'}"> нити </c:if>
                <c:if test="${userRole == 'ROLE_MAGIC'}"> изделия </c:if>
                со склада</h2>
        </div>
    </div>
    <div class="row">
        <section class="widget ">
            <div class="body">
                <div class="row">
                    <div class="col-md-7">
                        <section class="widget">
                            <form:form action="down-good" modelAttribute="warehouse" method="post" onsubmit="true" class="form-horizontal label-left">
                                <div class="control-group">
                                    <label class="control-label">Наименование</label>
                                    <div class="controls form-group">
                                        <select name="good" class="selectpicker " data-style="btn-default">
                                            <c:forEach items="${goodList}" var="item">
                                                <c:if test="${ userRole=='ROLE_HANDLER' && item.type == '1'}">
                                                    <option value="${item.id}">${item.name}</option>
                                                </c:if>
                                                <c:if test="${ userRole=='ROLE_TAILOR' && item.type == '2'}">
                                                    <option value="${item.id}">${item.name}</option>
                                                </c:if>
                                                <c:if test="${ userRole=='ROLE_MAGIC' && item.type == '3'}">
                                                    <option value="${item.id}">${item.name}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                        <form:errors path="good" element="span"/>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Количество</label>
                                    <div class="controls form-group">
                                        <input id="count" name="count" class="form-control parsley-validated" required="required" type="number">
                                        <form:errors path="count" element="span"/>
                                    </div>
                                </div>
                                <div class="form-actions">
                                    <button type="submit" class="btn btn-success btn-lg"><i class="fa fa-check"></i> Взять</button>
                                    <a href="<c:url value="/warehouse"/>" class="btn btn-inverse btn-lg"><i class="fa eicon-cancel"></i> Отмена</a>
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