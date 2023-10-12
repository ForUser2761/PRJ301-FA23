/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.bookstore.controller.admin;

import com.bookstore.dal.impl.BookDAO;
import com.bookstore.entity.Book;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.bookstore.entity.Category;
import com.bookstore.dal.impl.CategoryDAO;
import java.io.File;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

/**
 *
 * @author ADMIN
 */
@MultipartConfig
public class DashboardServlet extends HttpServlet {
    BookDAO bookDAO;
    CategoryDAO categoryDAO;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //tạo ra đối tượng DAO
        bookDAO = new BookDAO();
        categoryDAO = new CategoryDAO();
        //tạo ra đối tượng session
        HttpSession session = request.getSession();
        //tìm về toàn bộ danh sách các sản phẩm sách
        List<Book> listBooks = bookDAO.findAll();
        List<Category> listCategory = categoryDAO.findAll();
        //set vao session
        session.setAttribute("listBook", listBooks);
        session.setAttribute("listCategories", listCategory);
        //chuyển qua trang dashboard.jsp
        request.getRequestDispatcher("../views/admin/dashboard/dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //set enconding UTF-8
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        //TAO SESSION
        HttpSession session = request.getSession();

        String action = request.getParameter("action") == null
                ? ""
                : request.getParameter("action");
        switch (action) {
            case "add":
                addBook(request);
                break;
            case "delete":
                delete(request);
                break;
            case "edit":
                edit(request);
                break;
            default:
                throw new AssertionError();
        }
        response.sendRedirect("dashboard");

    }

    private void addBook(HttpServletRequest request) {
        //tạo đối tượng DAO
        bookDAO = new BookDAO();
        //get information
        //get name
        String name = request.getParameter("name");
        //get author
        String author = request.getParameter("author");
        //get price
        int price = Integer.parseInt(request.getParameter("price"));
        //get quantity
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        //get description
        String description = request.getParameter("description");
        //get category Id
        int categoryId = Integer.parseInt(request.getParameter("category"));
        String imagePath = null;
        try {
            Part part = request.getPart("image");

            //đường dẫn lưu ảnh
            String path = request.getServletContext().getRealPath("/images");
            File dir = new File(path);
            //ko có đường dẫn => tự tạo ra
            if (!dir.exists()) {
                dir.mkdirs();
            }

            File image = new File(dir, part.getSubmittedFileName());
            part.write(image.getAbsolutePath());
            imagePath = "/BookStore-FA23/images/" + image.getName();
        } catch (Exception e) {
        }
        Book book = Book.builder()
                .name(name)
                .author(author)
                .price(price)
                .quantity(quantity)
                .description(description)
                .categoryId(categoryId)
                .image(imagePath)
                .build();
        bookDAO.insert(book);
        //tạo đối tượng Book
    }

    private void delete(HttpServletRequest request) {
        //tạo ra đối tượng DAO
        bookDAO = new BookDAO();
        //get information
        int id = Integer.parseInt(request.getParameter("id"));
        //delete book by id
        bookDAO.deleteById(id);
    }

    private void edit(HttpServletRequest request) {
        Book book = new Book();
        //get information
        //get id
        String id = request.getParameter("id");
        //get name
        String name = request.getParameter("name");
        //get author
        String author = request.getParameter("author");
        //get price
        int price = Integer.parseInt(request.getParameter("price"));
        //get quantity
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        //get description
        String description = request.getParameter("description");
        //get category Id
        int categoryId = Integer.parseInt(request.getParameter("category"));
        
        String imagePath = null;
        //get image
        try {

            Part part = request.getPart("image");
            if (part == null || part.getSize() <= 0) {
                // Sử dụng ảnh hiện tại và cập nhật đường dẫn (imagePath)
                String currentImage = request.getParameter("currentImage");
                book.setImage(currentImage);
            } else {
                try {
                    String path = request.getServletContext().getRealPath("/images");
                    File dir = new File(path);
                    //ko có đường dẫn => tự tạo ra
                    if (!dir.exists()) {
                        dir.mkdirs();
                    }

                    File image = new File(dir, part.getSubmittedFileName());
                    part.write(image.getAbsolutePath());
                    imagePath = "/BookStore-FA23/images/" + image.getName();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        //setter parameter
        book.setId(id);
        book.setName(name);
        book.setAuthor(author);
        book.setPrice(price);
        book.setQuantity(quantity);
        book.setDescription(description);
        book.setCategoryId(categoryId);
        book.setImage(imagePath);
       
        //taoj doi tuong
        BookDAO dao = new BookDAO();
        dao.updateBook(book);
    }

}
