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

/**
 *
 * @author ADMIN
 */
public class AuthenServlet extends HttpServlet {

    AccountDAO accountDAO;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url;
        //get action
        String action = request.getParameter("action") == null
                ? "login"
                : request.getParameter("action");
        //switch action
        switch (action) {
            case "login":
                //url = login.jsp
                url = "views/user/home-page/login.jsp";
                break;
            case "register":
                //url = "register.jsp"
                url = "views/user/home-page/register.jsp";
                break;
            case "logout":
                logoutDoGet(request, response);
                url = "home";
                break;
            default:
                url = "login";
                break;
        }
        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //get action
        String action = request.getParameter("action") == null
                ? "login"
                : request.getParameter("action");
        //switch action
        switch (action) {
            case "login":
                loginDoPost(request, response);
                break;
            case "register":
                registerDoPost(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    private void loginDoPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //tạo đối tượng AccountDAO
        accountDAO = new AccountDAO();
        //get ve cac thong tin 
        //get username
        String username = request.getParameter("username");
        //get password
        String password = request.getParameter("password");

        Account account = Account.builder()
                .username(username)
                .password(password)
                .build();
        //kiểm tra xem account có tồn tại trong DB
        account = accountDAO.findByUsernamePassword(account);
        //nếu account không tồn tài <=> tài khoảng hoặc mật khẩu sai
        if (account == null) {
            request.setAttribute("error", "Username or password incorrect !");
            //chuyển lại về trang login.jsp
            request.getRequestDispatcher("views/user/home-page/login.jsp").forward(request, response);

        } else {
            //set vào session account
            HttpSession session = request.getSession();
            session.setAttribute(Constant.SESSION_ACCOUNT, account);
            if (account.getRoleId() == Constant.ROLE_ADMIN) {
                response.sendRedirect("admin/dashboard");
            }else {
                //chuyển về trang home
                response.sendRedirect("home");
            }
        }

    }

    private void logoutDoGet(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        session.removeAttribute(Constant.SESSION_ACCOUNT);
        session.removeAttribute("cart");
    }

    private void registerDoPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //tạo đối townjg session, accountDAO
        accountDAO = new AccountDAO();
        //get về các thông tin
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        
        //tạo đối tượng từ dữ liệu đã get về
        Account account = Account.builder()
                        .username(username)
                        .password(password)
                        .email(email)
                        .roleId(Constant.ROLE_USER)
                        .build();
        
        //kiểm tra xem username đã từng tồn tại trong DB chưa
        boolean isExist = accountDAO.findByUsername(username);
        if (!isExist) {
            //nếu chưa từng tồn tại thì mới insert dữ liệu vào DB
            accountDAO.insert(account);
            //chuyển về trang home
            response.sendRedirect("home");
        }else {
            //chuyển về trang home
            request.setAttribute("error", "Account exist, please choose other !!");
            request.getRequestDispatcher("views/user/home-page/register.jsp").forward(request, response);
        }
    }

}
