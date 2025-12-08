package control;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.Moperation;

/**
 * Худалдан авалт хийх сервлет
 * Хэрэглэгч "Худалдаж авах" товчийг дарахад ажиллана
 * Сагсыг боловсруулж, pay.jsp рүү шилжүүлнэ
 */
@WebServlet("/pay-servlet")
public class PayServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * POST request-г хүлээн авч боловсруулна
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Session объект авна
        HttpSession session = request.getSession();

        // Худалдан авалт хийх бизнес логик
        Moperation op = new Moperation();
        op.pay(session);  
        // ↑ Энэ дотор:
        // 1. session-д хадгалагдсан сагсыг авч боловсруулна
        // 2. session-д "pay" гэж хадгалж, худалдан авсан мэдээллийг үлдээх
        // 3. session-аас сагсыг хоосолно

        // Худалдан авалт дууссан хуудас руу шилжүүлэх
        String url = "pay.jsp";

        // Server-side шилжүүлэлт
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);

        // Та хүсвэл forward-ийн оронд sendRedirect ашиглаж болно
        // response.sendRedirect("pay.jsp");
        // ↑ Энэ тохиолдолд URL өөрчлөгдөнө
    }
}
