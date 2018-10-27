package pers.lan.mi.service;

import java.util.List;

import pers.lan.mi.bean.Order;
import pers.lan.mi.bean.Page;
import pers.lan.mi.bean.User;

public interface OrderService {

	void add(Order order) throws Exception;
	
	Page<Order> findAllByPage (int currPage,int pageSize,User user) throws Exception;

	Order getById(String oid) throws Exception;

	void update(Order order) throws Exception;
	
	List<Order> findAllByState(String state) throws Exception;
	
	void delete(String oid) throws Exception;
}
