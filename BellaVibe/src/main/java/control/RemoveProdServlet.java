package control;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.Cart;

@WebServlet("/remove-prod-servlet")
public class RemoveProdServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        String productId = request.getParameter("productId");
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart != null && productId != null) {
            cart.removeProduct(productId);
            session.setAttribute("toast", "削除されました。");
        }

        // Redirect back to cart.jsp so toast shows
        response.sendRedirect("cart.jsp");
    }
}
