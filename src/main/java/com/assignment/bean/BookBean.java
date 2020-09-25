package com.assignment.bean;

import com.assignment.model.Book;
import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.ArrayList;
import java.util.List;


@Stateless
@Remote

public class BookBean implements BookBeanI {

    @PersistenceContext
    private EntityManager em;


    public String add(Book book) throws Exception{
        if (book == null || book.getName() == null)
            throw new Exception("Invalid book details!!");

        em.merge(book);

        return "OK";
    }

    public Book load(int bookId){
        return em.find(Book.class, bookId);
    }


    public String delete(int bookId) throws Exception{
        if (bookId == 0)
            throw new Exception("Invalid book details!!");

        em.remove(em.find(Book.class, bookId));

        return "OK";
    }


    public List<Book> list() {
        List<Book> books = new ArrayList<Book>();

        return em.createQuery("FROM Book b").getResultList();
    }
}

