package com.bookstore.dal.impl;

import com.bookstore.dal.GenericDAO;
import com.bookstore.entity.Book;
import java.util.LinkedHashMap;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class BookDAO extends GenericDAO<Book> {

    @Override
    public List<Book> findAll() {
        return queryGenericDAO(Book.class);
    }

    public static void main(String[] args) {
        for (Book book : new BookDAO().findAll()) {
            System.out.println(book);
        }
    }

    public List<Book> findContainsByProperty(String field, String keyword) {
        String sql = "select * from Book \n"
                + "where " + field  + " like ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("name", "%" + keyword + "%");
        return queryGenericDAO(Book.class, sql, parameterMap);
    }

    public List<Book> findByProperty(String field, String id) {
        String sql = "select * from Book where " + field + " = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("categoryId", id);
        return queryGenericDAO(Book.class, sql, parameterMap);
    }

}
