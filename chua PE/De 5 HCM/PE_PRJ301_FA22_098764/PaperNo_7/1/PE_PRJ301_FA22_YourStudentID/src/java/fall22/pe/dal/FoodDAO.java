/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fall22.pe.dal;

import fall22.pe.model.tblFoods;
import fall22.pe.utils.GenericDAO;
import java.util.LinkedHashMap;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class FoodDAO extends GenericDAO<tblFoods> {
    
    @Override
    public List<tblFoods> findAll() {
        return queryGenericDAO(tblFoods.class);
    }
    
    @Override
    public int insert(tblFoods t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public List<tblFoods> findName(String name) {
        String sql = "SELECT TOP (1000) [id]\n"
                + "      ,[name]\n"
                + "      ,[description]\n"
                + "      ,[price]\n"
                + "      ,[cookingTime]\n"
                + "      ,[status]\n"
                + "  FROM [FoodManagement].[dbo].[tblFoods]\n"
                + "  where name like ? and status = 1";
        //bat buoc
        parameterMap = new LinkedHashMap<>();
        //put
        parameterMap.put("name", "%" + name + "%");
        return queryGenericDAO(tblFoods.class, sql, parameterMap);
    }
    
    public void update(String id) {
        String sql = "UPDATE [dbo].[tblFoods]\n"
                + "   SET \n"
                + "     [status] = 0\n"
                + " WHERE id = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("", id);
        updateGenericDAO(sql, parameterMap);
    }
    
    public static void main(String[] args) {
        new FoodDAO().update("F-001");
    }
}
