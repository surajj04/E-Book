package org.ebook.user;

import org.ebook.model.Cart;
import org.ebook.model.User;
import org.ebook.service.CartService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/addcart")
public class AddToCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        CartService service = new CartService();

        int id = Integer.parseInt(req.getParameter("id"));

        HttpSession session = req.getSession();
        HttpSession session1 = req.getSession();

        User user = (User) session.getAttribute("user");

        if (user == null) {
            resp.sendRedirect("login.jsp");
        }else{
            if (user.getAddress() == null) {
                resp.sendRedirect("profile.jsp");
                session1.setAttribute("addMsg","Please fill out your shipping address to continue shopping.");
            }else{
                Cart cart = new Cart();
                cart.setBookId(id);
                cart.setIdcart(user.getId());
                boolean result = service.addToCart(cart);

                if (result) {
                    resp.sendRedirect("addCartSuccess.jsp");
                }else{
                    resp.sendRedirect("error.jsp");
                }

            }
        }

    }
}
