<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="dao.RestaurantRepository" %>
<%
    String id = request.getParameter("id");
    
    if (id != null) {
        RestaurantRepository dao = RestaurantRepository.getInstance();
        dao.deleteRestaurant(id);
    }
    
    response.sendRedirect("restaurants.jsp");
%>