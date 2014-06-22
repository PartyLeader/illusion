<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true" %>
<div id="head">
    <div id="menu-div" aria-label="Site map">
		<ul id="menu-ul">
		    <li><a href="<c:url value="/index" />"><img src="<c:url value="/resources/images/logo.jpg" />" width="100" height="45" alt="Logo®"/></a></li>
			<li class="menu-nav" role="presentation"><a href="<c:url value="/create-order" />" role="button" tabindex="0">Создать заказ</a></li>
			<li class="menu-nav" role="presentation"><a href="<c:url value="/orders" />" role="button">Аналитика</a></li>
			<li class="menu-nav" role="presentation"><a href="<c:url value="/index" />" role="button">Задания</a></li>
            <li class="menu-nav" role="presentation"><a href="<c:url value="/adminPage" />" role="button">Админка</a></li>
		</ul>
		<div id="user-menu">
            <c:if test="${role=='guest'}">
                 <a href="<c:url value="/login.jsp" />">Авторизация</a>
            </c:if>
            <c:if test="${role !='guest'}">
                          <c:out value="${role}" />
                    </c:if>
            /
            <a href="<c:url value="/logout" />">Выйти</a>
        </div>
	</div>

</div><!--head-->