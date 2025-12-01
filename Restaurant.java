package dto;
import java.io.Serializable;

public class Restaurant implements Serializable {
    private static final long serialVersionUID = 1L;

    private String id;          // 맛집 ID
    private String name;        // 상호명
    private int price;          // 평균 금액
    private String location;    // 위치
    private String memo;        // 간단한 메모
    private String filename;    // 이미지 파일명

    public Restaurant() { super(); }

    // Getters and Setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public int getPrice() { return price; }
    public void setPrice(int price) { this.price = price; }
    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }
    public String getMemo() { return memo; }
    public void setMemo(String memo) { this.memo = memo; }
    public String getFilename() { return filename; }
    public void setFilename(String filename) { this.filename = filename; }
}