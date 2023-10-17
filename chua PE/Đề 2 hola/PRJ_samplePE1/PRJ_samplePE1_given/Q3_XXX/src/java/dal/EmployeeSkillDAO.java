/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Employee_Skill;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class EmployeeSkillDAO extends GenericDAO<Employee_Skill>{

    @Override
    public List<Employee_Skill> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int insert(Employee_Skill t) {
        return insertGenericDAO(t);
    }
    
}
