package dao;

import java.sql.*;
import java.util.ArrayList;
import dto.Restaurant;

public class RestaurantRepository {
    // DB 연결 정보 (본인 환경에 맞게 수정)
    private final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    private final String JDBC_URL = "jdbc:mysql://localhost:3306/GourmetDB?serverTimezone=UTC";
    private final String DB_USER = "root";
    private final String DB_PASS = "1234";

    private static RestaurantRepository instance = new RestaurantRepository();
    public static RestaurantRepository getInstance() { return instance; }

    private Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS);
        } catch (Exception e) { e.printStackTrace(); }
        return conn;
    }

    // 모든 맛집 가져오기
    public ArrayList<Restaurant> getAllRestaurants() {
        ArrayList<Restaurant> list = new ArrayList<>();
        String sql = "SELECT * FROM restaurant";
        try (Connection conn = getConnection(); 
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            
            while (rs.next()) {
                Restaurant r = new Restaurant();
                r.setId(rs.getString("id"));
                r.setName(rs.getString("name"));
                r.setPrice(rs.getInt("price"));
                r.setLocation(rs.getString("location"));
                r.setMemo(rs.getString("memo"));
                r.setFilename(rs.getString("filename"));
                list.add(r);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    // 맛집 등록
    public void addRestaurant(Restaurant r) {
        String sql = "INSERT INTO restaurant VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection(); 
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, r.getId());
            pstmt.setString(2, r.getName());
            pstmt.setInt(3, r.getPrice());
            pstmt.setString(4, r.getLocation());
            pstmt.setString(5, r.getMemo());
            pstmt.setString(6, r.getFilename());
            pstmt.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }
    
    // ID로 맛집 상세 조회
    public Restaurant getRestaurantById(String id) {
        Restaurant r = null;
        String sql = "SELECT * FROM restaurant WHERE id = ?";
        try (Connection conn = getConnection(); 
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                r = new Restaurant();
                r.setId(rs.getString("id"));
                r.setName(rs.getString("name"));
                r.setPrice(rs.getInt("price"));
                r.setLocation(rs.getString("location"));
                r.setMemo(rs.getString("memo"));
                r.setFilename(rs.getString("filename"));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return r;
    }

    // 맛집 삭제
    public void deleteRestaurant(String id) {
        String sql = "DELETE FROM restaurant WHERE id = ?";
        try (Connection conn = getConnection(); 
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, id);
            pstmt.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }
}