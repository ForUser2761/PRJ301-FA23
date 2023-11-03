/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fall22.pe.controllers;

import fall22.pe.dal.FoodDAO;
import fall22.pe.dal.tblUserDAO;
import fall22.pe.model.tblFoods;
import fall22.pe.model.tblUsers;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
        String url = null;
        switch (action) {
            case "login":
                url = login(request, response);
                break;
            case "logout":
                logout(request, response);
                url = "login.jsp";
                break;
            case "search":
                search(request, response);
                url = "admin.jsp";
                break;
            case "update":
                update(request, response);
                url = "admin.jsp";
                break;
            default:
                throw new AssertionError();
        }
        request.getRequestDispatcher(url).forward(request, response);
    }

    private String login(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        tblUsers account = new tblUserDAO().findAccount(username, password);
        System.out.println(account.getRoleID());
        if (account == null) {
            request.setAttribute("error", "loi~");
            return "login.jsp";
        } else {
            request.getSession().setAttribute("account", account);
            return "admin.jsp";
        }
    }

    private void logout(HttpServletRequest request, HttpServletResponse response) {
        request.getSession().removeAttribute("account");
    }

    private void search(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        List<tblFoods> list = new FoodDAO().findName(name);
        request.getSession().setAttribute("list", list);
    }

    private void update(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        new FoodDAO().update(id);
        List<tblFoods> list = new FoodDAO().findName("");
        request.getSession().setAttribute("list", list);
    }

}
