/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookstore.dal.impl;

import com.bookstore.dal.GenericDAO;
import com.bookstore.entity.OrderDetails;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class OrderDetailsDAO extends GenericDAO<OrderDetails>{

    @Override
    public List<OrderDetails> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int insert(OrderDetails t) {
        return insertGenericDAO(t);
    }
    
}
