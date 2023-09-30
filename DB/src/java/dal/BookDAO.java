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
    
    public List<Book> findByWord() {
        conditions = new HashMap<>();
        conditions.put("name", "Pin");
        List<Book> list = queryContainKeyword(Book.class);
        return list;
    }
    
    public static void main(String[] args) {
        System.out.println(new BookDAO().findByWord().size());
        for (Book book : new BookDAO().findByWord()) {
            System.out.println(book);
        }
    }
    
    
}
