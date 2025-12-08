package control;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.Cart;
import model.Moperation;

@WebServlet("/add-prod-servlet")
public class AddProdServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        int idx = Integer.parseInt(request.getParameter("idx"));

        HttpSession session = request.getSession();

        Moperation op = new Moperation();
        op.addProd(idx, session);

        Cart cart = (Cart) session.getAttribute("cart");
        int totalItems = (cart != null) ? cart.getTotalItems() : 0;

        response.setContentType("application/json; charset=UTF-8");
        response.getWriter().write("{\"count\": " + totalItems + "}");
    }
}
