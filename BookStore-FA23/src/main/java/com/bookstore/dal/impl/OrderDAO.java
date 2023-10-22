package com.bookstore.dal.impl;

import com.bookstore.dal.GenericDAO;
import com.bookstore.entity.Order;
import java.util.LinkedHashMap;
import java.util.List;

public class OrderDAO extends GenericDAO<Order> {

    @Override
    public List<Order> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int insert(Order t) {
        String sql = "INSERT INTO [dbo].[Order]\n"
                + "           ([amount]\n"
                + "           ,[description]\n"
                + "           ,[accountId])\n"
                + "     VALUES\n"
                + "           (?, ? , ?)";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("amount", t.getAmount());
        parameterMap.put("description", t.getDescription());
        parameterMap.put("accountId", t.getAccountId());
        return insertGenericDAO(sql, parameterMap);
    }

}
