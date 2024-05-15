package org.ebook.admin;

import org.ebook.service.BookService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deletebook")
public class DeleteBookServlet extends HttpServlet {

    private BookService service = new BookService();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            int id = Integer.parseInt(req.getParameter("id"));

            boolean result = service.deleteBook(id);

            if (result) {
                resp.sendRedirect("admin/allbooks.jsp");
            }else{
                resp.sendRedirect("admin/home.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
