/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class ExecuteServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            int number = Integer.parseInt(request.getParameter("number"));
            String error = null;
            if (number >= 1 && number <= 6) {
                error = "You must input an integer 1 < n < 6";
            }

            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ExecuteServlet</title>");
            out.println("</head>");
            out.println("<body>");
            if (error != null) {
                out.println("<h1>" + error + "</h1>");
            }else {
                out.println("<h1>" + tinhGiaiThua(number) + "</h1>");
            }
            out.println("</body>");
            out.println("</html>");
        }
    }
    
    public static int tinhGiaiThua(int n) {
        if (n == 0 || n == 1) {
            return 1;
        } else {
            int giaiThua = 1;
            
            for (int i = 2; i <= n; i++) {
                giaiThua *= i;
            }
            
            return giaiThua;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

}
