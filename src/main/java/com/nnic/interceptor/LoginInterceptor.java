package com.nnic.interceptor;

import com.nnic.bean.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.SessionCookieConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @Description com.nnic.interceptor
 * @Author Yannic
 * @Date 2018/9/6
 * @Version 1.0
 */
public class LoginInterceptor implements HandlerInterceptor {
    int count = 0;
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws ServletException, IOException {
        //获得请求的URL,缺少一个管理员的登陆、验证以及拦截操作
        String url = httpServletRequest.getRequestURI();
        if(url.contains("/verifyUser.do")||url.contains("/addUser.do")||url.contains("/queryBooks.do")||url.contains("/listBooks.do")||url.contains("/booksInfo.do")
                ||url.contains("/returnIndex.do")||url.contains("/jumptoregister.do")){
            return true;
        }
        HttpSession session = httpServletRequest.getSession();
        if(session.getAttribute("user")!=null){
            count=1;
            User user = (User) session.getAttribute("user");
            if(user!=null){
                count=1;
                return true;
            }
            //session中没有登陆的user则提示并转发到页面
            httpServletRequest.setAttribute("msg","还没有登录？请登录");
            httpServletRequest.getRequestDispatcher("/userlogin.jsp").forward(httpServletRequest,httpServletResponse);
            return false;
        }
        User user = (User) session.getAttribute("user");
        if(user!=null){
            count=1;
            return true;
        }
        httpServletRequest.setAttribute("msg","还没有登录？请登录");
        httpServletRequest.getRequestDispatcher("/userlogin.jsp").forward(httpServletRequest,httpServletResponse);
        return false;
    }
    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
