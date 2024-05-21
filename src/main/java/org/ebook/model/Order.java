package org.ebook.model;

import java.util.Date;
import java.util.List;

public class Order {
    private int userID;
    private String orderID;
    private List<Integer> booksID;
    private double totalPrice;
    private String Status;
    private String name;
    private String email;
    private String phoneNO;
    private String address;
    private String shippingAddress;
    private String payment;
    private Date orderDate;

    public Order() {
    }

    public Order(List<Integer> booksID, double totalPrice, String status, String name, String email, String phoneNO, String address, String shippingAddress, String payment, int userID) {
        this.booksID = booksID;
        this.totalPrice = totalPrice;
        Status = status;
        this.name = name;
        this.email = email;
        this.phoneNO = phoneNO;
        this.address = address;
        this.shippingAddress = shippingAddress;
        this.payment = payment;
        this.userID = userID;
    }

    public Order(String orderID, List<Integer> booksID, double totalPrice, String status, String name, String email, String phoneNO, String address, String shippingAddress, String payment) {
        this.orderID = orderID;
        this.booksID = booksID;
        this.totalPrice = totalPrice;
        Status = status;
        this.name = name;
        this.email = email;
        this.phoneNO = phoneNO;
        this.address = address;
        this.shippingAddress = shippingAddress;
        this.payment = payment;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public List<Integer> getBooksID() {
        return booksID;
    }

    public void setBooksID(List<Integer> booksID) {
        this.booksID = booksID;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String status) {
        Status = status;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNO() {
        return phoneNO;
    }

    public void setPhoneNO(String phoneNO) {
        this.phoneNO = phoneNO;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(String shippingAddress) {
        this.shippingAddress = shippingAddress;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }
}
