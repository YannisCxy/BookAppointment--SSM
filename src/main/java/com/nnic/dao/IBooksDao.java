package com.nnic.dao;

import com.nnic.bean.Books;
import org.apache.commons.fileupload.util.LimitedInputStream;

import java.util.List;

/**
 * @Description com.nnic.dao
 * @Author Yannic
 * @Date 2018/9/2
 * @Version 1.0
 */
public interface IBooksDao {
    //添加书籍
    int insertBooks(Books books);
    //删除书籍
    int deleteBooks(int id);
    //修改书籍
    int updateBooks(Books books);
    //书籍被预约，减少相应馆藏数量
    int reduceBooksNum(int id);
    //取消预约或归还都要增加数量
    int increaseBooksNum(int id);
    //查询：根据书籍id
    Books selectBooksById(int id);
    //查询：根据书籍名字
    List<Books> selectBooksByName(String book_name);
    //查询：根据书籍类别查找
    List<Books> selectBooksByType(String book_type);
    //查询：根据书籍出版社查找
    List<Books> selectBooksByPublish(String book_publish);
    //查询所有
    List<Books> selectBooksAll();
}
