<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>

    $(function () {
        login_form.init();
    });

</script>
<div class="col-sm-8">
    <div class="container">
        <h1>Login</h1><br/>

        <form id="login_form" class="form-horizontal text-left well">
            <div class="form-group">
                <label class="control-label col-sm-2" for="id">ID:</label>
                <div class="col-sm-8">
                    <input type="text" name="id" class="form-control" id="id" placeholder="Enter ID">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="pwd">Password:</label>
                <div class="col-sm-8">
                    <input type="password" name="pwd" class="form-control" id="pwd" placeholder="Enter password">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-8">
                    <div class="checkbox">
                        <label><input type="checkbox"> Remember me</label>
                    </div>
                </div>
            </div>
        </form>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button id="login_btn" class="btn btn-default">Login</button>
            </div>
        </div>
    </div>
</div>

<style>
    .container {
        width: 100%
    }
</style>