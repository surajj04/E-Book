package org.ebook.service;

import org.ebook.db.DBConnect;
import org.ebook.model.Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OrderService {

    private DBConnect db = new DBConnect();
    private Connection con = db.DbConnection();
    private CartService service = new CartService();

    public boolean submitOrder(Order order) {

        try {
            String bookIdJson = service.convertJSON(order.getBooksID());
            String sql = "INSERT INTO Orders (userId,booksId, totalPrice, Status, name, email, phoneNO, address, shippingAddress, payment)VALUES (?,?, ?, ?, ?, ?, ?, ?, ?, ?);";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, order.getUserID());
            ps.setString(2, bookIdJson);
            ps.setDouble(3, order.getTotalPrice());
            ps.setString(4, order.getStatus());
            ps.setString(5, order.getName());
            ps.setString(6, order.getEmail());
            ps.setString(7, order.getPhoneNO());
            ps.setString(8, order.getAddress());
            ps.setString(9, order.getShippingAddress());
            ps.setString(10, order.getPayment());

            if (ps.executeUpdate() == 1) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public List<Order> showOrder(int id) {

        List<Order> orders = new ArrayList<>();

        try {

            String sql = "Select * from Orders where userId = ? ;";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                Order order = new Order();
                order.setOrderID(rs.getString(2));
                order.setBooksID(service.convertToArrayList(rs.getString(3)));
                order.setTotalPrice(rs.getDouble(4));
                order.setStatus(rs.getString(5));
                order.setName(rs.getString(6));
                order.setEmail(rs.getString(7));
                order.setPhoneNO(rs.getString(8));
                order.setAddress(rs.getString(9));
                order.setShippingAddress(rs.getString(10));
                order.setPayment(rs.getString(11));

                orders.add(order);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }

}
