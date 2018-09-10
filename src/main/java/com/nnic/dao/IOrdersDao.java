package com.nnic.dao;

import com.nnic.bean.Orders;
import net.sf.jsqlparser.expression.operators.conditional.OrExpression;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * @Description com.nnic.dao
 * @Author Yannic
 * @Date 2018/9/5
 * @Version 1.0
 */
public interface IOrdersDao {
    //添加预约单
    int insertOrders(Orders orders);
    //删除预约单
    int deleteOrders(int id);
    //修改预约单信息
    int updateOrders(Orders orders);
    //通过id查找预约单
    Orders selectOrdersById(int id);
    //查询所有预约单
    List<Orders> selectOrdersAll();
    //通过用户名id查找预约单
    List<Orders> selectOrdersByUId(int user_id);
    //通过用户名id查找预约单
    List<Orders> selectOrdersByUName(String user_username);
    //通过书籍id查找预约单
    List<Orders> selectOrdersByBId(int book_id);
    //通过预约时间查找预约单
    List<Orders> selectOBySTime(Date starttime);
    //通过状态查找预约单
    List<Orders> selectOByStatus(int status);
    //通过某用户的某单状态查找预约单
    List<Orders> selectOByUserAStatus(@Param("status") int status,@Param("user_username") String user_username);
    //通过book_id和用户名来查询订单，防止重复预约
    List<Orders> selectOByUNBid(@Param("user_username")String user_username, @Param("book_id")int book_id, @Param("status")int status);
}
