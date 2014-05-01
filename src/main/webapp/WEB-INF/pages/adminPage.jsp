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
</head>
<body>
<jsp:include page="header.jsp">

    <jsp:param name="pageTitle" value="Login"/>
</jsp:include>

<div id="leftcol">

</div>
<table>
    <tr>
        <td>
            <form:form modelAttribute="material" method="post" onsubmit="true">
                <div id="middlecol2">
                    <table>
                        <h2> Таблица материалы:</h2>
                        <tr>
                            <td width="100рх">Материал:</td>
                            <td>
                                <form:input size="20" path="name"/>
                                <form:errors path="name" element="span"/>
                            </td>
                        </tr>
                        <tr>
                            <td width="100рх">Качество:</td>
                            <td>
                                <form:input size="20" path="quality"/>
                                <form:errors path="quality" element="span"/>
                            </td>
                        </tr>
                        <tr>
                            <td width="100рх">Тип:</td>
                            <td>
                                <form:input size="20" path="type"/>
                                <form:errors path="type" element="span"/>
                            </td>
                        </tr>
                        <tr>
                            <td width="100рх">Статус:</td>
                            <td>
                                <form:input size="20" path="status"/>
                                <form:errors path="status" element="span"/>
                            </td>
                        </tr>

                    </table>
                    <input type="submit" class="button-blue" value="Добавить"/>
                </div>
            </form:form>
        </td>
        <td>
            <form:form modelAttribute="recipe" method="post" onsubmit="true">
                <table>
                    <h2> Таблица рецепты:</h2>
                    <tr>
                        <td width="100рх">Наименование рецепта:</td>
                        <td>
                            <form:input size="20" path="name"/>
                            <form:errors path="name" element="span"/>
                        </td>
                    </tr>
                    <tr>
                        <td width="100рх">Характеристика:</td>
                        <td>
                            <form:input size="20" path="characteristic"/>
                            <form:errors path="characteristic" element="span"/>
                        </td>
                    </tr>
                </table>
            </form:form>
            <input type="submit" class="button-blue" value="Добавить"/>
        </td>
        <%----%>
        <td>
            <table>
                <tr>
                    <td>
                        <form:form modelAttribute="status" method="post" onsubmit="true">
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
                        </form:form>
                        <input type="submit" class="button-blue" value="Добавить"/>
                    </td>

                </tr>
                <tr>
                    <td>
                        <form:form modelAttribute="fashion" method="post" onsubmit="true">
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
                        </form:form>
                        <input type="submit" class="button-blue" value="Добавить"/>
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
            <form:form modelAttribute="typeofmaterials" method="post" onsubmit="true">
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
            </form:form>
            <input type="submit" class="button-blue" value="Добавить"/>
        </td>
    </tr>
    <tr>
        <td>
            <form:form modelAttribute="size" method="post" onsubmit="true">
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
            </form:form>
            <input type="submit" class="button-blue" value="Добавить"/>
        </td>
    </tr>
</table>

</body>
</html>
