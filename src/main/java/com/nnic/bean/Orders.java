package com.nnic.bean;

import java.util.Date;

/**
 * @Description com.nnic.bean
 * @Author Yannic
 * @Date 2018/8/22
 * @Version 1.0
 */
public class Orders {
    private Integer id;
    private int user_id;
    private String user_username;
    private int book_id;
    private String book_name;
    private String starttime;
    private String finishtime;
    private int status;

    public Orders() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUser_username() {
        return user_username;
    }

    public void setUser_username(String user_username) {
        this.user_username = user_username;
    }

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public String getBook_name() {
        return book_name;
    }

    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }

    public String getStarttime() {
        return starttime;
    }

    public void setStarttime(String starttime) {
        this.starttime = starttime;
    }

    public String getFinishtime() {
        return finishtime;
    }

    public void setFinishtime(String finishtime) {
        this.finishtime = finishtime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Orders(int user_id, String user_username, int book_id, String book_name, String starttime, String finishtime, int status) {
        this.user_id = user_id;
        this.user_username = user_username;
        this.book_id = book_id;
        this.book_name = book_name;
        this.starttime = starttime;
        this.finishtime = finishtime;
        this.status = status;
    }
}
