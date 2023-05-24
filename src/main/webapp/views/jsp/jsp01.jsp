<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--자바스크립트내에서도 jsp 값을 끄집어 낼수 있따--%>
<script>

    $(function () {
        jsp01.init(${num});
    })

</script>

<div class="col-sm-8 text-left">
    <div class="container">
        <h3 id="jsp01">JSP01 Page</h3>
        <%--        jstl의 출력기법 : 사용자가 입력한 부분에 대해서는 보안을 위해 다음과 같이 표현 --%>
        <h3><c:out value="${cust.name}"/></h3>

        <h3><fmt:parseNumber integerOnly="true" type="number" value="${num}"/></h3>
        <h3><fmt:formatNumber value="${num}" type="currency"/></h3>
        <h3><fmt:formatNumber value="${num}" type="number" pattern="###.###$"/></h3>
        <h3><fmt:formatDate value="${cdate}" pattern="yyyy-MM-dd:ss"></fmt:formatDate></h3>

        <h3>${cust}</h3>
        <h3>${cust.id}</h3>
        <h3>${cust.name}</h3>
        <h3>${num * 2}</h3>

        <c:set var="mynum" value="${num * 3}"/>
        <h5><c:out value="${mynum}"/></h5>
    </div>
</div>
