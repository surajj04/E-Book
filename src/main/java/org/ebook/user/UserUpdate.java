package org.ebook.user;

import org.ebook.model.User;
import org.ebook.service.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/updateuser")
public class UserUpdate extends HttpServlet {

    private UserService service = new UserService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        session.removeAttribute("addMsg");

        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        String address = req.getParameter("address");
        String state = req.getParameter("state");s
        String city = req.getParameter("city");

        User user = new User(id, name, email, phone, address, city, state);

        boolean result = service.userUpdate(user);

        if (result) {
            resp.sendRedirect("profile.jsp");
        } else {
            resp.sendRedirect("error.jsp");
        }

    }
}
