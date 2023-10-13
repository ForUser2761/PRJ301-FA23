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
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
