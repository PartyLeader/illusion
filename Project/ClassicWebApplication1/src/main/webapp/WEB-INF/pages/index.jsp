<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
 <meta http-equiv="Content-Language" content="English"/>
 <link rel="stylesheet" media="all" href="<c:url value="/resources/site.css"/>">
 <title>Заказ клиента</title>
</head>
<body>
<div id="head">
    <div id="menu-div" aria-label="Site map">
		<ul id="menu-ul">
		    <li><a href="<c:url value="/index" />"><img src="<c:url value="/resources/images/logo.jpg" />" width="100" height="45" alt="Logo®"/></a></li>
			<li class="menu-nav" role="presentation"><a href="<c:url value="/create-user" />" role="button" tabindex="0">Создать заказ</a></li>
			<li class="menu-nav" role="presentation"><a href="<c:url value="/users" />" role="button">Аналитика</a></li>
			<li class="menu-nav" role="presentation"><a href="<c:url value="/index" />" role="button">Задания</a></li>
		</ul>
		 <c:out value="${role}" />
	</div>
</div><!--head-->
<div id="leftcol">

</div>
<div id="middlecol2">

    <a href="<c:url value="/users"/>">Список заказов</a>
</div>
</body>
</html>