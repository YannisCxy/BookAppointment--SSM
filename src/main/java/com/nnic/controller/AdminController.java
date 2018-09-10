package com.nnic.controller;

import com.nnic.bean.Admin;
import com.nnic.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Description com.nnic.controller
 * @Author Yannic
 * @Date 2018/8/30
 * @Version 1.0
 */
@Controller
public class AdminController {
    @Autowired
    @Qualifier("adminService")
    private IAdminService service;
    public void setService(IAdminService service){
        this.service=service;
    }
    @RequestMapping("/login.do")
    public String doTest(Admin admin){
        if(service.addAdmin(admin)){
            return "/index.jsp";
        }
        else{
            return "/admin/adminlogin.jsp";
        }
    }
}
