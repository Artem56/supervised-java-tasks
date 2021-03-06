<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-16BE" %>
<html>
<sec:authorize access="!isAuthenticated()">
    <jsp:forward page="/"/>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>CQM | Отчеты</title>

        <link href="<c:url value="${contextPath}/resources/css/site-style.css" />" rel="stylesheet">
    </head>
    <body BACKGROUND="${pageContext.request.contextPath}/resources/img/background.jpg"/>


    <div class="ProfileContent">
        <div class="container">
            <c:if test="${rating >= -10}">
                <form:form method="POST" modelAttribute="reportForm">
                    <table>
                        <tr>
                            <td>Укажите столовую:</td>
                            <td>
                                <form:select path="cafeName">
                                    <form:options items="${cafeNames}"/>
                                </form:select>
                            </td>
                            <td><form:errors path="cafeName" cssClass="error"/></td>
                        </tr>
                        <tr>
                            <td>Укажите загрузку:</td>
                            <td>
                                <form:select path="load">
                                    <form:options items="${cafeLoads}"/>
                                </form:select>
                            </td>
                            <td><form:errors path="load" cssClass="error"/></td>
                        </tr>
                        <tr>
                            <td>
                                <button class="MenuButton" type="submit">Отправить отчет</button>
                            </td>
                        </tr>
                    </table>
                </form:form>
            </c:if>
            <c:if test="${rating < -10}">
                <h2>К сожалению, пользователи с рейтингом менее -10 не могут отправлять отчеты. Вы можете
                    <a href="<c:url value="/logout"/>">
                    начать все сначала
                </a></h2>
            </c:if>
        </div>
    </div>

    <div class="PageMenu">
        Вы зашли под именем <sec:authentication property="principal.username"/>
        <a href="<c:url value="/"/>">
            <div class="MenuButton"> Личный кабинет</div>
        </a>
        <a href="<c:url value="/reports"/>">
            <div class="MenuButton"> Отчеты</div>
        </a>
        <a href="<c:url value="/addreport"/>">
            <div class="MenuButton">Отправить отчет</div>
        </a>
        <a href="<c:url value="/cafeterias"/>">
            <div class="MenuButton"> Информация о столовых</div>
        </a>
        <a href="<c:url value="/users"/>">
            <div class="MenuButton"> Рейтинг Пользователей</div>
        </a>
        <a href="<c:url value="/logout"/>">
            <div class="MenuButton"> Выход</div>
        </a>
        </p>
    </div>
    </body>
</sec:authorize>
</html>
