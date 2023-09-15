/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
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


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //khai bao dao
        AccountDAO dao = new AccountDAO();
        //load du lieu tu DB 
        List<Account> list = dao.findAll();
        //set du lieu vao ben trong request
        request.setAttribute("listAccount", list);
        //chuyen sang trang jsp
        request.getRequestDispatcher("display.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //get action
        String action =request.getParameter("action");
        //kahi bao dao
        AccountDAO dao = new AccountDAO();
        switch (action) {
            case "search":
                //get keyword
                String keyword = request.getParameter("keyword");
                //load du lieu dua tren keyword
                List<Account> listFound = dao.findByKeyword(keyword);
                //set du lieu vao ben trong request
                request.setAttribute("listAccount", listFound);
                //chuyen ve trang display jsp
                request.getRequestDispatcher("display.jsp").forward(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }
}
