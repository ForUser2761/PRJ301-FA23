/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookstore.controller;

import com.bookstore.entity.Book;

/**
 *
 * @author ADMIN
 */
public class Main {
    public static void main(String[] args) {
        Book book = Book.builder()
                    .id("1")
                    .name("hello")
                    .build();
        System.out.println(book);
    }
}
