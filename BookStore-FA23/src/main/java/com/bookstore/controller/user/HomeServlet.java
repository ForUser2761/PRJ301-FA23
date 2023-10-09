/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.bookstore.controller.user;

import com.bookstore.constant.Constant;
import com.bookstore.dal.impl.BookDAO;
import com.bookstore.dal.impl.CategoryDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.Category;
import com.bookstore.entity.PageControl;
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
        //set enconding UTF-8
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        //session and page control
        HttpSession session = request.getSession();
        PageControl pageControl = new PageControl();
        //phân trang sách
        List<Book> listBook = pagination(request, pageControl);
        List<Category> listCategory = findAllCategory();

        //set listBook vaof session
        session.setAttribute("listBook", listBook);
        session.setAttribute("listCategory", listCategory);
        request.setAttribute("pageControl", pageControl);
        System.out.println(pageControl);
        //go to homepage 
        request.getRequestDispatcher("views/user/home-page/homePage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    private List<Book> pagination(HttpServletRequest request,
            PageControl pageControl) {
        //get page
        String pageRaw = request.getParameter("page");
        bookDAO = new BookDAO();
        //valid page
        int page;
        try {
            page = Integer.parseInt(pageRaw);
        } catch (NumberFormatException e) {
            page = 1;
        }
        int totalRecord;
        List<Book> listBook;
        //get action
        String action = request.getParameter("action") == null
                ? "defaultFindAll"
                : request.getParameter("action");
        //tìm kiếm xem có bao nhiêu record và list record by page
        switch (action) {
            case "search":
                String keyword = request.getParameter("keyword");
                totalRecord = bookDAO.findTotalRecordByName(keyword);
                listBook = bookDAO.findByNameAndPage(keyword, page);
                pageControl.setUrlPattern("home?action=search&keyword="+keyword+"&");
                break;
            case "category":
                String categoryId = request.getParameter("id");
                totalRecord = bookDAO.findTotalRecordByCategory(categoryId);
                listBook = bookDAO.findByCateIdAndPage(categoryId, page);
                pageControl.setUrlPattern("home?action=category&id="+categoryId+"&");
                break;
            default:
                totalRecord = bookDAO.findTotalRecord();
                listBook = bookDAO.findByPage(page);
                pageControl.setUrlPattern("home?");
        }
        //condition Map
        //tìm kiếm xem có tổng bao nhiêu page
        int totalPage = (totalRecord % Constant.RECORD_PER_PAGE) == 0
                ? (totalRecord / Constant.RECORD_PER_PAGE)
                : (totalRecord / Constant.RECORD_PER_PAGE) + 1;

        //set vao pageControl
        pageControl.setPage(page);
        pageControl.setTotalPage(totalPage);
        pageControl.setTotalRecord(totalRecord);

        return listBook;
    }

    private List<Category> findAllCategory() {
        categoryAO = new CategoryDAO();
        return categoryAO.findAll();
    }

}
