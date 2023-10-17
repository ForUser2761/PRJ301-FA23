/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.controllers;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pe.dal.FashionDAO;
import pe.dal.UserDAO;
import pe.entity.tblFashion;
import pe.entity.tblUsers;

/**
 *
 * @author hd
 */
public class MainController extends HttpServlet {

    private static final String LOGIN_PAGE = "login.jsp";
    private static final String FASHION = "fashionList.jsp";
    UserDAO userDAO = new UserDAO();
    FashionDAO fashionDAO = new FashionDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                url = LOGIN_PAGE;
            }
//            your code here
            HttpSession session = request.getSession();
            switch (action) {
                case "login":
                    url = login(request, response, session);
                    break;
                case "logout":
                    logOut(session);
                    url = LOGIN_PAGE;
                    break;
                case "search":
                    searchFas(request, session);
                    url = FASHION;
                    break;
                default:
                    throw new AssertionError();
            }

        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private String login(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        //get về usernmae, password
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        //kiểm tra xem username, password có tòn tại trong DB hay ko
        tblUsers user = userDAO.checkUandP(username, password);
        //nếu có tồn tại trong DB => trả về trang sẽ chuyển đến là fashionList.jsp
        if (user != null) {
            session.setAttribute("user", user);
            return FASHION;
        } //ngược lại thì sẽ set lỗi incorrect ... và trả về trang chuyển đến là login.jsp
        else {
            request.setAttribute("error", "Incorrect username or password");
            return LOGIN_PAGE;
        }
    }

    private void logOut(HttpSession session) {
        session.removeAttribute("user");
    }

    private void searchFas(HttpServletRequest request, HttpSession session) {
        //get ve keyword
        String keyword = request.getParameter("keyword");
        //tim ve List by keyword
        List<tblFashion> fashionList = fashionDAO.findByKeyword(keyword);
        //set vao request
        request.setAttribute("fashionList", fashionList);
    }

}
