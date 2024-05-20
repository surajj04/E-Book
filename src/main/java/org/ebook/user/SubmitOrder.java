package org.ebook.user;

import org.ebook.model.Order;
import org.ebook.model.User;
import org.ebook.service.CartService;
import org.ebook.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/submitorder")
public class SubmitOrder extends HttpServlet {

    private OrderService service1 = new OrderService();
    private CartService service2 = new CartService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            HttpSession session = req.getSession();
            User user = (User) session.getAttribute("user");

            List<Integer> bookId = service2.existingBookIds(user.getId());
            double totalPrice = Double.parseDouble(req.getParameter("totalPrice"));

            Order order = new Order(bookId, totalPrice, "Pending", user.getName(), user.getEmail(), user.getPhone(), user.getAddress(), user.getAddress(), "Cash on Delivery", user.getId());

            boolean result = service1.submitOrder(order);
            if (result) {
                service2.removeAllCart(user.getId());
                req.getRequestDispatcher("/order").forward(req, resp);
            } else {
                resp.sendRedirect("error.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }


    }
}
