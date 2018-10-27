package pers.lan.mi.dao;

import java.util.List;

import pers.lan.mi.bean.Order;
import pers.lan.mi.bean.OrderItem;

public interface orderDao {

	void add(Order order) throws Exception;

	void addItem(OrderItem oi) throws Exception;
	
	List<Order> findAllByPage(int currPage, int pageSize, String uid) throws Exception;

	int getTotalCount(String uid) throws Exception;

	Order getById(String oid) throws Exception;

	void update(Order order) throws Exception;
	
	List<Order> findAllByState(String state) throws Exception;
	
	void delete(String oid) throws Exception;
}
