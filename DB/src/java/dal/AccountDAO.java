/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import mapper.AccountMapper;
import model.Account;

/**
 *
 * @author ADMIN
 */
public class AccountDAO extends DBContext_1 {

    public List<Account> findAll() {
        List<Account> list = query(new Account(), new AccountMapper(), null);
        return list;
    }

    public List<Account> findById(String id) {
        HashMap<String, Object> conditions = new HashMap<>();
        conditions.put("id", id);
        conditions.put("name", "vxcvxc");
        List<Account> list = query(new Account(), new AccountMapper(), conditions, false);
        return list;
    }

    public void insert2(Account account) {
        insert(account);
    }

    public void update2() {
        HashMap<String, Object> conditions = new HashMap<>();
        conditions.put("id", 1);
        Account account = new Account();
        account.setName("abc");
        account.setPassword("xyz");
        
        update(account, conditions);
    }

    public static void main(String[] args) {
        Account account = new Account(9, "abc", "abc");
        new AccountDAO().insert2(account);
        
        new AccountDAO().update2();
        
        for (Account account1 : new AccountDAO().findAll()) {
            System.out.println(account1);
        }
    }

//    public List<Account> findAll() {
//        List<Account> list = new ArrayList<>();
//        //ket noi duoc voi database
//        connection = getConnection();
//        //co cau lenh de goi xuong database
//        String sql = "select * from Account";
//        try {
//            //chuan bi cho cau lenh
//            statement = connection.prepareStatement(sql);
//            //thuc thi cau lenh o tren => tra ve ket qua
//            resultSet = statement.executeQuery();
//            while (resultSet.next()) {
//                Account account = new Account();
//                //id 
//                int id = resultSet.getInt("id");
//                String name = resultSet.getString("name");
//                String password = resultSet.getString("password");
//                account.setId(id);
//                account.setName(name);
//                account.setPassword(password);
//                //add to collections
//                list.add(account);
//            }
//
//        } catch (SQLException ex) {
//            System.out.println("Error " + ex.getMessage() + "at DBContext method: findAll");
//            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return list;
//    }
//
//    public List<Account> findByKeyword(String property, String keyword) {
//        List<Account> list = new ArrayList<>();
//        //ket noi duoc voi database
//        connection = getConnection();
//        //co cau lenh de goi xuong database
//        String sql = "select  name, password, id\n"
//                + "from Account\n"
//                + "where " + property + " like ?";
//        try {
//            //chuan bi cho cau lenh
//            statement = connection.prepareStatement(sql);
//
//            //set parameter
//            statement.setString(1, "%" + keyword + "%");
//
//            //thuc thi cau lenh o tren => tra ve ket qua
//            resultSet = statement.executeQuery();
//            while (resultSet.next()) {
//                Account account = new Account();
//                //id 
//                int id = resultSet.getInt("id");
//                String name = resultSet.getString("name");
//                String password = resultSet.getString("password");
//                account.setId(id);
//                account.setName(name);
//                account.setPassword(password);
//                //add to collections
//                list.add(account);
//            }
//
//        } catch (SQLException ex) {
//            System.out.println("Error " + ex.getMessage() + "at DBContext method: findAll");
//            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return list;
//    }
//
//    public int insert(String name, String password) {
//        //ket noi duoc voi database
//        connection = getConnection();
//        //co cau lenh de goi xuong database
//        String sql = "INSERT INTO [dbo].[Account]\n"
//                + "           ([name]\n"
//                + "           ,[password])\n"
//                + "     VALUES\n"
//                + "           (? , ? )";
//
//        try {
//            //chuan bi cho cau lenh
//            statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
//
//            //set parameter
//            statement.setString(1, name);
//            statement.setString(2, password);
//
//            //thuc thi cau lenh o tren => tra ve ket qua
//            statement.executeUpdate();
//            resultSet = statement.getGeneratedKeys();
//            if (resultSet.next()) {
//                return resultSet.getInt(1);
//            }
//
//        } catch (SQLException ex) {
//            System.out.println("Error " + ex.getMessage() + "at DBContext method: findAll");
//            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return -1;
//    }
//
//    public void delete(String id) {
//        //ket noi duoc voi database
//        connection = getConnection();
//        //co cau lenh de goi xuong database
//        String sql = "DELETE FROM [dbo].[Account]\n"
//                + "      WHERE id = ?";
//
//        try {
//            //chuan bi cho cau lenh
//            statement = connection.prepareStatement(sql);
//
//            //set parameter
//            statement.setObject(1, id);
//
//            //thuc thi cau lenh o tren => tra ve ket qua
//            statement.executeUpdate();
//
//        } catch (SQLException ex) {
//            System.out.println("Error " + ex.getMessage() + "at DBContext method: findAll");
//            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
//
//    public void update(Account account) {
//        //co cau lenh de goi xuong database
//        String sql = "UPDATE [dbo].[Account]\n"
//                + "   SET [name] = ?\n"
//                + "      ,[password] = ?\n"
//                + " WHERE id = ?";
//        //ket noi duoc voi database
//        connection = getConnection();
//
//        try {
//            //chuan bi cho cau lenh
//            statement = connection.prepareStatement(sql);
//
//            //set parameter
//            statement.setObject(1, account.getName());
//            statement.setObject(2, account.getPassword());
//            statement.setObject(3, account.getId());
//
//            //thuc thi cau lenh o tren => tra ve ket qua
//            statement.executeUpdate();
//
//        } catch (SQLException ex) {
//            System.out.println("Error " + ex.getMessage() + "at DBContext method: update");
//            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
}
