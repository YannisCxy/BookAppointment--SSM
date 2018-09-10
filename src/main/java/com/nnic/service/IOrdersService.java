package com.nnic.service;

import com.nnic.bean.Orders;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * @Description com.nnic.service
 * @Author Yannic
 * @Date 2018/9/5
 * @Version 1.0
 */
public interface IOrdersService {
    //添加订单
    boolean addOrders(Orders orders);
    //删除订单
    boolean deleteOrders(int id);
    //修改订单信息
    boolean updateOrders(Orders orders);
    Orders selectOrdersById(int id);
    //查询所有预约单
    List<Orders> selectAll();
    //通过用户名id查找预约单
    List<Orders> selectByUId(int user_id);
    //通过用户名查找预约单
    List<Orders> selectByUName(String user_username);
    //通过书籍id查找预约单
    List<Orders> selectByBId(int book_id);
    //通过预约时间查找预约单
    List<Orders> selectBySTime(Date starttime);
    //通过状态查找预约单
    List<Orders> selectByStatus(int status);
    //通过某用户的某单状态查找预约单
    List<Orders> selectByUserAStatus(@Param("status")int status, @Param("user_username")String user_username);
    //通过book_id和用户名来查询订单，防止重复预约
    List<Orders> selectByUNBid(@Param("user_username")String user_username, @Param("book_id")int book_id, @Param("status")int status);
}
