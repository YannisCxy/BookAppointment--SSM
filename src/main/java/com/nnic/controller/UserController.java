package com.nnic.controller;

import com.nnic.bean.User;
import com.nnic.service.IUserService;
import org.apache.ibatis.annotations.Param;
import org.apache.tools.ant.taskdefs.condition.Http;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

/**
 * @Description com.nnic.controller
 * @Author Yannic
 * @Date 2018/9/6
 * @Version 1.0
 */
@Controller
public class UserController {
    @Autowired
    @Qualifier("userService")
    private IUserService userService;
    public void setService(IUserService userService){
        this.userService=userService;
    }

    //用户注册
    @RequestMapping("/jumptoregister.do")
    public String jumpToRegister(){
        return "/user/userregister.jsp";
    }
    @RequestMapping(value = "addUser.do", method = RequestMethod.POST)
    public String addUser(User user, Model model){
        if(userService.selectByUName(user.getUsername())!=null){
            model.addAttribute("msg", "用户名已被占用");
            return "/user/userregister.jsp";
        }else{
            if(userService.addUser(user)){
                return "redirect:index.jsp";
            }
            else{
                return "/user/userregister.jsp";
            }
        }
    }
    //用户登录，登陆验证密码账号
    @RequestMapping("jumptouserlogin.do")
    public String jumptouserlogin(){
        return "userlogin.jsp";
    }
    @RequestMapping(value = "verifyUser.do", method = RequestMethod.POST)
    public String verifyUser(@Param("username")String username, @Param("password")String password, HttpServletRequest request, Model model){
        HttpSession session = request.getSession();
        int count = 0;
        session.setAttribute("username",username);
        session.setAttribute("password",password);
        if(username==null||username.equals("")){
            model.addAttribute("msg","用户名不能为空");
            return "userlogin.jsp";
        }else if(password==null||password.equals("")){
            model.addAttribute("msg","密码不能为空");
            return "userlogin.jsp";
        }
        User user = userService.verifyUser(username);
        String user_password = user.getPassword();
        if(user_password.equals(password)){
            count = 1;
            session.setAttribute("user",user);
            model.addAttribute("msg",username);
            model.addAttribute("user", user);
            return "redirect:index.jsp";
        }else{
            model.addAttribute("msg","用户名或密码错误");
            return "userlogin.jsp";
        }
    }
    //返回主界面
    @RequestMapping("returnIndex.do")
    public String returnIndex(){
        return "/index.jsp";
    }
    //用户个人中心
    @RequestMapping("userInfo.do")
    public String userInfo(String username, Model model){
        User user = userService.selectByUName(username);
        model.addAttribute("user",user);
        return "/user/userInfo.jsp";
    }
    //跳转到修改个人信息页面
    @RequestMapping("jumpToUpdateUser.do")
    public String dojump(){
        return "/user/userInfoUpdate.jsp";
    }
    //修改个人信息
    @RequestMapping("userInfoUpdate.do")
    public String doUpdateUser(User user, Model model){
        if(userService.updateUser(user)){
            model.addAttribute(user);
            return "userInfo.do";
        }else{
            model.addAttribute("msg","修改失败啦，再试一试？");
            return "userInfoUpdate.do";
        }
    }
    //退出登录
    @RequestMapping("outlogin.do")
    public String outLogin(HttpSession session){
        session.invalidate();
        return "redirect:userlogin.jsp";
    }

}
