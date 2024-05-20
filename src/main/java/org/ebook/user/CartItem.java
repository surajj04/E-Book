package org.ebook.user;

import org.ebook.model.Book;
import org.ebook.model.User;
import org.ebook.service.BookService;
import org.ebook.service.CartService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/cart")
public class CartItem extends HttpServlet {

    private CartService service = new CartService();
    private BookService service2 = new BookService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        List<Integer> item = service.existingBookIds(user.getId());

        List<Book> books = new ArrayList<>();

        for (int i = 0; i < item.size(); i++) {
            Book book = service2.getById(item.get(i));
            books.add(book);
        }


        HttpSession session1 = req.getSession();
        session1.setAttribute("ebooks", books);

        resp.sendRedirect("cart.jsp");
    }
}
