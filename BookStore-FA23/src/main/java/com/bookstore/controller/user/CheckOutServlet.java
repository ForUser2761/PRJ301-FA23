package com.bookstore.controller.user;

import com.bookstore.constant.Constant;
import com.bookstore.dal.impl.OrderDAO;
import com.bookstore.dal.impl.OrderDetailsDAO;
import com.bookstore.entity.Order;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.bookstore.entity.Book;
import com.bookstore.entity.OrderDetails;
import com.bookstore.entity.*;
import java.util.List;

public class CheckOutServlet extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //set enconding UTF-8
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        request.getRequestDispatcher("views/user/cart/checkOut.jsp").forward(request, response);
    } 


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //set enconding UTF-8
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        //lay ve session, orderDAO, OrderDETAILDAO
        HttpSession session = request.getSession();
        OrderDAO orderDAO = new OrderDAO();
        OrderDetailsDAO orderDetailsDAO = new OrderDetailsDAO();
        
        //get ve note
        String note = request.getParameter("note");
        //get ve account tren session
        Account account = (Account) session.getAttribute(Constant.SESSION_ACCOUNT);
        //get cart tren session
        Order cart = (Order) session.getAttribute("cart");
        //get ve list Book tren session
        List<Book> list = (List<Book>) session.getAttribute("listBook");
        //calculate amount cua cart
        int amount = caluclateAmount(cart, list);
        //tao doi tuong order
        cart.setAccountId(account.getId());
        cart.setAmount(amount);
        cart.setDescription(note);
        //luu doi tuong order vao trong DB => lay ve id cua order sau khi luu thanh cong
        int orderId = orderDAO.insert(cart);
        //luu tung cai order detail trong cart vao trong DB
        for (OrderDetails orderDetails : cart.getListOrderDetails()) {
            orderDetails.setOrderId(orderId);
            orderDetailsDAO.insert(orderDetails);
        }
        
        session.removeAttribute("cart");
        //chuyen ve lai trang home
        response.sendRedirect("home");
    }

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CheckOutServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckOutServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    private int caluclateAmount(Order cart, List<Book> list) {
        int amount = 0;
        for (OrderDetails od : cart.getListOrderDetails()) {
            amount += (od.getQuantity() * findBookById(list, od.getBookId()));
        }
        return amount;
    }

    private int findBookById(List<Book> list, int bookId) {
        for (Book book : list) {
            if (book.getId().equals(bookId + "")) {
                return book.getPrice();
            }
        }
        return 0;
    }

}
