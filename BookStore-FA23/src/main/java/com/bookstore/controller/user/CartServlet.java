package com.bookstore.controller.user;

import com.bookstore.dal.impl.BookDAO;
import com.bookstore.dal.impl.OrderDAO;
import com.bookstore.dal.impl.OrderDetailsDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.Order;
import com.bookstore.entity.OrderDetails;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CartServlet extends HttpServlet {

    BookDAO bookDAO = new BookDAO();
    OrderDetailsDAO orderDetailsDAO = new OrderDetailsDAO();
    OrderDAO orderDAO = new OrderDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("views/user/cart/cartDetails.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null
                ? ""
                : request.getParameter("action");
        switch (action) {
            case "add-product":
                addProduct(request, response);
                response.sendRedirect("cart");
                break;
            case "change-quantity":
                changeQuantity(request, response);
                response.sendRedirect("cart");
                break;
            case "delete":
                deleteItem(request, response);
                response.sendRedirect("cart");
                break;

            default:
                response.sendRedirect("home");
        }
    }

    private void addProduct(HttpServletRequest request, HttpServletResponse response) {
        //get ve book id
        int id = Integer.parseInt(request.getParameter("id"));
        //get ve quantity
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        //get ve book
        List<Book> list = bookDAO.findByProperty("id", request.getParameter("id"));
        Book book = list.isEmpty() ? null : list.get(0);
        //tao ra doi tuong OrderDetails
        OrderDetails orderDetails = OrderDetails.builder()
                .bookId(id)
                .quantity(quantity)
                .build();
        //get ve cart tu session
        HttpSession session = request.getSession();
        Order cart = (Order) session.getAttribute("cart");
        //neu cart == null => cart chua tung ton tai => tao moi
        if (cart == null) {
            cart = new Order();
        }
        //them orderDetails vao trong cart
        addOrderDetails(orderDetails, cart);
        //luu tru cart len session
        session.setAttribute("cart", cart);
        session.setAttribute("book", book);
    }

    private void addOrderDetails(OrderDetails orderDetails, Order cart) {
        boolean isAdd = false;
        for (OrderDetails od : cart.getListOrderDetails()) {
            if (od.getBookId() == orderDetails.getBookId()) {
                od.setQuantity(od.getQuantity() + orderDetails.getQuantity());
                isAdd = true;
                break;
            }
        }
        //kiem tra xem da add chua, neu ma chua add => orderDetals chua tung ton tai trong Order
        if (isAdd == false) {
            cart.getListOrderDetails().add(orderDetails);
        }
    }

    private void changeQuantity(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        //get ve cart tu session
        HttpSession session = request.getSession();
        Order cart = (Order) session.getAttribute("cart");

        //lap qua danh sach trong cart, tim ra order details co book id = id parameter
        // neu tim ra thi set quantity moi cho order details
        for (OrderDetails od : cart.getListOrderDetails()) {
            if (od.getBookId() == id) {
                od.setQuantity(quantity);
            }
        }
        //luu lai vao session
        session.setAttribute("cart", cart);
    }

    private void deleteItem(HttpServletRequest request, HttpServletResponse response) {
        //lay ve id
        int id = Integer.parseInt(request.getParameter("id"));
        //lay ve cart 
        HttpSession session = request.getSession();
        Order cart = (Order) session.getAttribute("cart");
        //tim ra order detail co bookId dua tren id parameter
        OrderDetails od = null;
        for (OrderDetails orderDetails : cart.getListOrderDetails()) {
            if (orderDetails.getBookId() == id) {
                od = orderDetails;
            }
        }
        //xoa no ra khoi cart
        cart.getListOrderDetails().remove(od);
        //set lai cart vao session
        session.setAttribute("cart", cart);
    }

}
