/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.List;
import model.Account;
import java.util.HashMap;

/**
 *
 * @author ADMIN
 */
public class AccountDAO extends GenericDAO<Account> {

    public List<Account> findAll() {
        List<Account> list = queryGenericDAO(Account.class);
        return list;
    }

    public static void main(String[] args) {
        for (Account account1 : new AccountDAO().findAll()) {
            System.out.println(account1);
        }
    }

    public List<Account> findByKeyword(String property, String keyword) {
        parameterMap = new HashMap<>();
        parameterMap.put(property, keyword);
        List<Account> list = queryContainKeywordGenericDAO(Account.class, parameterMap);
        return list;
    }

    public void delete(String id) {
        parameterMap = new HashMap<>();
        parameterMap.put("id", id);
        deleteGenericDAO(Account.class, parameterMap);
    }
    

    public void updateAccount(Account account) {
        parameterMap = new HashMap<>();
        parameterMap.put("id", account.getId());
        updateGenericDAO(account, parameterMap);
    }

    public void insert(Account account) {
        insertGenericDAO(account);
    }
    
    

}
