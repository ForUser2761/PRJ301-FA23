/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.List;
import model.Account;

/**
 *
 * @author ADMIN
 */
public class AccountDAO extends GenericDAO<Account> {

    public List<Account> findAll() {
        List<Account> list = query(Account.class);
        return list;
    }

    public static void main(String[] args) {
        for (Account account1 : new AccountDAO().findAll()) {
            System.out.println(account1);
        }
    }

}
