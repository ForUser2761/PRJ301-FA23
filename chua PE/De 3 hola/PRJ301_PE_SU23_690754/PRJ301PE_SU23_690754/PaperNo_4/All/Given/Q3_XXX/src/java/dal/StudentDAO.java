/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Students;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class StudentDAO extends GenericDAO<Students>{

    @Override
    public List<Students> findAll() {
        return queryGenericDAO(Students.class);
    }

    @Override
    public int insert(Students t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public static void main(String[] args) {
        for (Students students : new StudentDAO().findAll()) {
            System.out.println(students);
        }
    }
    
}
