package com.nnic.dao;

import com.nnic.bean.User;

import java.util.List;

/**
 * @Description com.nnic.dao
 * @Author Yannic
 * @Date 2018/9/5
 * @Version 1.0
 */
public interface IUserDao {
    //添加用户
    int insertUser(User user);
    //删除用户
    int deleteUser(int id);
    //修改个人信息
    int updateUser(User user);
    //通过id查找用户
    User selectUserById(int id);
    //通过用户名查找用户
    User selectUserByUName(String username);
    //用户名模糊查询
    List<User> selectUserByUsername(String username);
    //查找所有
    List<User> selectUserAll();
    //根据用户名查找对应密码
    User verifyUser(String username);
}
