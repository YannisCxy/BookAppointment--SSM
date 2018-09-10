package com.nnic.service;

import com.nnic.bean.User;

import java.util.List;
import java.util.ListResourceBundle;

/**
 * @Description com.nnic.service
 * @Author Yannic
 * @Date 2018/9/5
 * @Version 1.0
 */
public interface IUserService {
    //添加用户
    boolean addUser(User user);
    //删除用户
    boolean deleteUser(int id);
    //修改个人信息
    boolean updateUser(User user);
    //通过id查找用户
    User selectById(int id);
    //用户名模糊查询
    List<User> selectByUsername(String username);
    //通过用户名查找用户
    User selectByUName(String username);
    //查找所有
    List<User> selectAll();
    //根据用户名查找对应密码
    User verifyUser(String username);
}
