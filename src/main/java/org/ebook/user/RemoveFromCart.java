package org.ebook.user;

import org.ebook.model.User;
import org.ebook.service.CartService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/remove")
public class RemoveFromCart extends HttpServlet {

    private CartService service = new CartService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        User user = (User) session.getAttribute("user");
        int id = user.getId();
        int i = Integer.parseInt(req.getParameter("i"));

        boolean result = service.removeItem(id, i);

        if (result) {
            req.getRequestDispatcher("/cart").forward(req, resp);
        }else{
            resp.sendRedirect("error.jsp");
        }
    }
}
