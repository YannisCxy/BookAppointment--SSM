package com.nnic.service;

import com.nnic.bean.Books;

import java.util.List;

/**
 * @Description com.nnic.service
 * @Author Yannic
 * @Date 2018/9/2
 * @Version 1.0
 */
public interface IBooksService {
    //添加书籍
    boolean addBooks(Books books);
    //修改书籍
    boolean updateBooks(Books books);
    //删除书籍
    boolean deleteBooks(int id);
    //减少相应id的馆藏数量
    boolean reduceNumber(int id);
    //增加相应id的馆藏数量
    boolean increaseNumber(int id);
    //查询所有
    List<Books> selectAll();
    //select by id
    Books selectById(int id);
    //select by name
    List<Books> selectByName(String book_name);
    //select by type
    List<Books> selectByType(String book_type);
    //select by publish
    List<Books> selectByPublish(String book_publish);
}
