/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;

/**
 *
 * @author ADMIN
 */
public class Account {
    private String username,password;
    private boolean gender;
    private String[] hobbies;
    private Role role;

    public Account() {
    }

    public Account(String username, String password, boolean gender, String[] hobbies,
            Role role) {
        this.username = username;
        this.password = password;
        this.gender = gender;
        this.hobbies = hobbies;
        this.role = role;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String[] getHobbies() {
        return hobbies;
    }

    public void setHobbies(String[] hobbies) {
        this.hobbies = hobbies;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "Account{" + "username=" + username + ", password=" + password + ", gender=" + gender + ", hobbies=" + hobbies + ", role=" + role + '}';
    }
    
    
    
}
