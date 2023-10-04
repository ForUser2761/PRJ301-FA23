package com.bookstore.dal.impl;

import com.bookstore.constant.Constant;
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
        System.out.println(10 % 2);
    }

    public List<Book> findContainsByProperty(String field, String keyword) {
        String sql = "select * from Book \n"
                + "where " + field + " like ?";
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

    public List<Book> findByPage(int page) {
        String sql = "select * from Book\n"
                + "ORDER BY ID \n"
                + "OFFSET ? ROWS \n"
                + "FETCH NEXT ? ROWS ONLY";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("offset", (page - 1) * Constant.RECORD_PER_PAGE);
        parameterMap.put("fetch next", Constant.RECORD_PER_PAGE);
        return queryGenericDAO(Book.class, sql, parameterMap);
    }

    public int findTotalRecord() {
        return findTotalRecordGenericDAO(Book.class);
    }

}
