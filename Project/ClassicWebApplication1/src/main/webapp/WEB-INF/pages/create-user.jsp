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
    <title>Create User</title>
</head>
<body>
<script>
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
</script>
<script type="text/javascript">
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
<div id="head">
    <div id="menu-div" aria-label="Site map">
		<ul id="menu-ul">
		    <li><a href="<c:url value="/index" />"><img src="<c:url value="/resources/images/logo.jpg" />" width="100" height="45" alt="Logo®"/></a></li>
			<li class="menu-nav" role="presentation"><a href="<c:url value="/create-user" />" role="button" tabindex="0">Создать заказ</a></li>
			<li class="menu-nav" role="presentation"><a href="<c:url value="/users" />" role="button">Аналитика</a></li>
			<li class="menu-nav" role="presentation"><a href="<c:url value="/index" />" role="button">Задания</a></li>
		</ul>
	</div>
</div><!--head-->
<div id="leftcol">
</div>
<form:form modelAttribute="user" method="post" onsubmit="return checkform(this)">
<div id="middlecol" class="note" >
	<h2>Форма заказа</h2>


		<table>
			<tr>
				<td width="100рх">Контакты:</td>
				<td>
					<form:input  size="30" path="name"/>
					<form:errors path="name" element="span"/>
				</td>
			</tr>
			<tr>
                <td>Размер:</td>
                <td>
                    <select name="razmer">
                    <%
                        String[] testArray = {"X", "XX", "XXL", "L", "S", "XL"};
                        for (int i = 0; i < testArray.length; i++) {
                    %>
                            <option value=<%=testArray[i]%>>
                            <%= testArray[i] %>
                            </option>
                    <%
                        }
                    %>
                    </select>

                    <form:errors path="razmer" element="span"/>

               Цвет:

                    <select name="gen">
                    <%
                        String[] colorArray = {"Белый", "Серый", "Черный", "Синий"};
                        for (int i = 0; i < colorArray.length; i++) {
                    %>
                            <option value=<%=colorArray[i]%>>
                            <%= colorArray[i] %>
                            </option>
                    <%
                        }
                    %>
                    </select>
                    <form:errors path="gen" element="span"/>
                </td>
            </tr>
            <tr>
                <td>Срок изготовления (dd/mm/ccyy):</td>
                <td>
                    <input type="text" id="mydate" name="srok" size="10" maxlength="10" onkeyup="dtval(this,event)">
                    <form:errors path="srok" element="span"/>
                </td>
            </tr>

			<tr>
				<td>Фасон изделия:</td>
				<td>
					<form:radiobutton path="fason" value="Рубаха"/>Рубаха  <br/>
					<form:radiobutton path="fason" value="Футболка"/>Футболка    <br/>
					<form:radiobutton path="fason" value="Свитер"/>Свитер   <br/>
					<form:errors path="fason" element="span"/>
				</td>
			</tr>
			<tr>
				<td>Симптомы:</td>
				<td>
					<form:checkbox path="simptomi" value="Заболевание1"/>Заболевание1<br/>
                    <form:checkbox path="simptomi" value="Заболевание2"/>Заболевание2 <br/>
                    <form:checkbox path="simptomi" value="Заболевание3"/>Заболевание3   <br/>
					<form:errors path="simptomi" element="span"/>
				</td>
			</tr>
		</table>
		<br/>


</div>
<!-- middlecol -->
<div id="rightcol">
    <h2>Пример изделия</h2>
   <img src="<c:url value="/resources/images/body.gif" />" width="100%" height="170" alt="TestDisplay"/>
    Количество
    <select>
      <option>1</option>
      <option>2</option>
      <option>3</option>
      <option>4</option>
    </select>
    <br/>
   <input type="submit" class="button-blue" value="Заказать" />
</div>
	</form:form>
<!-- rightcol -->
</body>
</html>