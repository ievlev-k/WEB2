package Servlet;

import Date.Table;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


import java.io.PrintWriter;
import java.util.ArrayList;

public class AreaCheckServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

            String xValue;
            String yValue;
            String rValue;


            xValue = req.getParameter("clickX");
            yValue = req.getParameter("clickY");
            rValue = req.getParameter("r");
        if(req.getParameter("clickX").equals("") && req.getParameter("clickY").equals("")) {
            xValue = req.getParameter("x");
            yValue = req.getParameter("y");
            rValue = req.getParameter("r");
        }



            if (isValidData(xValue, yValue, rValue)) {
                double x = Double.parseDouble(xValue);
                double y = Double.parseDouble(yValue);
                double r = Double.parseDouble(rValue);
                boolean hit = checkHit(x, y, r);
                Table result = new Table(x, y, r, hit);
                ArrayList<Table> results;
                if (req.getSession().getAttribute("results") == null) {
                    results = new ArrayList<>();
                } else {
                    results = (ArrayList<Table>) req.getSession().getAttribute("results");
                }
                results.add(result);
                req.getSession().setAttribute("results", results);
            }
            resp.sendRedirect("/LabWEB2-1.0-SNAPSHOT");


    }



    private boolean isValidData(String xValue, String yValue, String rValue) {
        try {
            double x = Double.parseDouble(xValue);
            double y = Double.parseDouble(yValue);
            double r = Double.parseDouble(rValue);
            if (x < -5 || x > 3) return false;
            if (y < -5 || y > 5) return false;
            if (r < 1 || r > 3) return false;
        } catch (NumberFormatException e) {
            return false;
        }
        return true;
    }
    private boolean checkHit(double x, double y, double r){
        boolean hit = (x>= 0 && y >= 0 && r >= 2*y +x)|| (x>=0 && x <= r && y <=0 && y >= -r)||(x<=0 && y <= 0 && (x*x + y*y <= r*r));
        return hit;
    }
}
