/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package mapper;

import java.sql.ResultSet;
import model.Account;

/**
 *
 * @author ADMIN
 */
public class AccountMapper implements IGenericMapper<Account>{

    @Override
    public Account mapRow(ResultSet resultSet) {
        try {
            int id = resultSet.getInt("id");
            String name = resultSet.getString("name");
            String password =resultSet.getString("password");
            
            Account account = new Account(id, name, password);
            return account;
        } catch (Exception e) {
            System.out.println("Wrong at AccountMapper: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public String insert(Account t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void test() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
