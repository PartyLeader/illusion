<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true" %>

<link href="<c:url value="/resources/css/application.min.css"/>" rel="stylesheet">

<script src="<c:url value="/resources/lib/jquery/jquery-2.0.3.min.js"/>"></script>
 <!-- jquery and friends -->
 <script src="<c:url value="/resources/lib/jquery-pjax/jquery.pjax.js"/>"></script>
 <script src="<c:url value="/resources/lib/jquery-maskedinput/jquery.maskedinput.js"/>"></script>
 <!-- jquery plugins -->
 <script src="<c:url value="/resources/lib/parsley/parsley.js"/>"> </script>
 <script src="<c:url value="/resources/lib/icheck.js/jquery.icheck.js"/>"></script>

 <script src="<c:url value="/resources/lib/select2.js"/>"></script>
 <script src="<c:url value="/resources/lib/jquery.autogrow-textarea.js"/>"></script>
 <!--backbone and friends -->
 <script src="<c:url value="/resources/lib/backbone/underscore-min.js"/>"></script>

  <!-- bootstrap default plugins -->
  <script src="<c:url value="/resources/lib/bootstrap/transition.js"/>"></script>
  <script src="<c:url value="/resources/lib/bootstrap/collapse.js"/>"></script>
  <script src="<c:url value="/resources/lib/bootstrap/alert.js"/>"></script>
  <script src="<c:url value="/resources/lib/bootstrap/tooltip.js"/>"></script>
  <script src="<c:url value="/resources/lib/bootstrap/popover.js"/>"></script>
  <script src="<c:url value="/resources/lib/bootstrap/button.js"/>"></script>
  <script src="<c:url value="/resources/lib/bootstrap/dropdown.js"/>"></script>
  <script src="<c:url value="/resources/lib/bootstrap/modal.js"/>"></script>
 <!-- bootstrap custom plugins -->
 <script src="<c:url value="/resources/lib/bootstrap-datepicker.js"/>"></script>
 <script src="<c:url value="/resources/lib/bootstrap-select/bootstrap-select.js"/>"></script>
 <script src="<c:url value="/resources/lib/wysihtml5/wysihtml5-0.3.0_rc2.js"/>"></script>
 <script src="<c:url value="/resources/lib/bootstrap-wysihtml5/bootstrap-wysihtml5.js"/>"></script>
 <script src="<c:url value="/resources/lib/bootstrap-switch.js"/>"></script>
 <script src="<c:url value="/resources/lib/bootstrap-colorpicker.js"/>"></script>

<script src="<c:url value="/resources/js/app.js"/>"></script>
<script src="<c:url value="/resources/js/settings.js"/>"></script>
<script src="<c:url value="/resources/js/forms-elemets.js"/>"></script>

<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="logo">
        <h4><a href="index.html">Иллюзия</a></h4>
    </div>
    <div class="container-fluid">
       <!-- <div class="navbar-header head">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
        </div>   -->
		<div class="navbar-collapse">
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
    </div>
</div><!--head-->
<nav id="sidebar" class="sidebar nav-collapse">
    <ul id="side-nav " class="side-nav">
        <li class="accordion-toggle">
            <a href="index.html"><i class="fa fa-table"></i> <span class="name">Галерея</span></a>
        </li>
        <li class="accordion-toggle">
            <a href="index.html"><i class="fa fa-magic"></i> <span class="name">Заказы</span></a>
        </li>
        <li class="accordion-toggle">
            <a href="index.html"><i class="fa fa-code-fork"></i> <span class="name">Dashboard</span></a>
        </li>
        <li class="accordion-toggle">
            <a href="index.html"><i class="fa fa-home"></i> <span class="name">О нас</span></a>
        </li>
        <li class="accordion-toggle">
            <a href="<c:url value="/create-order" />" role="button" tabindex="0"><i class="fa fa-magic"></i><span class="name"> Создать заказ</span></a></li>
        <li class="accordion-toggle"><a href="<c:url value="/orders" />" role="button"><i class="fa fa-magic"></i><span class="name"> Аналитика</span></a></li>
        <li class="accordion-toggle"><a href="<c:url value="/index" />" role="button"><i class="fa fa-magic"></i><span class="name"> Задания</span></a></li>
        <li class="accordion-toggle"><a href="<c:url value="/adminPage" />" role="button"><i class="fa fa-magic"></i><span class="name"> Админка</span></a></li>
    </ul>
</nav>
