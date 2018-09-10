package com.nnic.service.impl;

import com.nnic.bean.Admin;
import com.nnic.dao.IAdminDao;
import com.nnic.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description com.nnic.service.impl
 * @Author Yannic
 * @Date 2018/8/29
 * @Version 1.0
 */
@Service("adminService")
public class AdminServiceImpl implements IAdminService {
    @Autowired
    @Qualifier("IAdminDao")
    private IAdminDao adminDao;

    public IAdminDao getAdminDao(){
        return adminDao;
    }
    public void setAdminDao(IAdminDao adminDao){
        this.adminDao=adminDao;
    }
    @Override
    public boolean addAdmin(Admin admin){
        if(adminDao.insertAdmin(admin)>0){
            return true;
        }
        else{
            return false;
        }
    }

    @Override
    public boolean deleteAdmin(int id) {
        if(adminDao.deleteAdmin(id)>0){
            return true;
        }
        else{
            return false;
        }
    }

    @Override
    public boolean updateAdmin(Admin admin) {
        if(adminDao.modifyAdmin(admin)>0){
            return true;
        }
        else{
            return false;
        }
    }

    @Override
    public Admin selectById(int id) {
        Admin admin = adminDao.selectAdminById(id);
        if(admin!=null){
            return admin;
        }else {
            return null;
        }
    }

    @Override
    public List<Admin> selectByAName(String accountname) {
        List<Admin> admin = adminDao.selectAdminByAcName(accountname);
        if(admin!=null){
            return admin;
        }else {
            return null;
        }
    }

    @Override
    public List<Admin> selectAll() {
        List<Admin> admin = adminDao.selectAdminAll();
        if(admin!=null){
            return admin;
        }else {
            return null;
        }
    }
}
