package com.nnic.service.impl;

import com.nnic.bean.Books;
import com.nnic.dao.IBooksDao;
import com.nnic.service.IBooksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description com.nnic.service.impl
 * @Author Yannic
 * @Date 2018/9/2
 * @Version 1.0
 */
@Service("booksService")
public class BooksServiceImpl implements IBooksService {
    @Autowired
    @Qualifier("IBooksDao")
    private IBooksDao booksDao;
    public IBooksDao getBooksDao(){
        return booksDao;
    }
    public void setBooksDao(IBooksDao booksDao){
        this.booksDao=booksDao;
    }
    //添加书籍
    @Override
    public boolean addBooks(Books books) {
        if(booksDao.insertBooks(books)>0){
            return true;
        }
        else{
            return false;
        }
    }
    //修改书籍
    @Override
    public boolean updateBooks(Books books) {
        if(booksDao.updateBooks(books)>0){
            return true;
        }
        else{
            return false;
        }
    }
    //删除书籍
    @Override
    public boolean deleteBooks(int id) {
        if(booksDao.deleteBooks(id)>0){
            return true;
        }
        else{
            return false;
        }
    }

    @Override
    public boolean reduceNumber(int id) {
        if(booksDao.reduceBooksNum(id)>0){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public boolean increaseNumber(int id) {
        if(booksDao.increaseBooksNum(id)>0){
            return true;
        }else{
            return false;
        }
    }


    //查询所有
    @Override
    public List<Books> selectAll() {
        List<Books> books = booksDao.selectBooksAll();
        if(books.size()>0){
            return books;
        }else{
            return null;
        }
    }

    @Override
    public Books selectById(int id) {
        Books books = booksDao.selectBooksById(id);
        if(books!=null){
            return books;
        }else{
            return null;
        }
    }

    @Override
    public List<Books> selectByName(String book_name) {
        List<Books> books = booksDao.selectBooksByName(book_name);
        if(books.size()>0){
            return books;
        }else{
            return null;
        }
    }

    @Override
    public List<Books> selectByType(String book_type) {
        List<Books> books = booksDao.selectBooksByType(book_type);
        if(books.size()>0){
            return books;
        }else{
            return null;
        }
    }

    @Override
    public List<Books> selectByPublish(String book_publish) {
        List<Books> books = booksDao.selectBooksByPublish(book_publish);
        if(books.size()>0){
            return books;
        }else{
            return null;
        }
    }
}
