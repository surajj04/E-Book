package org.ebook.db;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
    private Connection con;
    private String url = "jdbc:mysql://localhost:3306/ebook_app";
    private String user = "root";
    private String password = "root";

    public Connection DbConnection(){
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url,user,password);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }

        return con;
    }

}
