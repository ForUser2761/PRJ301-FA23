/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
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
public class HelloServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
         // Set response content type
        response.setContentType("text/html");

        // Actual logic goes here.
        PrintWriter out = response.getWriter();
        out.println("<h1>" + "Hello World o phuong do GET cua class HelloServlet" + "</h1>");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        // Actual logic goes here.
        PrintWriter out = response.getWriter();
        out.println("<h1>" + "Hello World o phuong do POST cua class HelloServlet" + "</h1>");
    }
    
    
    
}
