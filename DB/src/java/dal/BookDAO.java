/*				
 * Copyright (C) FPT University , Ltd. 2023	
 * 30/09/2023 FPT 4USER
 */
package dal;

import java.util.HashMap;
import java.util.List;
import model.Book;

/**
 *
 * @author ADMIN
 */
public class BookDAO extends GenericDAO<Book>{
    
    public List<Book> findAll() {
        List<Book> list = query(Book.class);
        return list;
    }
    
    public List<Book> findBooks() {
        conditions = new HashMap<>();
        conditions.put("author", "AVA+");
        List<Book> list = query(Book.class);
        return list;
    }
    
    public int findTotalRecord() {
        conditions = new HashMap<>();
        conditions.put("author", "AVA+");
        return findTotalRecord(Book.class);
    }
    
    public static void main(String[] args) {
        for (Book book : new BookDAO().findAll()) {
            System.out.println(book);
        }
    }
    
    
}
