package org.ebook.admin;

import org.ebook.model.Book;
import org.ebook.service.BookService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/editbook")
public class EditBookServlet extends HttpServlet {

    private BookService service = new BookService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String bookName = req.getParameter("bookname");
            String author = req.getParameter("authorname");
            Double price = Double.parseDouble(req.getParameter("price"));
            String category = req.getParameter("category");
            String status = req.getParameter("status");
            String email = req.getParameter("email");
            String imageUrl = req.getParameter("imageURL");

            Book book = new Book(id, bookName, author, price, category, status, imageUrl,email);

            boolean success = service.updateBook(book);

            if(success){
                resp.sendRedirect("admin/updateSuccess.jsp");
            }else {
                System.out.println("Internal Error!!!!!!!");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
