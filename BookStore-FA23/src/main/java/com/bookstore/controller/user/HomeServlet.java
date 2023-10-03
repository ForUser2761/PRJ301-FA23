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

    BookDAO bookDAO;
    CategoryDAO categoryAO;

    @Override

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        bookDAO = new BookDAO();
        categoryAO = new CategoryDAO();

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
        //set enconding UTF-8
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        //initalize URL
        String URL = "home";
        //get ra action
        String action = request.getParameter("action");
        //perform function corressponding action
        switch (action) {
            case "search":
                searchByName(request, response);
                URL = "views/user/home-page/homePage.jsp";
                break;
            case "category":
                searchByCategory(request, response);
                URL = "views/user/home-page/homePage.jsp";
                break;
            default:
                throw new AssertionError();
        }
        request.getRequestDispatcher(URL).forward(request, response);

    }

    private void searchByName(HttpServletRequest request, HttpServletResponse response) {
        //get keyword
        String keyword = request.getParameter("keyword");

        //tao ra bookDAO
        bookDAO = new BookDAO();
        //get book by name
        List<Book> list = bookDAO.findContainsByProperty("name", keyword);
        for (Book book : list) {
            System.out.println(book);
        }
        //set list vao trong session
        HttpSession session = request.getSession();
        session.setAttribute("listBook", list);
    }

    private void searchByCategory(HttpServletRequest request, HttpServletResponse response) {
        //get category id
        String id = request.getParameter("id");
        //tạo ra bookDAO
        bookDAO = new BookDAO();
        //tìm kiếm books dựa trên category Id
        List<Book> list = bookDAO.findByProperty("categoryId", id);
        //set list vào trong session
        HttpSession session = request.getSession();
        session.setAttribute("listBook", list);
    }

}
