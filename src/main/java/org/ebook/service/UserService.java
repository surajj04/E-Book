package org.ebook.service;

import org.ebook.db.DBConnect;
import org.ebook.model.User;

import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserService {

    private DBConnect db = new DBConnect();
    private Connection con = db.DbConnection();


    public User getUser(int id) {
        User user = null;

        try {

            String sql ="SELECT * FROM user WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt(1));
                user.setName(rs.getString(2));
                user.setEmail(rs.getString(3));
                user.setPassword(rs.getString(4));
                user.setPhone(rs.getString(5));
                user.setAddress(rs.getString(6));
                user.setCity(rs.getString(7));
                user.setState(rs.getString(8));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }


        return user;
    }

    public boolean UserRegister(User user) {

        try {
            String sql = "INSERT INTO user (name, email, phone, password)VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPhone());
            ps.setString(4, user.getPassword());

            if (ps.executeUpdate() == 1) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public User userLogin(String email, String pass) {
        User user = null;
        try {
            String sql = "Select * From user where email = ? and password = ?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, pass);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                user = new User();
                user.setId(rs.getInt(1));
                user.setName(rs.getString(2));
                user.setEmail(rs.getString(3));
                user.setPassword(rs.getString(4));
                user.setPhone(rs.getString(5));
                user.setAddress(rs.getString(6));
                user.setCity(rs.getString(7));
                user.setState(rs.getString(8));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }


    public boolean userUpdate(User user) {

        try {

            String sql = "UPDATE user SET name = ?,email = ?,phone = ?,address = ?,city = ?,state = ? WHERE id = ? ";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPhone());
            ps.setString(4, user.getAddress());
            ps.setString(5, user.getCity());
            ps.setString(6, user.getState());
            ps.setInt(7, user.getId());

            if (ps.executeUpdate() == 1) {
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

}
