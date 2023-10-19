package com.bookstore.dal.impl;

import com.bookstore.dal.GenericDAO;
import com.bookstore.entity.Account;
import java.util.LinkedHashMap;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class AccountDAO extends GenericDAO<Account> {

    public Account findByUsernamePassword(Account account) {
        String sql = "SELECT * FROM [Account]\n"
                + "WHERE username = ? and password = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("username", account.getUsername());
        parameterMap.put("password", account.getPassword());

        List<Account> list = queryGenericDAO(Account.class, sql,
                parameterMap);
        return list.isEmpty()
                ? null
                : list.get(0);
    }

    @Override
    public List<Account> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int insert(Account t) {
//        String sql = "INSERT INTO [dbo].[Account]\n"
//                + "           ([username]\n"
//                + "           ,[password]\n"
//                + "           ,[email]\n"
//                + "           ,[address]\n"
//                + "           ,[roleId])\n"
//                + "     VALUES\n"
//                + "           (?, ?, ? , ? ,?)";
//        parameterMap = new LinkedHashMap<>();
//        parameterMap.put("username", t.getUsername());
//        parameterMap.put("password", t.getPassword());
//        parameterMap.put("email", t.getEmail());
//        parameterMap.put("address", t.getAddress());
//        parameterMap.put("roleId", t.getRoleId());
        return insertGenericDAO(t);
    }

    public boolean findByUsername(String username) {
        String sql = "SELECT * FROM [Account]\n"
                + "WHERE username = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("username", username);
        List<Account> list = queryGenericDAO(Account.class, sql,
                parameterMap);
        return !list.isEmpty();
    }

    public void updateProfile(Account account) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET [email] = ?\n"
                + "      ,[address] = ?\n"
                + " WHERE username = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("email", account.getEmail());
        parameterMap.put("address", account.getAddress());
        parameterMap.put("username", account.getUsername());
        updateGenericDAO(sql, parameterMap);
    }

    public void updatePassword(String username, String password) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET [password] = ?\n"
                + " WHERE username = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("password", password);
        parameterMap.put("username", username);
        updateGenericDAO(sql, parameterMap);
    }

}
