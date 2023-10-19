/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.bookstore.controller.user;

import com.bookstore.constant.Constant;
import com.bookstore.dal.impl.AccountDAO;
import com.bookstore.entity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DashboardServlet extends HttpServlet {

    AccountDAO accountDAO = new AccountDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //set enconding UTF-8
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String page = request.getParameter("page") == null ? "" : request.getParameter("page");
        String url;
        switch (page) {
            case "profile":
                url = "views/user/dashboard/profile.jsp";
                break;
            case "purchase":
                url = "";
                break;
            case "change-password":
                url = "views/user/dashboard/change-password.jsp";
                break;
            default:
                url = "views/user/dashboard/dashboard.jsp";
                break;
        }
        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //set enconding UTF-8
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String url = "";
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
        switch (action) {
            case "profile":
                updateProfileDoPost(request);
                url = "views/user/dashboard/profile.jsp";
                break;
            case "change-password":
                changePassword(request);
                url = "views/user/dashboard/change-password.jsp";
                break;
            default:
                url = "dashboard";
                break;
        }
        request.getRequestDispatcher(url).forward(request, response);
    }

    private void updateProfileDoPost(HttpServletRequest request) {
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String username = request.getParameter("username");

        Account account = Account.builder()
                .username(username)
                .address(address)
                .email(email)
                .build();
        accountDAO.updateProfile(account);
        //update lai account vao session
        HttpSession session = request.getSession();
        Account accountNew = (Account) session.getAttribute(Constant.SESSION_ACCOUNT);
        accountNew.setEmail(email);
        accountNew.setAddress(address);
        session.setAttribute(Constant.SESSION_ACCOUNT, accountNew);

    }

    private void changePassword(HttpServletRequest request) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String newPassword = request.getParameter("newPassword");
        
        //lay ve account tu trong session
        HttpSession session = request.getSession();
        Account accountSession = (Account) session.getAttribute(Constant.SESSION_ACCOUNT);
        
        //kiem tra xem password co = password o trong session
        if (password.equals(accountSession.getPassword())) {
            accountDAO.updatePassword(username, password);
            accountSession.setPassword(password);
            session.setAttribute(Constant.SESSION_ACCOUNT, accountSession);
        }else {
            request.setAttribute("error", "Incorrect password");
        }
    }

}
