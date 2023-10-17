/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Skill;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class SkillDAO extends GenericDAO<Skill>{

    @Override
    public List<Skill> findAll() {
        return queryGenericDAO(Skill.class);
    }

    @Override
    public int insert(Skill t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
