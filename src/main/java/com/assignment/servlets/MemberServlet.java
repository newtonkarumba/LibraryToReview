package com.assignment.servlets;

import com.assignment.bean.MemberBeanI;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.assignment.model.Student;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;
import javax.ejb.EJB;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;



@WebServlet("/memberServlet")

public class MemberServlet extends HttpServlet {


    @EJB
    private MemberBeanI memberBean;

    @Inject
    private Student student;

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        ObjectMapper mapper = new ObjectMapper();
        if (student != null && StringUtils.isNotBlank(student.getAction())
                && student.getAction().equalsIgnoreCase("load") && student.getMid() != 0)
            resp.getWriter().print(mapper.writeValueAsString(memberBean.load(student.getMid())));
        else
            resp.getWriter().print(mapper.writeValueAsString(memberBean.list()));

    }

    protected  void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            BeanUtils.populate(student, request.getParameterMap());
            response.getWriter().print(memberBean.add(student));

        }catch (Exception ex){
            System.out.println(ex.getCause().getMessage());
        }

    }

    protected  void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            BeanUtils.populate(student, request.getParameterMap());

            response.getWriter().print(memberBean.delete(student.getMid()));

        }catch (Exception ex){
            System.out.println(ex.getCause().getMessage());
        }

    }

}
