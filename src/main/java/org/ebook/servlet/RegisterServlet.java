package org.ebook.servlet;

import org.ebook.model.User;
import org.ebook.service.UserService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private UserService repo = new UserService();

    public void doPost(HttpServletRequest req, HttpServletResponse res) {
        try {

            User user = new User();

            user.setName(req.getParameter("name"));
            user.setEmail(req.getParameter("email"));
            user.setPhone(req.getParameter("phone"));
            user.setPassword(req.getParameter("password"));

            HttpSession session = req.getSession();

            boolean execute = repo.UserRegister(user);
            if (execute) {
                session.setAttribute("success", "Registration Successful");
                res.sendRedirect("successful.jsp");
            } else {
                session.setAttribute("failed", "Something wrong on Server..");
                res.sendRedirect("error.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
