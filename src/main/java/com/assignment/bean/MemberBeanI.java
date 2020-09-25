package com.assignment.bean;

import com.assignment.model.Student;

import java.util.List;


public interface MemberBeanI {

    String add(Student student)throws Exception;

    Student load(int studentId);

    String delete(int studentId) throws Exception;

    List<Student> list();
}
