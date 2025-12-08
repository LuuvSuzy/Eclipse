package control;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ChangeLanguageServlet")
public class ChangeLanguageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String lang = request.getParameter("lang");
        HttpSession session = request.getSession();
        if (lang != null && (lang.equals("ja") || lang.equals("en") || lang.equals("ko") 
                || lang.equals("zh") || lang.equals("mn"))) {
            session.setAttribute("lang", lang);
        }
        // AJAX request тул redirect хийхгүй, зөвхөн OK status
        response.setStatus(HttpServletResponse.SC_OK);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
