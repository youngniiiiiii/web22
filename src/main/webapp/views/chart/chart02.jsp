<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    #container {
        width: 600px;
        height: 400px;
        border: 2px solid red;
    }
</style>

<script>

    $(function () {
        chart02.init();
    })

</script>

<div class="col-sm-8 text-left">
    <div class="container" id="chart02">
        <h3>CHART02 Page</h3>
        <button type="button" class="btn btn-danger">Chart</button>
        <div id="container"></div>
    </div>
</div>
