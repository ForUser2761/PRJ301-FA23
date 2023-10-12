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

    /**
     * Hàm này sử dụng để tìm về xem có bao nhiêu bản ghi trong DB
     *
     * @return total record
     */
    public int findTotalRecord() {
        return findTotalRecordGenericDAO(Book.class);
    }

    /**
     * Hàm này sử dụng để tìm về tổng số bản ghi dựa trên categoryId
     *
     * @param categoryId
     * @return tổng số bản ghi dựa trên categoryId
     */
    public int findTotalRecordByCategory(String categoryId) {
        String sql = "SELECT COUNT(*) FROM BOOK where categoryId = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("categoryId", categoryId);
        return findTotalRecordGenericDAO(Book.class, sql, parameterMap);
    }

    /**
     * Hàm này sử dụng để tìm về danh sách các quyển sách dựa trên categoryId và
     * page mà người dùng chỉ định
     *
     * @param categoryId
     * @param page
     * @return
     */
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

    public int findTotalRecordByName(String keyword) {
        String sql = "SELECT COUNT(*) FROM BOOK where name like ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("name", "%" + keyword + "%");
        return findTotalRecordGenericDAO(Book.class, sql, parameterMap);
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

    @Override
    public int insert(Book book) {
        return insertGenericDAO(book);
    }

    public void deleteById(int id) {
        String sql = "DELETE FROM [dbo].[Book]\n"
                + "      WHERE id = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("id", id);
        updateGenericDAO(sql, parameterMap);
    }

    public void updateBook(Book book) {
        String sql = "UPDATE [dbo].[Book]\n"
                + "   SET [name] =?\n"
                + "      ,[image] = ?\n"
                + "      ,[quantity] = ?\n"
                + "      ,[author] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[description] = ?\n"
                + "      ,[categoryId] = ?\n"
                + " WHERE id = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("name", book.getName());
        parameterMap.put("image", book.getImage());
        parameterMap.put("quantity", book.getQuantity());
        parameterMap.put("author", book.getAuthor());
        parameterMap.put("price", book.getPrice());
        parameterMap.put("description", book.getDescription());
        parameterMap.put("categoryId", book.getCategoryId());
        parameterMap.put("id", book.getId());
        updateGenericDAO(sql, parameterMap);
    }

}
