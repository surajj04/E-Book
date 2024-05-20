package org.ebook.service;

import org.ebook.db.DBConnect;
import org.ebook.model.Cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CartService {

    DBConnect db = new DBConnect();
    Connection con = db.DbConnection();

    public List<Integer> existingBookIds(int id) {
        List<Integer> list = new ArrayList<>();
        String result;
        try {

            String sql = "Select bookId from cart Where cartId = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                result = rs.getString(1);
                list = convertToArrayList(result);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    public boolean addToCart(Cart cart) {

        try {
            List<Integer> existingId = existingBookIds(cart.getIdcart());
            existingId.add(cart.getBookId());

            String bookIdJson = convertJSON(existingId);

            if (existingId.size() == 1) { // No existing book IDs
                String sql = "INSERT INTO cart (cartId, bookId) VALUES (?, ?)";
                PreparedStatement insertPs = con.prepareStatement(sql);
                insertPs.setInt(1, cart.getIdcart());
                insertPs.setString(2, bookIdJson);

                if (insertPs.executeUpdate() == 1) {
                    return true;
                }
            } else {
                String sql = "UPDATE cart SET bookId = ? WHERE cartId = ?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, bookIdJson);
                ps.setInt(2, cart.getIdcart());

                if (ps.executeUpdate() == 1) {
                    return true;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public String convertJSON(List<Integer> bookid) {
        StringBuilder str = new StringBuilder("[");

        for (int i = 0; i < bookid.size(); i++) {
            str.append(bookid.get(i));
            if (i < bookid.size() - 1) {
                str.append(",");
            }
        }

        str.append("]");
        return str.toString();
    }

    public List<Integer> convertToArrayList(String json) {
        List<Integer> list = new ArrayList<>();
        json = json.substring(1, json.length() - 1); // Remove square brackets
        if (!json.isEmpty()) {
            String[] tokens = json.split(",");
            for (String token : tokens) {
                list.add(Integer.parseInt(token.trim()));
            }
        }
        return list;
    }


    public boolean removeItem(int id, int i) {
        try {
            List<Integer> booksId = existingBookIds(id);
            booksId.remove(i);
            String bookIdJson = convertJSON(booksId);

            String sql = "UPDATE cart SET bookId = ? WHERE cartId = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, bookIdJson);
            ps.setInt(2, id);

            if (ps.executeUpdate() == 1) {
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    public boolean removeAllCart(int id) {
        try {

            String sql = "DELETE FROM cart WHERE cartId = ?;";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            if (ps.executeUpdate() == 1) {
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

}
