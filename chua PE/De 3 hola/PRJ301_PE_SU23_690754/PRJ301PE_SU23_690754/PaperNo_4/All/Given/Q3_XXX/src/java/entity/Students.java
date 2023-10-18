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
public class Students {
    private String StudentID;
    private String StudentName;
    private Date BirthDate;
    private boolean Gender;
    private int ClassID;

    public Students() {
    }

    public Students(String StudentID, String StudentName, Date BirthDate, boolean Gender, int ClassID) {
        this.StudentID = StudentID;
        this.StudentName = StudentName;
        this.BirthDate = BirthDate;
        this.Gender = Gender;
        this.ClassID = ClassID;
    }

    public String getStudentID() {
        return StudentID;
    }

    public void setStudentID(String StudentID) {
        this.StudentID = StudentID;
    }

    public String getStudentName() {
        return StudentName;
    }

    public void setStudentName(String StudentName) {
        this.StudentName = StudentName;
    }

    public Date getBirthDate() {
        return BirthDate;
    }

    public void setBirthDate(Date BirthDate) {
        this.BirthDate = BirthDate;
    }

    public boolean isGender() {
        return Gender;
    }

    public void setGender(boolean Gender) {
        this.Gender = Gender;
    }

    public int getClassID() {
        return ClassID;
    }

    public void setClassID(int ClassID) {
        this.ClassID = ClassID;
    }
    
    
}
