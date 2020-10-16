/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  REHOBOTH
 * Created: Feb 27, 2020
 */

CREATE TABLE COURSE(
    COURSEID int primary key,
    COURSENAME varchar(200)
);

CREATE TABLE STUDENTS(
    STUDENTID int primary key,
    FIRSTNAME varchar(200),
    LASTNAME varchar(200),
    EMAIL varchar(200),
    AGE int,
    COURSE int,
    GENDER varchar(200),
    ADDRESS varchar(200)
);

