/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fall22.pe.dal;

import fall22.pe.model.tblUsers;
import fall22.pe.utils.GenericDAO;
import java.util.LinkedHashMap;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class tblUserDAO extends GenericDAO<tblUsers> {

    @Override
    public List<tblUsers> findAll() {
        return queryGenericDAO(tblUsers.class);
    }

    @Override
    public int insert(tblUsers t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public tblUsers findAccount(String username, String password) {
        String sql = "select * from tblUsers\n"
                + "where [userId] = ? and password = ?";
        //bat buoc
        parameterMap = new LinkedHashMap<>();
        //set object
        parameterMap.put("userId", username);
        parameterMap.put("password", password);
        //tim ve danh sach
        List<tblUsers> list = queryGenericDAO(tblUsers.class,
                sql, parameterMap);
        return list.isEmpty() ? null : list.get(0);
    }

    public static void main(String[] args) {
        System.out.println(new tblUserDAO().findAccount("ADMIN", "ADMIN"));
    }
}
