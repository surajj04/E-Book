package org.ebook.admin;

import org.ebook.model.Order;
import org.ebook.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/adminorders")
public class ShowAllOrders extends HttpServlet {

    private OrderService service = new OrderService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();

        List<Order> orders = service.showAllOrder();

        session.setAttribute("allOrders", orders);

        resp.sendRedirect("admin/order.jsp");

    }
}
