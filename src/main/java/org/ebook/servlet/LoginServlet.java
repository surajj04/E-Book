package org.ebook.servlet;

import org.ebook.model.User;
import org.ebook.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private UserService repo = new UserService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession();
        try {

            String email = req.getParameter("email");
            String pass = req.getParameter("password");

            User user = repo.userLogin(email, pass);

            if ("admin@mail.com".equals(email) && "root".equals(pass)) {
                session.setAttribute("user",user);
                res.sendRedirect("admin/home.jsp");
            } else {
                if (repo.userLogin(email, pass) != null) {
                    session.setAttribute("user",user);
                    System.out.println(user);
                    res.sendRedirect("home.jsp");
                } else {
                    res.sendRedirect("error.jsp");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
