/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.bookstore.controller.admin;

import com.bookstore.dal.impl.BookDAO;
import com.bookstore.entity.Book;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class DashboardServlet extends HttpServlet {
    BookDAO bookDAO;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //tạo ra đối tượng DAO
        bookDAO = new BookDAO();
        //tạo ra đối tượng session
        HttpSession session = request.getSession();
        //tìm về toàn bộ danh sách các sản phẩm sách
        List<Book> listBooks = bookDAO.findAll();
        
        //set vao session
        session.setAttribute("listBook", listBooks);
        //chuyển qua trang dashboard.jsp
        request.getRequestDispatcher("../views/admin/dashboard/dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }


}
