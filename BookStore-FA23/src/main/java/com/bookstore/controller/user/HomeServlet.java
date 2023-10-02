/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.bookstore.controller.user;

import com.bookstore.dal.GenericDAO;
import com.bookstore.dal.impl.BookDAO;
import com.bookstore.dal.impl.CategoryDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.Category;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author 4USER
 */
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        GenericDAO<Book> bookDAO = new BookDAO();
        GenericDAO<Category> categoryAO = new CategoryDAO();
        
        //tạo ra session
        HttpSession session = request.getSession();
        
        //get dữ liệu từ DB lên
        List<Book> listBook = bookDAO.findAll();
        List<Category> listCategory = categoryAO.findAll();
        
        //set listBook vaof session
        session.setAttribute("listBook", listBook);
        session.setAttribute("listCategory", listCategory);
        //go to homepage 
        request.getRequestDispatcher("views/user/home-page/homePage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
