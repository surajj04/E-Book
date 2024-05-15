package org.ebook.service;

import org.ebook.db.DBConnect;
import org.ebook.model.Book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class BookService {

    private DBConnect db = new DBConnect();
    private Connection con = db.DbConnection();

    public boolean addBook(Book book) {

        try {
            String sql = "INSERT INTO book (bookName, author, price, bookCategory, status, imageURL, email)VALUES (?, ?, ?, ?, ?, ?, ?);";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, book.getBookName());
            ps.setString(2, book.getAuthor());
            ps.setDouble(3, book.getPrice());
            ps.setString(4, book.getBookCategory());
            ps.setString(5, book.getStatus());
            ps.setString(6, book.getPhoto());
            ps.setString(7, book.getEmail());

            if (ps.executeUpdate() == 1) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Book> allBooks() {
        List<Book> books = new ArrayList<>();

        try {

            String sql = "Select * from book";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                Book book = new Book();
                book.setBookId(rs.getInt(1));
                book.setBookName(rs.getString(2));
                book.setAuthor(rs.getString(3));
                book.setPrice(rs.getDouble(4));
                book.setBookCategory(rs.getString(5));
                book.setStatus(rs.getString(6));
                book.setPhoto(rs.getString(7));
                book.setEmail(rs.getString(8));
                books.add(book);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return books;
    }


    public Book getById(int id) {
        Book book = null;

        try {
            String sql = "Select * from book where bookId = ?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                book = new Book();
                book.setBookId(rs.getInt(1));
                book.setBookName(rs.getString(2));
                book.setAuthor(rs.getString(3));
                book.setPrice(rs.getDouble(4));
                book.setBookCategory(rs.getString(5));
                book.setStatus(rs.getString(6));
                book.setPhoto(rs.getString(7));
                book.setEmail(rs.getString(8));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return book;
    }


    public boolean updateBook(Book book) {
        try {

            String sql = "UPDATE book SET bookName = ?, author = ?, price = ?, bookCategory = ?, status = ?, imageURL = ?, email = ? WHERE bookId = ?;";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(8, book.getBookId());
            ps.setString(1, book.getBookName());
            ps.setString(2, book.getAuthor());
            ps.setDouble(3, book.getPrice());
            ps.setString(4, book.getBookCategory());
            ps.setString(5, book.getStatus());
            ps.setString(6, book.getPhoto());
            ps.setString(7, book.getEmail());

            if (ps.executeUpdate() == 1) {
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }


    public boolean deleteBook(int id) {
        try {

            String sql = "DELETE FROM book WHERE bookId = ?;";
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


    public List<Book> getNewBook() {
        List<Book> books = new ArrayList<>();

        try {

            String sql = "Select * from book where bookCategory = ? and status = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "New Book");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();

            int i = 1;

            while (rs.next() && i <= 5) {
                Book book = new Book();
                book.setBookId(rs.getInt(1));
                book.setBookName(rs.getString(2));
                book.setAuthor(rs.getString(3));
                book.setPrice(rs.getDouble(4));
                book.setBookCategory(rs.getString(5));
                book.setStatus(rs.getString(6));
                book.setPhoto(rs.getString(7));
                book.setEmail(rs.getString(8));
                books.add(book);
                i++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return books;
    }


    public List<Book> getAllNewBook() {
        List<Book> books = new ArrayList<>();

        try {

            String sql = "Select * from book where bookCategory = ? and status = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "New Book");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();

            int i = 1;

            while (rs.next()) {
                Book book = new Book();
                book.setBookId(rs.getInt(1));
                book.setBookName(rs.getString(2));
                book.setAuthor(rs.getString(3));
                book.setPrice(rs.getDouble(4));
                book.setBookCategory(rs.getString(5));
                book.setStatus(rs.getString(6));
                book.setPhoto(rs.getString(7));
                book.setEmail(rs.getString(8));
                books.add(book);
                i++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return books;
    }

    public List<Book> getRecentBook() {
        List<Book> books = new ArrayList<>();

        try {

            String sql = "Select * from book where bookCategory = ? and status = ? Order By bookId DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "New Book");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();

            int i = 1;

            while (rs.next() && i <= 5) {
                Book book = new Book();
                book.setBookId(rs.getInt(1));
                book.setBookName(rs.getString(2));
                book.setAuthor(rs.getString(3));
                book.setPrice(rs.getDouble(4));
                book.setBookCategory(rs.getString(5));
                book.setStatus(rs.getString(6));
                book.setPhoto(rs.getString(7));
                book.setEmail(rs.getString(8));
                books.add(book);
                i++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return books;
    }

    public List<Book> getAllRecentBook() {
        List<Book> books = new ArrayList<>();

        try {

            String sql = "Select * from book where bookCategory = ? and status = ? Order By bookId DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "New Book");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();

            int i = 1;

            while (rs.next()) {
                Book book = new Book();
                book.setBookId(rs.getInt(1));
                book.setBookName(rs.getString(2));
                book.setAuthor(rs.getString(3));
                book.setPrice(rs.getDouble(4));
                book.setBookCategory(rs.getString(5));
                book.setStatus(rs.getString(6));
                book.setPhoto(rs.getString(7));
                book.setEmail(rs.getString(8));
                books.add(book);
                i++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return books;
    }

    public List<Book> getOldBook() {
        List<Book> books = new ArrayList<>();

        try {

            String sql = "Select * from book where bookCategory = ? and status = ? Order By bookId DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "Old Book");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();

            int i = 1;

            while (rs.next() && i <= 5) {
                Book book = new Book();
                book.setBookId(rs.getInt(1));
                book.setBookName(rs.getString(2));
                book.setAuthor(rs.getString(3));
                book.setPrice(rs.getDouble(4));
                book.setBookCategory(rs.getString(5));
                book.setStatus(rs.getString(6));
                book.setPhoto(rs.getString(7));
                book.setEmail(rs.getString(8));
                books.add(book);
                i++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return books;
    }

    public List<Book> getAllOldBook() {
        List<Book> books = new ArrayList<>();

        try {

            String sql = "Select * from book where bookCategory = ? and status = ? Order By bookId DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "Old Book");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();

            int i = 1;

            while (rs.next()) {
                Book book = new Book();
                book.setBookId(rs.getInt(1));
                book.setBookName(rs.getString(2));
                book.setAuthor(rs.getString(3));
                book.setPrice(rs.getDouble(4));
                book.setBookCategory(rs.getString(5));
                book.setStatus(rs.getString(6));
                book.setPhoto(rs.getString(7));
                book.setEmail(rs.getString(8));
                books.add(book);
                i++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return books;
    }

}
