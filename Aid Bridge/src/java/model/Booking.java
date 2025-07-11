package model;

import java.sql.Timestamp;

public class Booking {
    private String username;
    private String productName;
    private String productImage;
    private int quantity;
    private Timestamp bookingDate;
    private double price;
    private String address;
    private String status;

    
    public String getProductName() { return productName; }
    public void setProductName(String productName) { this.productName = productName; }

    public String getProductImage() { return productImage; }
    public void setProductImage(String productImage) { this.productImage = productImage; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public Timestamp getBookingDate() { return bookingDate; }
    public void setBookingDate(Timestamp bookingDate) { this.bookingDate = bookingDate; }
    
    public String getUsername() {return username;}
    public void setUsername(String username) {this.username = username;}
    
    public double getPrice() {return price;}
    public void setPrice(double price) {this.price = price;}
    
    public String getAddress() {return address;}
    public void setAddress(String address) {this.address = address;}
    
    public String getStatus() {return status;}
    public void setStatus(String status) {this.status = status;}
}
