/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Role;

/**
 *
 * @author ADMIN
 */
public class Manage {
    public static ArrayList<Role> listRole;
    public static ArrayList<Account> listAccount;
    
    public Manage() {
        listRole = new ArrayList<>();
        Role role1 = new Role(1, "Admin");
        Role role2 = new Role(2 , "Student");
        Role role3 = new Role(3, "Teacher");
        Role role4 = new Role(4, "IT");
        
        listRole.add(role1);
        listRole.add(role2);
        listRole.add(role3);
        listRole.add(role4);
        listAccount = new ArrayList<>();
        String[] array = {"1" , "2" };
        listAccount.add(new Account("abc", "1", true, array, role1 ));
        listAccount.add(new Account("abcd", "1", true, array, role2 ));
        listAccount.add(new Account("abcde", "1", true, array, role3 ));
        listAccount.add(new Account("abcdef", "1", true, array, role4 ));
    }

    public ArrayList<Account> getListAccount() {
        return listAccount;
    }
    

    public ArrayList<Role> getListRole() {
        return listRole;
    }

    public void setListRole(ArrayList<Role> listRole) {
        this.listRole = listRole;
    }
    
    public Role getRoleById(int id) {
        for (Role role : listRole) {
            if (role.getId() == id) {
                return role;
            }
        }
        return null;
    }
    
    public List<Account> searchByName(String username) {
        List<Account> listSearch = new ArrayList<>();
        for (Account account : listAccount) {
            if (account.getUsername().toUpperCase().contains(username.toUpperCase())) {
                listSearch.add(account);
            }
        }
        return listSearch;
    }
    
    public void deleteByName(String username) {
        for (int i = 0; i < listAccount.size(); i++) {
            Account account = listAccount.get(i);
            
            //kiem tra xem account co username = username parameter hay ko
            //neu  = => xoa
            if (account.getUsername().equalsIgnoreCase(username)) {
                listAccount.remove(account);
            }
            //ko thi bo qua
            
        }
    }
    
    
}
