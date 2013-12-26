<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
 <meta http-equiv="Content-Language" content="English"/>
 <link rel="stylesheet" media="all" href="<c:url value="/resources/site.css"/>">
 <title>Orders</title>
</head>
<body>
<h2>Orders</h2>
<table>
 <tr>
 <th>User</th>
 <th>Gender</th>
 <th>Size</th>
 <th>manufacture period</th>
 <th>Style</th>
  <th>Symptoms</th>
 </tr>
 <c:forEach items="${users}" var="user">
 <tr>
  <td>${user.name}</td>
  <td>${user.gen}</td>
  <td>${user.razmer}</td>
  <td>${user.srok}</td>
  <td>${user.fason}</td>
   <td>${user.simptomi}</td>
 </tr>
 </c:forEach>
</table>
<br/>
<a href="<c:url value="/create-user"/>">Create order</a>
</body>
</html>