package org.ebook.user;

import org.ebook.model.Order;
import org.ebook.model.User;
import org.ebook.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/order")
public class ShowOrder extends HttpServlet {

    private OrderService service = new OrderService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            HttpSession session1 = req.getSession();
            User user = (User) session1.getAttribute("user");

            List<Order> orders = service.showOrder(user.getId());

            HttpSession session2 = req.getSession();
            session2.setAttribute("orderDetails", orders);

            resp.sendRedirect("order.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
