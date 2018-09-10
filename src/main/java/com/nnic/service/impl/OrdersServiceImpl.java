package com.nnic.service.impl;

import com.nnic.bean.Orders;
import com.nnic.dao.IOrdersDao;
import com.nnic.service.IOrdersService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @Description com.nnic.service.impl
 * @Author Yannic
 * @Date 2018/9/5
 * @Version 1.0
 */
@Service("ordersService")
public class OrdersServiceImpl implements IOrdersService {
    @Autowired
    @Qualifier("IOrdersDao")
    private IOrdersDao ordersDao;

    public IOrdersDao getAdminDao(){
        return ordersDao;
    }
    public void setAdminDao(IOrdersDao ordersDao){
        this.ordersDao=ordersDao;
    }
    @Override
    public boolean addOrders(Orders orders) {
        if(ordersDao.insertOrders(orders)>0){
            return true;
        }
        else{
            return false;
        }
    }

    @Override
    public boolean deleteOrders(int id) {
        if(ordersDao.deleteOrders(id)>0){
            return true;
        }
        else{
            return false;
        }
    }

    @Override
    public boolean updateOrders(Orders orders) {
        if(ordersDao.updateOrders(orders)>0){
            return true;
        }
        else{
            return false;
        }
    }

    @Override
    public Orders selectOrdersById(int id) {
        Orders orders = ordersDao.selectOrdersById(id);
        if(orders!=null){
            return orders;
        }else{
            return null;
        }
    }

    @Override
    public List<Orders> selectAll() {
        List<Orders> orders = ordersDao.selectOrdersAll();
        if(orders.size()>0){
            return orders;
        }else{
            return null;
        }
    }

    @Override
    public List<Orders> selectByUId(int user_id) {
        List<Orders> orders = ordersDao.selectOrdersByUId(user_id);
        if(orders.size()>0){
            return orders;
        }else{
            return null;
        }
    }

    @Override
    public List<Orders> selectByUName(String user_username) {
        List<Orders> orders = ordersDao.selectOrdersByUName(user_username);
        if(orders.size()>0){
            return orders;
        }else{
            return null;
        }
    }

    @Override
    public List<Orders> selectByBId(int book_id) {
        List<Orders> orders = ordersDao.selectOrdersByBId(book_id);
        if(orders.size()>0){
            return orders;
        }else{
            return null;
        }
    }

    @Override
    public List<Orders> selectBySTime(Date starttime) {
        List<Orders> orders = ordersDao.selectOBySTime(starttime);
        if(orders.size()>0){
            return orders;
        }else{
            return null;
        }
    }

    @Override
    public List<Orders> selectByStatus(int status) {
        List<Orders> orders = ordersDao.selectOByStatus(status);
        if(orders.size()>0){
            return orders;
        }else{
            return null;
        }
    }

    @Override
    public List<Orders> selectByUserAStatus(@Param("status") int status, @Param("user_username") String user_username) {
        List<Orders> orders = ordersDao.selectOByUserAStatus(status,user_username);
        if(orders.size()>0){
            return orders;
        }else{
            return null;
        }
    }

    @Override
    public List<Orders> selectByUNBid(@Param("user_username") String user_username,@Param("book_id") int book_id, @Param("status")int status) {
        List<Orders> orders = ordersDao.selectOByUNBid(user_username,book_id,status);
        if(orders.size()>0){
            return orders;
        }else{
            return null;
        }
    }
}
