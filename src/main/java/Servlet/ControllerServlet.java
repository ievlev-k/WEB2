package Servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.SocketHandler;

public class ControllerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        if ((req.getParameter("x") != null && req.getParameter("y") != null && req.getParameter("r") != null)
             || !req.getParameter("clickY").equals("null") && !req.getParameter("clickX").equals("null") && (req.getParameter("clickX") != null && req.getParameter("clickY") != null && req.getParameter("r") != null)
        ) {
            getServletContext().getNamedDispatcher("AreaCheckServlet").forward(req, resp);
        }
        else {
//
//            resp.setContentType("text/html");
//            PrintWriter printWriter = resp.getWriter();
//            printWriter.write(req.getParameter("reset-flag"));
//            printWriter.close();
            if (req.getParameter("reset-flag") != null && req.getParameter("reset-flag").equals("true")){
                req.getSession().removeAttribute("results");
            }
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/index.jsp").forward(req,resp);
    }
}
