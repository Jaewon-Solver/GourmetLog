<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script src="./resources/js/validation.js"></script>
<title>맛집 등록</title>
</head>
<body>
<fmt:setLocale value='${param.language}' />
<fmt:bundle basename="message">

<div class="container py-4">
    <%@ include file="menu.jsp" %>
    
    <div class="p-5 mb-4 bg-light rounded-3">
        <h1><fmt:message key="title" /></h1>
    </div>

    <div class="text-end">
        <a href="?language=ko">Korean</a> | <a href="?language=en">English</a>
    </div>

    <form name="newRest" action="./processAddRestaurant.jsp" method="post" enctype="multipart/form-data">
        <div class="mb-3 row">
            <label class="col-sm-2"><fmt:message key="id" /></label>
            <div class="col-sm-3">
                <input type="text" name="id" id="id" class="form-control" />
            </div>
        </div>
        <div class="mb-3 row">
            <label class="col-sm-2"><fmt:message key="name" /></label>
            <div class="col-sm-3">
                <input type="text" name="name" id="name" class="form-control" />
            </div>
        </div>
        <div class="mb-3 row">
            <label class="col-sm-2"><fmt:message key="price" /></label>
            <div class="col-sm-3">
                <input type="text" name="price" id="price" class="form-control" />
            </div>
        </div>
        <div class="mb-3 row">
            <label class="col-sm-2"><fmt:message key="location" /></label>
            <div class="col-sm-5">
                <input type="text" name="location" class="form-control" />
            </div>
        </div>
        <div class="mb-3 row">
            <label class="col-sm-2"><fmt:message key="memo" /></label>
            <div class="col-sm-5">
                <textarea name="memo" cols="50" rows="3" class="form-control"></textarea>
            </div>
        </div>
        <div class="mb-3 row">
            <label class="col-sm-2"><fmt:message key="image" /></label>
            <div class="col-sm-5">
                <input type="file" name="image" class="form-control" />
            </div>
        </div>
        <div class="mb-3 row">
            <div class="col-sm-offset-2 col-sm-10">
                <input type="button" class="btn btn-primary" value="등록" onclick="checkForm()" />
            </div>
        </div>
    </form>
    <%@ include file="footer.jsp" %>
</div>
</fmt:bundle>
</body>
</html>