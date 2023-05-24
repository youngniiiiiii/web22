<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>

    $(function () {

    });

</script>
<div class="col-sm-8">
    <div class="container">
        <h1>CFR1</h1><br/>
        <h2>${result}</h2>
        <form action="/cfr1impl" method="post" enctype="multipart/form-data" id="cfr1_form"
              class="form-horizontal text-left well">
            <div class="form-group">
                <label class="control-label col-sm-2" for="img">Image:</label>
                <div class="col-sm-8">
                    <input type="file" name="img" class="form-control" id="img" placeholder="Input Image">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button id="cfr1_btn" class="btn btn-default">Send</button>
                </div>
            </div>

        </form>

    </div>
</div>

<style>
    .container {
        width: 100%
    }
</style>