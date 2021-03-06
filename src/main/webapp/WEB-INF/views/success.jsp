<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><spring:message code="jsp.confirmation"/></title>
</head>
<body>
<spring:message code="${isNew ? 'jsp.registered' : 'jsp.updated'}" arguments="${userName}"/>
<br/>
<br/>
<spring:message code="jsp.go_back"/> <a href="<c:url value='/list' />"><spring:message code="jsp.list_link"/></a>

</body>

</html>