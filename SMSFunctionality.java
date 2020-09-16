/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.smssystm.func;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author REHOBOTH
 */
public class SMSFunctionality {
    private final String URL = "jdbc:derby://localhost:1527/ASMSSystem";
    private final String USERNAME = "Akashi";
    private final String PASSWORD = "Akashi";
    
    public Connection getConnection() throws SQLException, ClassNotFoundException{
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
    }
    
    public int getNewCourseID() throws SQLException, ClassNotFoundException{
        
        String sql = "SELECT * FROM COURSE";
        
        Statement stmt = getConnection().createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = stmt.executeQuery(sql);
        
        int id = 0;
        while(rs.next()){
            id++;
        }
        
        int new_id = id + 1;
        
        return new_id;
        
    }
    
    public boolean courseExists(String course_name) throws SQLException, ClassNotFoundException{
        
        String sql = "SELECT * FROM COURSE WHERE COURSENAME = ?";
        
        PreparedStatement stmt = getConnection().prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        stmt.setString(1, course_name);
        ResultSet rs = stmt.executeQuery();
        
        int course_check = 0;
        
        while(rs.next()){
            course_check++;
        }
        
        boolean check = false;
        
        if(course_check == 1){
            check = true;
        }else{
            check = false;
        }
        
        return check;
    }
    
    public boolean addCourse(String course_name) throws SQLException, ClassNotFoundException{
        
        int course_id = getNewCourseID();
        
        String sql = "INSERT INTO COURSE(COURSEID, COURSENAME) VALUES (?, ?)";
        
        PreparedStatement stmt = getConnection().prepareStatement(sql);
        stmt.setInt(1, course_id);
        stmt.setString(2, course_name);
        
        boolean executedSuccessfully = stmt.execute();
        
        return executedSuccessfully;
        
    }
    
    public ResultSet getCourses() throws SQLException, ClassNotFoundException{
        
        String sql = "SELECT * FROM COURSE";
        
        Statement stmt= getConnection().createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = stmt.executeQuery(sql);
        
        return rs;
        
    }
    
    public boolean updateCourse(int course_id, String course_name) throws SQLException, ClassNotFoundException{
        String sql = "UPDATE COURSE SET COURSENAME = ? WHERE COURSEID = ?";
        
        PreparedStatement stmt= getConnection().prepareStatement(sql);
        stmt.setString(1, course_name);
        stmt.setInt(2, course_id);
        
        boolean updateSuccessfully = stmt.execute();
        
        return updateSuccessfully;
    }
    
    public boolean deleteCourse(int course_id) throws SQLException, ClassNotFoundException{
        String sql = "DELETE FROM COURSE WHERE COURSEID = ?";
        
        PreparedStatement stmt = getConnection().prepareStatement(sql);
        stmt.setInt(1, course_id);
        
        boolean deletedSuccessfully = stmt.execute();
        
        return deletedSuccessfully;
    }
    
    public int getNewStudentID() throws SQLException, ClassNotFoundException{
        
        String sql = "SELECT * FROM STUDENTS";
        
        Statement stmt = getConnection().createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = stmt.executeQuery(sql);
        
        int id = 0;
        while(rs.next()){
            id++;
        }
        
        int new_id = id + 1;
        
        return new_id;
        
    }
    
    public boolean addStudent(String first_name, String last_name, String email, int age, int course, 
            String gender, String address) throws SQLException, ClassNotFoundException{
        
        int student_id = getNewStudentID();
        
        String sql = "INSERT INTO STUDENTS(STUDENTID, FIRSTNAME, LASTNAME, EMAIL, AGE, COURSE, GENDER, ADDRESS) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        
        PreparedStatement stmt = getConnection().prepareStatement(sql);
        stmt.setInt(1, student_id);
        stmt.setString(2, first_name);
        stmt.setString(3, last_name);
        stmt.setString(4, email);
        stmt.setInt(5, age);
        stmt.setInt(6, course);
        stmt.setString(7, gender);
        stmt.setString(8, address);
        
        boolean executedSuccessfully = stmt.execute();
        
        return executedSuccessfully;
        
    }
    
    public boolean updateStudent(String first_name, String last_name, String email, int age, int course, 
            String gender, String address, int student_id) throws SQLException, ClassNotFoundException{
        
        String sql = "UPDATE STUDENTS SET FIRSTNAME = ?, LASTNAME = ?, EMAIL = ?, AGE = ?, COURSE = ?, GENDER = ?, "
                + "ADDRESS = ? WHERE STUDENTID = ?";
        
        PreparedStatement stmt= getConnection().prepareStatement(sql);
        stmt.setString(1, first_name);
        stmt.setString(2, last_name);
        stmt.setString(3, email);
        stmt.setInt(4, age);
        stmt.setInt(5, course);
        stmt.setString(6, gender);
        stmt.setString(7, address);
        stmt.setInt(8, student_id);
        
        boolean updateSuccessfully = stmt.execute();
        
        return updateSuccessfully;
    }
    
    public boolean deleteStudent(int student_id) throws SQLException, ClassNotFoundException{
        String sql = "DELETE FROM STUDENTS WHERE STUDENTID = ?";
        
        PreparedStatement stmt = getConnection().prepareStatement(sql);
        stmt.setInt(1, student_id);
        
        boolean deletedSuccessfully = stmt.execute();
        
        return deletedSuccessfully;
    }
    
    public ResultSet getStudents() throws SQLException, ClassNotFoundException{
        String sql = "SELECT * FROM STUDENTS";
        
        Statement stmt= getConnection().createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = stmt.executeQuery(sql);
        
        return rs;
    }
    
    public String getCourseName(int course_id) throws SQLException, ClassNotFoundException{
        String sql = "SELECT * FROM COURSE WHERE COURSEID = ?";
        
        PreparedStatement stmt = getConnection().prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        stmt.setInt(1, course_id);
        
        ResultSet rs = stmt.executeQuery();
        
        rs.last();
        
        String course_name = rs.getString("COURSENAME");
        
        if(rs != null){
            rs.close();
        }
        
        return course_name;
    }
    
    public ResultSet getCourseDetails(int course_id) throws SQLException, ClassNotFoundException{
        String sql = "SELECT * FROM COURSE WHERE COURSEID = ?";
        
        PreparedStatement stmt = getConnection().prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        stmt.setInt(1, course_id);
        
        ResultSet rs = stmt.executeQuery();
        
        rs.last();
        
        return rs;
    }
    
    public ResultSet getStudentDetails(int student_id) throws SQLException, ClassNotFoundException{
        String sql = "SELECT * FROM STUDENTS WHERE STUDENTID = ?";
        
        PreparedStatement stmt = getConnection().prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        stmt.setInt(1, student_id);
        
        ResultSet rs = stmt.executeQuery();
        
        rs.last();
        
        return rs;
    }
}
