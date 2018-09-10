package com.nnic.service.impl;

import com.nnic.bean.User;
import com.nnic.dao.IUserDao;
import com.nnic.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description com.nnic.service.impl
 * @Author Yannic
 * @Date 2018/9/5
 * @Version 1.0
 */
@Service("userService")
public class UserServiceImpl implements IUserService {
    @Autowired
    @Qualifier("IUserDao")
    private IUserDao userDao;
    public IUserDao getUserDao(){
        return userDao;
    }
    public void setUserDao(IUserDao userDao){
        this.userDao=userDao;
    }
    @Override
    public boolean addUser(User user) {
        if(userDao.insertUser(user)>0){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public boolean deleteUser(int id) {
        if(userDao.deleteUser(id)>0){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public boolean updateUser(User user) {
        if(userDao.updateUser(user)>0){
            return true;
        }else {
            return false;
        }
    }
    //by id
    @Override
    public User selectById(int id) {
        User user = userDao.selectUserById(id);
        if(user!=null){
            return user;
        }else {
            return null;
        }
    }
    //模糊查询用户名
    @Override
    public List<User> selectByUsername(String username) {
        List<User> users = userDao.selectUserByUsername(username);
        if(users.size()>0){
            return users;
        }else{
            return null;
        }
    }

    //by 确切的username
    @Override
    public User selectByUName(String username) {
        User user = userDao.selectUserByUName(username);
        if(user!=null){
            return user;
        }else {
            return null;
        }
    }
    //select all
    @Override
    public List<User> selectAll() {
        List<User> user = userDao.selectUserAll();
        if(user.size()>0){
            return user;
        }else {
            return null;
        }
    }

    @Override
    public User verifyUser(String username) {
        User user = userDao.verifyUser(username);
        String password = user.getPassword();
        if(password!=null){
            return user;
        }else{
            return null;
        }
    }
}
