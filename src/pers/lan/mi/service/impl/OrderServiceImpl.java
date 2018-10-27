package pers.lan.mi.service.impl;

import java.util.List;


import pers.lan.mi.bean.Order;
import pers.lan.mi.bean.OrderItem;
import pers.lan.mi.bean.Page;
import pers.lan.mi.bean.User;
import pers.lan.mi.dao.orderDao;
import pers.lan.mi.dao.impl.OrderDaoImpl;
import pers.lan.mi.service.OrderService;
import pers.lan.mi.utils.DataSourceUtils;

public class OrderServiceImpl implements OrderService{

	@Override
	public void add(Order order) throws Exception{
		try {
			//1.开启事务
			DataSourceUtils.startTransaction();

			orderDao od=new OrderDaoImpl();
			//2.向orders表中添加一个数据
			od.add(order);
			
			//3.向orderitem中添加n条数据
			for (OrderItem oi : order.getItems()) {
				od.addItem(oi);
			}
			
			//4.事务处理
			DataSourceUtils.commitAndClose();
		} catch (Exception e) {
			e.printStackTrace();
			DataSourceUtils.rollbackAndClose();
			throw e;
		}
		
	}
	
	 //分页查询订单
	 
	@Override
	public Page<Order> findAllByPage(int currPage, int pageSize, User user) throws Exception {
		orderDao od=new OrderDaoImpl();
		
		// 查询当前页数据
		List<Order> list=od.findAllByPage(currPage,pageSize,user.getUid());
		
		// 查询总条数
		int totalCount=od.getTotalCount(user.getUid());
		return new Page<>(list, currPage, pageSize, totalCount);
	}

	
	 //查看订单详情
	
	@Override
	public Order getById(String oid) throws Exception {
		orderDao od=new OrderDaoImpl();
		return od.getById(oid);
	}
	
	//更新订单状态
	@Override
	public void update(Order order) throws Exception {
		orderDao od=new OrderDaoImpl();
		od.update(order);
	}
	
	
	 //根据状态查询订单
	
	@Override
	public List<Order> findAllByState(String state) throws Exception {
		orderDao od=new OrderDaoImpl();
		return od.findAllByState(state);
	}
	
	//删除订单
	
	public void delete(String oid) throws Exception{
		orderDao od=new OrderDaoImpl();
		od.delete(oid);
	}

}
