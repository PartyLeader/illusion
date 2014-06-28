<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true" %>

<link href="<c:url value="/resources/css/application.min.css"/>" rel="stylesheet">

<script src="<c:url value="/resources/lib/jquery/jquery-2.1.1.js"/>"></script>
<script src="<c:url value="/resources/lib/jquery/jquery-2.1.1.min.js"/>"></script>

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
  <script src="<c:url value="/resources/lib/bootstrap/carousel.js"/>"></script>
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
<script src="<c:url value="/resources/lib/jquery.dataTables.min.js"/>"></script>

<div class="logo">
    <h3><a href="index.html"><strong>Иллюзия</strong></a></h3>
</div>
<div class="container-fluid page-header">
	<div id="user-menu">
				<c:if test="${userRole =='ROLE_ANONYMOUS'}">
				    <a href="<c:url value="/login.jsp" />" style="color:white"><u>Авторизация</u></a>
                    /
                    <a href="<c:url value="" />" style="color:white"><u>Регистрация</u></a>
				</c:if>
				<c:if test="${userRole !='ROLE_ANONYMOUS'}">
			        <c:out value="${userName}/" />
				    <a href="<c:url value="/logout" />" style="color:white"><u>Выйти</u></a>
				</c:if>
	</div>
</div>

<!--head-->
<div class="sidebar nav-collapse collapse">
    <ul id="side-nav" class="side-nav">
        <li>
            <a href="<c:url value="index.html"/>">
                <i class="fa fa-picture-o"></i>
                <span class="name">Галерея</span>
            </a>
        </li>
        <c:if test="${userRole =='ROLE_USER'}">
            <li>
                <a href="<c:url value="/orders" />">
                    <i class="fa fa-magic"></i>
                    <span class="name">Заказы</span>
                </a>
            </li>
        </c:if>
        <c:if test="${userRole =='ROLE_ADMIN'}">
            <li>
                <a href="<c:url value="/analyticView" />" role="button">
                    <i class="fa fa-star-half-empty"></i>
                    <span class="name">Аналитика</span>
                </a>
            </li>
        </c:if>
        <c:if test="${userRole !='ROLE_ANONYMOUS' && userRole !='ROLE_USER'}">
            <li>
                <a href="<c:url value="" />" role="button">
                    <i class="fa fa-tasks"></i>
                    <span class="name">План работ</span>
                </a>
            </li>
        </c:if>
        <c:if test="${userRole !='ROLE_ANONYMOUS' && userRole !='ROLE_USER'}">
            <li>
                <a href="<c:url value="" />" role="button">
                    <i class="fa fa-dropbox"></i>
                    <span class="name">Склад</span>
                </a>
            </li>
        </c:if>
        <c:if test="${userRole =='ROLE_ADMIN'}">
            <li class="panel">
                <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#side-nav" href="form_elements.html#forms-collapse" role="button">
                    <i class="fa fa-wrench"></i>
                    <span class="name">Админка</span>
                </a>
                <ul id="forms-collapse" class="panel-collapse collapse">
                    <li><a href="<c:url value="/controlUsers"/>">Пользователи</a></li>
                   <%-- <li><a href="<c:url value="/controlUsersCustomers"/>">Заказчики</a></li> --%>
                    <li><a href="<c:url value="/adminPageMagic"/>">Магические свойства</a></li>
                    <li><a href="<c:url value="/adminPageRecipe"/>">Рецепты</a></li>
                    <li><a href="<c:url value="/adminPageFashion"/>">Фасоны</a></li>
                    <li><a href="<c:url value="/adminPageSize"/>">Размеры</a></li>
                </ul>
            </li>
        </c:if>
        <li class="accordion-toggle">
            <a href="index.html">
                <i class="fa fa-home"></i>
                <span class="name">О нас</span>
            </a>
        </li>
    <div class="col-xs-4">
        <a href="<c:url value="/first-load" />" class="btn-icons btn btn-transparent btn-sm">First Load</a>
    </div>
</div>

