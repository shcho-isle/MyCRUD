<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>University Enrollments</title>

    <style>
        tr:first-child {
            font-weight: bold;
            background-color: #C6C9C4;
        }

        .text {
            text-align: center;
        }

        table {
            border: 1px solid green;
            margin: auto;
        }
    </style>

</head>


<body>
<div class="text">
    <h2><spring:message code="allusers.title"/></h2>

    <form action="searchUser">
        <spring:message code="allusers.searchlabel"/>
        <input type="text" name="searchName" maxlength='25' title="Search by name:">
        <input class="btn btn-xs" type='submit' value='<spring:message code="allusers.searchbutton"/>'/>
    </form>

    <table>
        <tr>
            <td>ID</td>
            <td><spring:message code="allusers.name"/></td>
            <td><spring:message code="allusers.age"/></td>
            <td><spring:message code="allusers.admin"/></td>
            <td><spring:message code="allusers.date"/></td>
            <td></td>
        </tr>
        <c:forEach items="${users}" var="user">
            <tr>
                <td>${user.id}</td>
                <td><a href="<c:url value='/edit-${user.name}-user' />">${user.name}</a></td>
                <td>${user.age}</td>
                <td>
                    <c:if test="${user.admin==true}">
                        admin
                    </c:if>
                </td>
                <td><fmt:formatDate value="${user.createdDate}" type="DATE"/></td>
                <td><a href="<c:url value='/delete-${user.name}-user' />"><spring:message code="allusers.delete"/></a></td>
            </tr>
        </c:forEach>
    </table>

    <br/>
    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
        <c:choose>
            <c:when test="${page == i.index}">
                <span>${i.index}</span>
            </c:when>
            <c:otherwise>
                <c:url value="/" var="url">
                    <c:param name="page" value="${i.index}"/>
                </c:url>
                <a href='<c:out value="${url}" />'>${i.index}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <br/>
    <br/>
    <a href="<c:url value='/new' />"><spring:message code="allusers.add"/></a>
</div>
</body>
</html>