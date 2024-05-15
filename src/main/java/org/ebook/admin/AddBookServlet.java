package org.ebook.admin;

import org.ebook.model.Book;
import org.ebook.service.BookService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addbooks")
public class AddBookServlet extends HttpServlet {
    private BookService repo = new BookService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            String bookName = req.getParameter("bookname");
            String author = req.getParameter("authorname");
            Double price = Double.parseDouble(req.getParameter("price"));
            String category = req.getParameter("category");
            String status = req.getParameter("status");
            String email = req.getParameter("email");
            String imageUrl = req.getParameter("imageURL");

            Book book = new Book(bookName, author, price, category, status, imageUrl, email);
            boolean success =  repo.addBook(book);

            if(success){
                resp.sendRedirect("admin/addsuccess.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
