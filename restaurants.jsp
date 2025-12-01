<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Restaurant" %>
<%@ page import="dao.RestaurantRepository" %>

<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>맛집 리스트</title>
</head>
<body>
<div class="container py-4">
    <%@ include file="menu.jsp" %>

    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
        <h1>나만의 맛집 리스트</h1>
    </div>

    <%
        RestaurantRepository dao = RestaurantRepository.getInstance();
        ArrayList<Restaurant> list = dao.getAllRestaurants();
    %>

    <div class="row align-items-md-stretch text-center">
    <% for (Restaurant r : list) { %>
        <div class="col-md-4">
            <div class="card mb-4 shadow-sm">
                <img src="./resources/images/<%= r.getFilename() %>" class="card-img-top" style="height: 200px; object-fit: cover;">
                <div class="card-body">
                    <h5><b><%= r.getName() %></b></h5>
                    <p><%= r.getLocation() %></p>
                    <p><%= r.getPrice() %>원</p>
                    <a href="./restaurant.jsp?id=<%= r.getId() %>" class="btn btn-secondary">상세 보기</a>
                </div>
            </div>
        </div>
    <% } %>
    </div>
    <%@ include file="footer.jsp" %>
</div>
</body>
</html>