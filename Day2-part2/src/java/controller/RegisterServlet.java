/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Role;

/**
 *
 * @author ADMIN
 */
public class RegisterServlet extends HttpServlet {
    
    Manage manage = new Manage();
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //set listRole vao request
        request.setAttribute("listRole", manage.getListRole());
        
        //chuyen sang trang register.jsp
        request.getRequestDispatcher("register.jsp").forward(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String gender_Raw = request.getParameter("gender");
        boolean gender;
        if (gender_Raw.equalsIgnoreCase("Male")) {
            gender = true;
        }else {
            gender = false;
        }
        
        
        int roleId = Integer.parseInt(request.getParameter("role"));
        String[] hobbies = request.getParameterValues("hobbies");
        
        //tao doi tuong role
        Role role = manage.getRoleById(roleId);
        
        //tao tahnh doi tuong Account
        Account account = new Account(username, password, gender, hobbies, role);
        
        //add account vao collections
        manage.getListAccount().add(account);
        
        //set vao request
        request.setAttribute("listAccount", manage.getListAccount());
        //chuyen sang trang display.jsp
        request.getRequestDispatcher("display.jsp").forward(request, response);
    }


}
