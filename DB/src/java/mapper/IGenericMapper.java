/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package mapper;

import java.sql.ResultSet;

/**
 *
 * @author ADMIN
 */
public interface IGenericMapper<T> {
    
    /**
     * Mapping data from database to result set
     * @param resultSet
     * @return Element or null
     */
    T mapRow(ResultSet resultSet);
    
    String insert(T t);
    
    void test();
}
