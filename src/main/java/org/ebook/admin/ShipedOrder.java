package org.ebook.admin;

import org.ebook.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/shipped")
public class ShipedOrder extends HttpServlet {
    private OrderService service = new OrderService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int orderId = Integer.parseInt(req.getParameter("id"));
        boolean result = service.deliveredItem(orderId);

        if (result) {
            req.getRequestDispatcher("/adminorders").forward(req, resp);
        }
    }
}
