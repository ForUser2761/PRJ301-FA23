package com.bookstore.dal.impl;

import com.bookstore.dal.GenericDAO;
import com.bookstore.entity.Book;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class BookDAO extends GenericDAO<Book>{

    @Override
    public List<Book> findAll() {
        return queryGenericDAO(Book.class);
    }
    
    public static void main(String[] args) {
        for (Book book : new BookDAO().findAll()) {
            System.out.println(book);
        }
    }
    
}
