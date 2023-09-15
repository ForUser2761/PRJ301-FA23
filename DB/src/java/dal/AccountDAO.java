/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

/**
 *
 * @author ADMIN
 */
public class AccountDAO extends DBContext {

    public List<Account> findAll() {
        List<Account> list = new ArrayList<>();
        //ket noi duoc voi database
        connection = getConnection();
        //co cau lenh de goi xuong database
        String sql = "select * from Account";
        try {
            //chuan bi cho cau lenh
            statement = connection.prepareStatement(sql);
            //thuc thi cau lenh o tren => tra ve ket qua
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Account account = new Account();
                //id 
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String password = resultSet.getString("password");
                account.setId(id);
                account.setName(name);
                account.setPassword(password);
                //add to collections
                list.add(account);
            }

        } catch (SQLException ex) {
            System.out.println("Error " + ex.getMessage() + "at DBContext method: findAll");
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Account> findByKeyword(String keyword) {
        List<Account> list = new ArrayList<>();
        //ket noi duoc voi database
        connection = getConnection();
        //co cau lenh de goi xuong database
        String sql = "select  name, password, id\n"
                + "from Account\n"
                + "where name like ?";
        try {
            //chuan bi cho cau lenh
            statement = connection.prepareStatement(sql);
            
            //set parameter
            statement.setString(1, "%" + keyword + "%");
            
            //thuc thi cau lenh o tren => tra ve ket qua
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Account account = new Account();
                //id 
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String password = resultSet.getString("password");
                account.setId(id);
                account.setName(name);
                account.setPassword(password);
                //add to collections
                list.add(account);
            }

        } catch (SQLException ex) {
            System.out.println("Error " + ex.getMessage() + "at DBContext method: findAll");
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
}