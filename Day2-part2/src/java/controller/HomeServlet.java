/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;

/**
 *
 * @author ADMIN
 */
public class HomeServlet extends HttpServlet {

    Manage manage = new Manage();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Account> list = manage.getListAccount();

        //set vao request
        request.setAttribute("listAccount", manage.getListAccount());

        request.getRequestDispatcher("display.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "search":
                //get username ma nguo dung muon
                String username = request.getParameter("username");
                List<Account> listSearch = manage.searchByName(username);

                request.setAttribute("listAccount", listSearch);

                break;
            case "delete":
                username = request.getParameter("username");
                manage.deleteByName(username);
                request.setAttribute("listAccount", manage.getListAccount());
                break;
            default:
                throw new AssertionError();
        }

        request.getRequestDispatcher("display.jsp").forward(request, response);
    }
}
