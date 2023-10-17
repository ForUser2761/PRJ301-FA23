/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.EmployeeDAO;
import dal.EmployeeSkillDAO;
import dal.SkillDAO;
import entity.Employee;
import entity.Employee_Skill;
import entity.Skill;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class InsertServlet extends HttpServlet {
    SkillDAO skDAO = new SkillDAO();
    EmployeeDAO empDAO = new EmployeeDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setAttribute("listSkills", skDAO.findAll());
        request.getRequestDispatcher("display.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //get information
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        boolean gender = request.getParameter("gender").equalsIgnoreCase("Male");
        Date dob = Date.valueOf(request.getParameter("dob"));
        String[] skills = request.getParameterValues("skill");
        
        //insert employee
        empDAO.insert(new Employee(id, name, dob, gender));
        //insert employee_skill
        for (String skill : skills) {
            int idSkill = Integer.parseInt(skill);
            Employee_Skill emp = new Employee_Skill(id, idSkill);
            new EmployeeSkillDAO().insert(emp);
        }
        
    }
}
