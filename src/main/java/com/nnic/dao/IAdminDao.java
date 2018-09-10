package com.nnic.dao;

import com.nnic.bean.Admin;

import java.util.List;

/**
 * @Description com.nnic.dao
 * @Author Yannic
 * @Date 2018/8/22
 * @Version 1.0
 */
public interface IAdminDao {
    //增加
    int insertAdmin(Admin admin);
    //删除
    int deleteAdmin(int id);
    //修改
    int modifyAdmin(Admin admin);
    //通过id查找管理员账号
    Admin selectAdminById(int id);
    //查询所有
    List<Admin> selectAdminAll();
    //模糊查询
    List<Admin> selectAdminByAcName(String accountname);

}
