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
    <title>Login</title>
</head>
<body>
<div id="leftcol">
    <img src="<c:url value="/images/logo.gif" />" width="100" height="50" alt="Logo"/>
</div>
<div id="middlecol" class="note" >
		<table>

            <tr>
                <td><a href="/users">Войти</a></td>
            </tr>
        </table>
</div><!-- middlecol -->
<div id="rightcol">
</div><!-- rightcol -->
</body>
</html>