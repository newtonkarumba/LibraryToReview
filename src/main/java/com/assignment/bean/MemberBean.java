package com.assignment.bean;

import java.util.List;
import com.assignment.model.Student;
import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.ArrayList;


@Stateless
@Remote
public class MemberBean implements MemberBeanI {

    @PersistenceContext
    private EntityManager em;

    public String add(Student student) throws Exception {
        if (student == null ||student.getName() == null)
            throw new Exception("Invalid member details!!");

        em.merge(student);

        return "OK";
    }



    public Student load(int studentId){
        return em.find(Student.class, studentId);
    }

    public String delete(int studentId) throws Exception{
        if (studentId == 0)
            throw new Exception("Invalid member details!!");

        em.remove(em.find(Student.class, studentId));

        return "OK";
    }

    @Override

    public List<Student> list() {
        List<Student> students = new ArrayList<Student>();

        return em.createQuery("FROM Student s").getResultList();
    }
}