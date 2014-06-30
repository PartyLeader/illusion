<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
 <meta http-equiv="Content-Language" content="English"/>
 <link rel="stylesheet" media="all" href="<c:url value="/resources/site.css"/>">
 <title>О нас</title>
         <link href="<c:url value="/resources/css/application.min.css"/>" rel="stylesheet">
          <link rel="shortcut icon" href="<c:url value="/resources/img/favicon.png"/>">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <meta name="author" content="Illusion team">
</head>
<body>
<jsp:include page="header.jsp">
  <jsp:param name="pageTitle" value="aboutUs" />
</jsp:include>

<div class="content container wrap">
    <div class="row">
        <div class="col-md-12">
            <h2 class="page-title">О нас</h2>
        </div>
    </div>
    <div class="row">
        <section class="widget">
            <div class="row">
                <div class ="col-md-5">
                    <div class="col-md-4">
                        <div class="text-align-center">
                            <img class="img-circle" src="<c:url value="/resources/img/aboutUs/1.jpg"/>" style="height: 112px;">
                        </div>
                    </div>
                    <div class="col-md-8">
                        <h3 class="no-margin">Анна Грудина</h3>
                        <address>
                            <strong>Тестер</strong> и внезапный <strong>верстальщик =)</strong><br>
                            <abbr title="Work email">e-mail:</abbr> <a href="mailto:#">verstka.milota@div.com</a><br>
                            <abbr title="Work Phone">телефончик:</abbr> (123) 456-7890
                        </address>
                    </div>
                </div>
                <div class ="col-md-5">
                    <div class="col-md-4">
                        <div class="text-align-center">
                            <img class="img-circle" src="<c:url value="/resources/img/aboutUs/2.jpg"/>" style="height: 112px;">
                        </div>
                    </div>
                    <div class="col-md-8">
                        <h3 class="no-margin">Сергей Кобцев</h3>
                        <address>
                            <strong>Супер-архитектор</strong> и просто <strong>капракодер!</strong><br>
                            <abbr title="Work email">e-mail:</abbr> <a href="mailto:#">kapra@kapra.com</a><br>
                            <abbr title="Work Phone">телефончик:</abbr> (123) 456-7890
                        </address>
                    </div>
                </div>
                <div class ="col-md-5">
                    <div class="col-md-4">
                        <div class="text-align-center">
                            <img class="img-circle" src="<c:url value="/resources/img/aboutUs/3.jpg"/>" style="height: 112px;">
                        </div>
                    </div>
                    <div class="col-md-8">
                        <h3 class="no-margin">Андрей Гапонов</h3>
                        <address>
                            <strong>Бек-енд девелопер</strong> и <strong>добрый малый!</strong><br>
                            <abbr title="Work email">e-mail:</abbr> <a href="mailto:#">dobriy.dev@dev.com</a><br>
                            <abbr title="Work Phone">телефончик:</abbr> (123) 456-7890
                        </address>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
</body>
</html>