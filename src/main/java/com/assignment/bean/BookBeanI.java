package com.assignment.bean;

import com.assignment.model.Book;
import java.util.List;

public interface BookBeanI {
    String add(Book book)throws Exception;

    Book load(int bookId);

    String delete(int bookId) throws Exception;

    List<Book> list();
}
