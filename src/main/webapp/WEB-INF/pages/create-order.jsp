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
    <title>Создать заказ</title>
</head>
<body>
<script type="text/javascript">
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

  <jsp:param name="pageTitle" value="Login" />
</jsp:include>

<div id="leftcol">
</div>
<form:form modelAttribute="order" method="post" onsubmit="return checkform(this)">
<div id="middlecol" class="note" >
	<h2>Форма заказа</h2>
		<table>
			<tr>
                <td>Размер:</td>
                <td>
                    <select name="size">
                     <c:forEach items="${listSize}" var="friend">
                                <option value="${friend.Id}">${friend.Name}</option>
                            </c:forEach>


                    </select>

                    <form:errors path="size" element="span"/>

               Цвет:

                    <select name="gen">
                    <%
                        String[] colorArray = {"Белый", "Серый", "Черный", "Синий"};
                        for (int i = 0; i < listSize.length; i++) {
                    %>
                            <option value=<%=listSize[i].ID%>>
                            <%= listSize[i].Name %>
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
                    <input type="text" id="mydate" name="enddate" size="10" maxlength="10" onkeyup="dtval(this,event)">
                    <form:errors path="enddate" element="span"/>
                </td>
            </tr>

			<tr>
				<td>Фасон изделия:</td>
				<td>
					<form:radiobutton path="fashion" value="Рубаха"/>Рубаха  <br/>
					<form:radiobutton path="fashion" value="Футболка"/>Футболка    <br/>
					<form:radiobutton path="fashion" value="Свитер"/>Свитер   <br/>
					<form:errors path="fashion" element="span"/>
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