<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Login</title>
    <link href="<c:url value="/resources/css/application.min.css"/>" rel="stylesheet">
     <link rel="shortcut icon" href="<c:url value="/resources/img/favicon.png"/>">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <meta name="author" content="Illusion team">
     <meta http-equiv="Content-Type" content="text/html; charset=utf8">
</head>
<body>

<a href="<c:url value="/index" />">
       Контакты
</a><br/>

<div class="single-widget-container">
    <section class="widget login-widget">
        <header class="text-align-center">
            <h4>Login to your account</h4>
        </header>
        <div class="body">
            <form class="no-margin"
                  method="POST" action="<c:url value="/j_spring_security_check" />">
                <fieldset>
                    <div class="form-group no-margin">
                        <label for="name" >Login</label>

                        <div class="input-group input-group-lg">
                                <span class="input-group-addon">
                                    <i class="eicon-user"></i>
                                </span>
                            <input id="name" name="j_username" type="text" class="form-control input-lg"
                                   placeholder="Your Login">
                        </div>

                    </div>

                    <div class="form-group">
                        <label for="password" >Password</label>

                        <div class="input-group input-group-lg">
                                <span class="input-group-addon">
                                    <i class="fa fa-lock"></i>
                                </span>
                            <input id="password" name="j_password" type="password" class="form-control input-lg"
                                   placeholder="Your Password">
                        </div>

                    </div>
                </fieldset>
                <div class="form-actions">
                    <button type="submit" class="btn btn-block btn-lg btn-danger">
                        <span class="small-circle"><i class="fa fa-caret-right"></i></span>
                        <small>Sign In</small>
                    </button>
                    <div class="forgot"><a class="forgot" href="login.html#">Reset input form</a></div>
                </div>
            </form>
        </div>
         <c:if test="${not empty param.error}">
             <footer>
                <div class="facebook-login">
                    <font color="red"> error
                    : ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message} </font>
                </div>
            </footer>
        </c:if>
    </section>
</div>
</body>
</html>