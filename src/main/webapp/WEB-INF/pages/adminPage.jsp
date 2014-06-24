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
    <title>Админка</title>
        <link href="<c:url value="/resources/css/application.min.css"/>" rel="stylesheet">
         <link rel="shortcut icon" href="<c:url value="/resources/img/favicon.png"/>">
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <meta name="author" content="Illusion team">
</head>
<body>
<jsp:include page="header.jsp">

    <jsp:param name="pageTitle" value="Login"/>
</jsp:include>

<div id="leftcol">

</div>
<table>
    <tr>

        <%----%>
        <td>
            <table>
                <tr>
                    <td>
                        <form:form action="adminPage/state" modelAttribute="state" method="post" onsubmit="true">
                            <table>
                                <h2> Таблица статусы:</h2>
                                <tr>
                                    <td width="100рх">Наименование статуса:</td>
                                    <td>
                                        <form:input size="20" path="name"/>
                                        <form:errors path="name" element="span"/>
                                    </td>
                                </tr>
                            </table>
                            <input type="submit" class="button-blue" value="Добавить"/>
                        </form:form>
                    </td>
                    <td>
                         <select>
                           <c:forEach items="${stateList}" var="item">
                            <option value="${item.id}">${item.name}</option>
                           </c:forEach>
                        </select>
                    </td>

                </tr>

            </table>

         </td>
        <%----%>

    </tr>

</table>

<table>
    <tr>
        <td>
            <form:form action="adminPage/magic" modelAttribute="magic" method="post" onsubmit="true">
                <table>
                    <h2> Таблица Магических свойств:</h2>
                    <tr>
                        <td width="100рх">Наименование свойства:</td>
                        <td>
                            <form:input size="20" path="name"/>
                            <form:errors path="name" element="span"/>
                        </td>
                    </tr>
                    <tr>
                        <td width="100рх">Описание свойства:</td>
                        <td>
                            <form:textarea path="specification" rows="5" cols="30" />
                            <form:errors path="specification" element="span"/>
                        </td>
                    </tr>
                </table>
                <input type="submit" class="button-blue" value="Добавить"/>
            </form:form>
        </td>
       <td>
             <select>
               <c:forEach items="${magicList}" var="item">
                <option value="${item.id}">${item.name}</option>
               </c:forEach>
             </select>
        </td>
    </tr>
    <tr>
        <td>
            <form:form action="adminPage/fashion" modelAttribute="fashion" method="post" onsubmit="true">
                <table>
                    <h2> Таблица Фасоны:</h2>
                    <tr>
                        <td width="100рх">Наименование фасона:</td>
                        <td>
                            <form:input size="20" path="name"/>
                            <form:errors path="name" element="span"/>
                        </td>
                    </tr>
                </table>
                <input type="submit" class="button-blue" value="Добавить"/>
            </form:form>
        </td>
        <td>
                     <select>
                       <c:forEach items="${fashionList}" var="item">
                        <option value="${item.id}">${item.name}</option>
                       </c:forEach>
                    </select>
                </td>
    </tr>
    <tr>
        <td>
            <form:form action="adminPage/goodType" modelAttribute="goodType" method="post" onsubmit="true">
                <table>
                    <h2> Таблица тип материала:</h2>
                    <tr>
                        <td width="100рх">Тип материала:</td>
                        <td>
                            <form:input size="20" path="name"/>
                            <form:errors path="name" element="span"/>
                        </td>
                    </tr>
                </table>
                <input type="submit" class="button-blue" value="Добавить"/>
            </form:form>
        </td>
        <td>
                     <select>
                       <c:forEach items="${goodTypeList}" var="item">
                        <option value="${item.id}">${item.name}</option>
                       </c:forEach>
                    </select>
                </td>
    </tr>
    <tr>
        <td>
            <form:form action="adminPage/size" modelAttribute="size" method="post" onsubmit="true">
                <table>
                    <h2> Таблица Размеры:</h2>
                    <tr>
                        <td width="100рх">Размер:</td>
                        <td>
                            <form:input size="20" path="name"/>
                            <form:errors path="name" element="span"/>
                        </td>
                    </tr>
                </table>
                <input type="submit" class="button-blue" value="Добавить"/>
            </form:form>

        </td>
        <td>
             <select>
               <c:forEach items="${sizeList}" var="item">
                <option value="${item.id}">${item.name}</option>
               </c:forEach>
            </select>
        </td>
    </tr>
     <tr>
            <td>
                <form:form action="adminPage/recipe" modelAttribute="recipe" method="post" onsubmit="true">
                    <table>
                        <h2> Таблица рецептов:</h2>
                        <tr>
                            <td width="100рх">Симптом:</td>
                            <td>
                                <form:input size="20" path="name"/>

                                <form:errors path="name" element="span"/>
                            </td>
                        </tr>
                         <tr>
                            <td width="100рх">Описание свойства:</td>
                            <td>
                                <form:textarea path="specification" rows="5" cols="30" />
                                <form:errors path="specification" element="span"/>
                            </td>
                        </tr>
                    </table>
                    <input type="submit" class="button-blue" value="Добавить"/>
                </form:form>

            </td>
            <td>
                 <select>
                   <c:forEach items="${recipeList}" var="item">
                    <option value="${item.id}">${item.name}</option>
                   </c:forEach>
                </select>
            </td>
        </tr>
</table>

</body>
</html>
