/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
        String action = request.getParameter("action");
        //kahi bao dao
        AccountDAO dao = new AccountDAO();
        switch (action) {
            case "search":
                //get keyword
                String keyword = request.getParameter("keyword");
                String property = request.getParameter("property");
                //load du lieu dua tren keyword
                List<Account> listFound = searchByProperties(keyword, property, dao);
                //set du lieu vao ben trong request
                request.setAttribute("listAccount", listFound);
                //chuyen ve trang display jsp
                break;

            case "add":
                addFunction(request, response);
                break;
            case "delete":
                deleteFunction(request, response);
                break;
            default:
                throw new AssertionError();
        }
        response.sendRedirect("home");
    }

    private List<Account> searchByProperties(String keyword, String property, AccountDAO dao) {
        List<Account> listFound = new ArrayList<>();
        String sql = null;
        //tuy theo gia tri cua property ma chung ta se lua cho ham thao tac vs db
        switch (property) {
            case "id":
                //search theo id
                listFound = dao.findByKeyword("id", keyword);
                break;
            case "username":
                //search theo username
                listFound = dao.findByKeyword("name", keyword);
                break;
            case "password":
                //search theo password
                listFound = dao.findByKeyword("password", keyword);
                break;
            default:
                throw new AssertionError();
        }
        return listFound;
    }

    private void addFunction(HttpServletRequest request, HttpServletResponse response) {
        //get information
        //id, name, password
        String name = request.getParameter("username");
        String password = request.getParameter("password");

        AccountDAO dao = new AccountDAO();
        dao.insert(name, password);
    }

    private void deleteFunction(HttpServletRequest request, HttpServletResponse response) {
        AccountDAO dao = new AccountDAO();
        
        //get id
        String id = request.getParameter("id");
        dao.delete(id);
    }
}
