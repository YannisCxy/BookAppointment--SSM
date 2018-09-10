package com.nnic.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.nnic.bean.Books;
import com.nnic.bean.Orders;
import com.nnic.bean.User;
import com.nnic.service.IBooksService;
import com.nnic.service.IOrdersService;
import com.nnic.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * @Description com.nnic.controller
 * @Author Yannic
 * @Date 2018/9/7
 * @Version 1.0
 */
@Controller
public class OrdersController {
    @Autowired
    @Qualifier("ordersService")
    private IOrdersService ordersService;
    public void setOrdersService(IOrdersService ordersService) {
        this.ordersService = ordersService;
    }
    @Autowired
    @Qualifier("booksService")
    private IBooksService booksService;
    public void setBooksService(IBooksService booksService) {
        this.booksService = booksService;
    }
    @Autowired
    @Qualifier("userService")
    private IUserService userService;
    public void setService(IUserService userService){
        this.userService=userService;
    }

    //预约书籍
    @RequestMapping("appointment.do")
    public String appointment(@RequestParam(value = "id")int id, @RequestParam(value = "username") String username, Model model){
        Orders orders = new Orders();
        //通过取到的书籍id查询到该本书籍的所有信息，存入books中
        Books books = booksService.selectById(id);
        model.addAttribute("books",books);
        //通过取到的用户名查询到该用户的所有信息，存入user中
        User user = userService.verifyUser(username);
        //通过用户名和书籍id检索是否有相对应的预约单且状态为已预约1
        List<Orders> orders1 = ordersService.selectByUNBid(username,id,1);
        //通过用户名和书籍id检索是否有相对应的预约单且状态为已借走2
        List<Orders> orders2 = ordersService.selectByUNBid(username,id,2);
        //且查询这份预约单的状态是否是已归还3
        //不能预约的情况有：1.订单已经存在且没有归还， 2.订单已经存在且没有取消预约0  3. 订单已经存在且状态为已预约1、已借走2
        //能预约的情况为：1.订单不存在  2.订单存在但是已经归还3  3.订单已经存在但是已经取消预约0
        if(orders1!=null&&!orders1.isEmpty()){
            model.addAttribute("msg","预约那么多干嘛一本不够吗！！");
            return "booksInfo.do";
        }
        else if(orders2!=null&&!orders2.isEmpty()){
            model.addAttribute("msg","预约那么多干嘛一本不够吗！！");
            return "booksInfo.do";
        }
        else{
            //如果库存不为0则可以进行预约操作
            if(books.getBook_number()!=0){
                Date date = new Date();
                Calendar calendar = Calendar.getInstance();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                calendar.setTime(date);
                calendar.add(Calendar.DAY_OF_WEEK,calendar.get(Calendar.DAY_OF_WEEK)+3);
                String finishtime = sdf.format(calendar.getTime());
                String starttime = sdf.format(date);
                orders.setFinishtime(finishtime);
                orders.setStarttime(starttime);
                orders.setBook_name(books.getBook_name());
                orders.setBook_id(id);
                orders.setUser_username(username);
                orders.setUser_id(user.getId());
                orders.setStatus(1);
                model.addAttribute("orders",orders);
                if(ordersService.addOrders(orders)){
                    booksService.reduceNumber(id);
                    model.addAttribute("msg","预约成功");
                    return "booksInfo.do";
                }else{
                    return "booksInfo.do";
                }
            }else{
                model.addAttribute("msg","预约失败，库存不足");
                return "booksInfo.do";
            }
        }
    }
    //查询该用户所有订单，根据用户名查询此人所有预约单，不需要区分书籍id
    @RequestMapping("queryOrders.do")
    public String queryOrders(@RequestParam(value = "pn", defaultValue = "1") Integer pn,@RequestParam(value = "username")String username, Model model){
        int pageSize = 5;
        PageHelper.startPage(pn,pageSize);
        List<Orders> orders = ordersService.selectByUName(username);
        if(orders!=null&&orders.size()>0){
            PageInfo pageInfo = new PageInfo(orders,5);
            model.addAttribute("pageInfo",pageInfo);
            return "/user/myOrdersAll.jsp";
        }else{
            model.addAttribute("msg","您还没有预约过哦，快去书库找找书吧");
            return "/exceptionError/queryOrdersError.jsp";
        }
    }
    //查询用户预约成功的单，已预约但还未借出1或者已借出的预约单2或者已经归还的单3或者取消预约的单0
    @RequestMapping("queryByStatus.do")
    public String queryByStatus(@RequestParam(value = "pn", defaultValue = "1") Integer pn,@RequestParam(value = "username")String username,
                                @RequestParam(value = "status")int status, Model model){
        int pageSize = 5;
        PageHelper.startPage(pn,pageSize);
        List<Orders> orders = ordersService.selectByUserAStatus(status, username);
        if(orders!=null&&orders.size()!=0){
            PageInfo pageInfo = new PageInfo(orders,5);
            model.addAttribute("nowstatus",status);
            model.addAttribute("pageInfo",pageInfo);
            return "/user/myOrdersByQuery.jsp";
        }
        else{
            model.addAttribute("msg","您还没有预约过哦，快去书库找找书吧");
            return "/exceptionError/queryOrdersError.jsp";
        }
    }
    //用户取消预约，将对应的预约单状态改为0
    @RequestMapping("cancelAppoint.do")
    public String cancelAppoint(@RequestParam(value = "id")int id, Model model){
        Orders orders = ordersService.selectOrdersById(id);
        orders.setStatus(0);
        if(ordersService.updateOrders(orders)){
            booksService.increaseNumber(orders.getBook_id());
            return "queryByStatus.do";
        }else{
            model.addAttribute("msg","取消预约失败，请重新操作");
            return "/user/myOrdersByQuery.jsp";
        }
    }
}
