/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class SumServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        //lay ve du lieu cua number
        String numberRaw = request.getParameter("number");
        try {
            //chuyen tu kieu du lieu string sang kieu du lieu int
            int number = Integer.parseInt(numberRaw);
            //kiem tra xem number co phai > 1
            if (number <= 1) {
                request.setAttribute("error", "You input wrong");
            }else {
                //luu tru gia tri muon mang di vao trong request
                request.setAttribute("sum", calculatePrimeSum(number));
            }
            
            
        } catch (NumberFormatException e) {
            request.setAttribute("error", "You input wrong");
        }
        
        
        request.getRequestDispatcher("display.jsp").forward(request, response);
    }

    public static int calculatePrimeSum(int n) {
        int sum = 0;

        for (int num = 2; num < n; num++) {
            if (isPrime(num)) {
                sum += num;
            }
        }

        return sum;
    }

    public static boolean isPrime(int num) {
        if (num <= 1) {
            return false;
        }

        for (int i = 2; i <= Math.sqrt(num); i++) {
            if (num % i == 0) {
                return false;
            }
        }

        return true;
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
