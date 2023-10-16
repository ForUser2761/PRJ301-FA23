/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.dal;

import java.util.LinkedHashMap;
import java.util.List;
import pe.entity.tblFashion;

/**
 *
 * @author ADMIN
 */
public class FashionDAO extends GenericDAO<tblFashion> {

    public List<tblFashion> findByKeyword(String keyword) {
        String sql = "select * from tblFashion\n"
                + "where name like ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("name", "%" + keyword +"%");
        return queryGenericDAO(tblFashion.class, sql, parameterMap);
    }

    @Override
    public List<tblFashion> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int insert(tblFashion t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
