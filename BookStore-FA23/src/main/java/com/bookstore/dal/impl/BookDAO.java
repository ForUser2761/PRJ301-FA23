package com.bookstore.dal.impl;

import com.bookstore.constant.Constant;
import com.bookstore.dal.GenericDAO;
import com.bookstore.entity.Book;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

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

    public List<Book> findByActionAndPage(String action, int page, Map<String, Object> conditionMap) {
        String sql = "select * from Book\n";

        parameterMap = new LinkedHashMap<>();
        switch (action) {
            case "search":
                //get keyword
                Object keyword = conditionMap.get("keyword");
                parameterMap.put("name", "%" + keyword + "%");
                //sql 
                sql += "where name like ?\n";
                //find total record by name
                break;
            case "category":
                //get category
                Object categoryId = conditionMap.get("categoryId");
                parameterMap.put("categoryId", categoryId);
                //find total record by category
                sql += "where categoryId = ?\n";
                break;
            default:
                //find total record
                break;
        }
        sql += "ORDER BY ID \nOFFSET ? ROWS \nFETCH NEXT ? ROWS ONLY";
        System.out.println(sql);
        parameterMap.put("offset", (page - 1) * Constant.RECORD_PER_PAGE);
        parameterMap.put("fetch next", Constant.RECORD_PER_PAGE);
        return queryGenericDAO(Book.class, sql, parameterMap);
    }

    public int findTotalRecordByName(String keyword) {
        String sql = "SELECT COUNT(*) FROM BOOK where name like ?";
        parameterMap.put("name", "%" + keyword + "%");
        return findTotalRecordGenericDAO(Book.class, sql, parameterMap);
    }

    public int findTotalRecordByCategory(String categoryId) {
        String sql = "SELECT COUNT(*) FROM BOOK where categoryId = ?";
        parameterMap = new HashMap<>();
        parameterMap.put("categoryId", categoryId);
        return findTotalRecordGenericDAO(Book.class, sql, parameterMap);
    }

    public int findTotalRecord() {
        return findTotalRecordGenericDAO(Book.class);
    }

    public List<Book> findByNameAndPage(String keyword, int page) {
        String sql = "select * from Book\n"
                + "where name like ?\n"
                + "order by id\n"
                + "offset ? rows\n"
                + "fetch next ? rows only";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("name", "%" + keyword + "%");
        parameterMap.put("offset", (page - 1) * Constant.RECORD_PER_PAGE);
        parameterMap.put("fetch next", Constant.RECORD_PER_PAGE);
        return queryGenericDAO(Book.class, sql, parameterMap);
    }

    public List<Book> findByCateIdAndPage(String categoryId, int page) {
        String sql = "select * from Book\n"
                + "where categoryId = ?\n"
                + "order by id\n"
                + "offset ? rows\n"
                + "fetch next ? rows only";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("categoryId", categoryId);
        parameterMap.put("offset", (page - 1) * Constant.RECORD_PER_PAGE);
        parameterMap.put("fetch next", Constant.RECORD_PER_PAGE);
        return queryGenericDAO(Book.class, sql, parameterMap);
    }

    public List<Book> findByPage(int page) {
        String sql = "select * from Book\n"
                + "order by id\n"
                + "offset ? rows\n"
                + "fetch next ? rows only";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("offset", (page - 1) * Constant.RECORD_PER_PAGE);
        parameterMap.put("fetch next", Constant.RECORD_PER_PAGE);
        return queryGenericDAO(Book.class, sql, parameterMap);
    }

}
