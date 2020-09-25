package com.assignment.servlets;

import com.assignment.bean.BookBeanI;
import com.assignment.model.Book;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;

import javax.ejb.EJB;
import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;


    @WebServlet("/bookServlet")
    public class BookServlet extends HttpServlet {


        @EJB
        private BookBeanI bookBean;

        @Inject
        private Book book;

        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


            ObjectMapper mapper = new ObjectMapper();
            if (book != null && StringUtils.isNotBlank(book.getAction())
                    && book.getAction().equalsIgnoreCase("load") && book.getBookId() != 0)
                resp.getWriter().print(mapper.writeValueAsString(bookBean.load(book.getBookId())));
            else
                resp.getWriter().print(mapper.writeValueAsString(bookBean.list()));

        }

        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            try {
                BeanUtils.populate(book, request.getParameterMap());
                response.getWriter().print(bookBean.add(book));

            }catch (Exception ex){
                System.out.println(ex.getCause().getMessage());
            }

        }
        protected  void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            try {
                BeanUtils.populate(book, request.getParameterMap());

                response.getWriter().print(bookBean.delete(book.getBookId()));

            }catch (Exception ex){
                System.out.println(ex.getCause().getMessage());
            }

        }
    }



