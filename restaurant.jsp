<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="dto.Restaurant" %>
<%@ page import="dao.RestaurantRepository" %>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>맛집 상세</title>
</head>
<body>
<div class="container py-4">
    <%@ include file="menu.jsp" %>

    <%
        String id = request.getParameter("id");
	    if (id == null || id.equals("")) {
	        id = "TEST02";
	    }
        RestaurantRepository dao = RestaurantRepository.getInstance();
        Restaurant r = dao.getRestaurantById(id);
        
        // 쿠키 설정: 최근 본 맛집 ID 저장
        Cookie recentView = new Cookie("recentId", id);
        recentView.setMaxAge(24 * 60 * 60); // 1일 유지
        response.addCookie(recentView);
    %>

    <div class="row">
        <div class="col-md-6">
            <img src="./resources/images/<%= r.getFilename() %>" style="width:100%">
        </div>
        <div class="col-md-6">
            <h3><%= r.getName() %></h3>
            <p><b>위치:</b> <%= r.getLocation() %></p>
            <p><b>가격:</b> <%= r.getPrice() %>원</p>
            <p><b>메모:</b><br><%= r.getMemo() %></p>
            <hr>
            <a href="./restaurants.jsp" class="btn btn-secondary">목록으로</a>
            <a href="./deleteRestaurant.jsp?id=<%= r.getId() %>" class="btn btn-danger">삭제</a>
        </div>
    </div>
    
    <div class="alert alert-info mt-4">
        최근 본 맛집 ID 쿠키 값: 
        <%
            Cookie[] cookies = request.getCookies();
            if(cookies != null) {
                for(Cookie c : cookies) {
                    if(c.getName().equals("recentId")) {
                        out.print(c.getValue());
                    }
                }
            }
        %>
    </div>
    
    <%@ include file="footer.jsp" %>
</div>
</body>
</html>