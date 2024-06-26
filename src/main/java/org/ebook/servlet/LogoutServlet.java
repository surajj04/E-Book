package org.ebook.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {

            HttpSession session = req.getSession();
            session.removeAttribute("user");

            resp.sendRedirect("login.jsp");

        } catch (Exception e) {
            HttpSession session = req.getSession();
            session.removeAttribute("error");
            session.removeAttribute("errorTitle");

            session.setAttribute("errorTitle", e.getMessage());
            session.setAttribute("error", "");

            e.printStackTrace();
        }

    }
}
