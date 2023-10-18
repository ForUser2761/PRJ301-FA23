/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Date;

/**
 *
 * @author ADMIN
 */
public class Classes {
    private int ClassID;
    private String ClassName;
    private Date StartDate;

    public Classes(int ClassID, String ClassName, Date StartDate) {
        this.ClassID = ClassID;
        this.ClassName = ClassName;
        this.StartDate = StartDate;
    }

    public Classes() {
    }

    public int getClassID() {
        return ClassID;
    }

    public void setClassID(int ClassID) {
        this.ClassID = ClassID;
    }

    public String getClassName() {
        return ClassName;
    }

    public void setClassName(String ClassName) {
        this.ClassName = ClassName;
    }

    public Date getStartDate() {
        return StartDate;
    }

    public void setStartDate(Date StartDate) {
        this.StartDate = StartDate;
    }
    
    
}
