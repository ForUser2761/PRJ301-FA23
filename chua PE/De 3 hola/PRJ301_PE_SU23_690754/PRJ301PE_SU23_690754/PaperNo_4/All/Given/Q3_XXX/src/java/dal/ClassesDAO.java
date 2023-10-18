/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Classes;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class ClassesDAO extends GenericDAO<Classes>{

    @Override
    public List<Classes> findAll() {
        return queryGenericDAO(Classes.class);
    }

    @Override
    public int insert(Classes t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    
}
