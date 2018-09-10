package com.nnic.service;

import com.nnic.bean.Admin;

import java.util.List;

/**
 * @Description com.nnic.service
 * @Author Yannic
 * @Date 2018/8/29
 * @Version 1.0
 */
public interface IAdminService {
    //添加管理员
    boolean addAdmin(Admin admin);
    //删除用户
    boolean deleteAdmin(int id);
    //修改个人信息
    boolean updateAdmin(Admin admin);
    //通过id查找用户
    Admin selectById(int id);
    //通过用户名查找用户
    List<Admin> selectByAName(String accountname);
    //查找所有
    List<Admin> selectAll();
}
