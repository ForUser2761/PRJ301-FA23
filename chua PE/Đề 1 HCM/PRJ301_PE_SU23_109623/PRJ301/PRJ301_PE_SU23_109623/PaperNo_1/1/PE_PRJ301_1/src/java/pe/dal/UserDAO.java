/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.dal;

import java.util.LinkedHashMap;
import java.util.List;
import pe.entity.tblUsers;

/**
 *
 * @author ADMIN
 */
public class UserDAO extends GenericDAO<tblUsers> {

    @Override
    public List<tblUsers> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int insert(tblUsers t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public tblUsers checkUandP(String username, String password) {
        String sql = "select * from tblUsers\n"
                + "where userID = ? and password = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("username", username);
        parameterMap.put("password", password);
        List<tblUsers> list =  queryGenericDAO(tblUsers.class, sql, parameterMap);
        return list.isEmpty() ? null : list.get(0);
    }

}
