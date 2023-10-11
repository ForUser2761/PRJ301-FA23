/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookstore.dal.impl;

import com.bookstore.dal.GenericDAO;
import com.bookstore.entity.Category;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class CategoryDAO extends GenericDAO<Category>{

    @Override
    public List<Category> findAll() {
        return queryGenericDAO(Category.class);
    }

    @Override
    public int insert(Category t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
