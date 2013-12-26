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
<h2>Create order</h2>
<form:form modelAttribute="user" method="post">
 <table>
 <tr>
  <td>User:</td>
  <td>
  <form:input path="name"/>
  <form:errors path="name" element="span"/>
  </td>
 </tr>
 <tr>
  <td>Gender:</td>
  <td>
  <form:input path="gen" />
  <form:errors path="gen" element="span"/>
  </td>
 </tr>
  <tr>
   <td>Size:</td>
   <td>
   <form:input path="razmer" />
   <form:errors path="razmer" element="span"/>
   </td>
  </tr>
   <tr>
    <td>Manufacturing period:</td>
    <td>
    <form:input path="srok" />
    <form:errors path="srok" element="span"/>
    </td>
   </tr>
      <tr>
       <td>Style:</td>
       <td>
       <form:input path="fason" />
       <form:errors path="fason" element="span"/>
       </td>
     </tr>
        </tr>
           <tr>
            <td>symptoms:</td>
            <td>
            <form:input path="simptomi" />
            <form:errors path="simptomi" element="span"/>
            </td>
          </tr>
 </table>
 <br/>
 <input type="submit" value="Create" />
</form:form>
</body>
</html>