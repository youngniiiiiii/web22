<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--자바스크립트내에서도 jsp 값을 끄집어 낼수 있따--%>
<style>
    #getdata > div {
        width: 500px;
        border: 2px solid red;
    }
</style>
<script>
    let ajax03 = {
        init: function () {
            $('#getdata > button').click(function () {
                $.ajax({
                    url: '/getdata',
                    success: function (data) {
                        ajax03.display(data)
                    }
                });
            });
            setInterval(function () {
                $.ajax({
                    url: '/getdata',
                    success: function (data) {
                        ajax03.display(data)
                    }
                });
            }, 300);
        },
        display: function (data) {
            var result = "";
            $(data).each(function (index, item) {
                result += '<h4>';
                result += item.id + ' ' + item.pwd + ' ' + item.name;
                result += '</h4>';
            });
            $('#getdata > div').html(result);
        }
    };

    $(function () {
        ajax03.init();
    });
</script>

<div class="col-sm-8 text-left">
    <div class="container" id="getdata">
        <h3>AJAX03 Page</h3>
        <button class="btn">GET DATE</button>
        <div></div>
    </div>
</div>
