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
<jsp:include page="header.jsp">

  <jsp:param name="pageTitle" value="Login" />
</jsp:include>

<div id="leftcol">
</div>
<div id="middlecol2" class="note">
    <form:form modelAttribute="order" action="task" method="post">
        <table>
         <tr>
            <td width="100рх">Контакты:</td>
            <td>
                <form:input  size="30" path="worker"/>
                <form:errors path="worker" element="span"/>
            </td>
         </tr>
           <tr>
              <td width="100рх">Комментарий:</td>
              <td>
                  <textarea name="message" cols="40" rows="3">${order.message}</textarea><br/>
                  <form:errors path="message" element="span"/>                     <br/>
              </td>
           </tr>
        </t able>
         <input type="submit" class="button-blue" value="Изменить" />
	</form:form>

</div>
</body>
</html>