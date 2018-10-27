package pers.lan.mi.dao;

import java.util.List;


import pers.lan.mi.bean.Product;


public interface productDao {

	List<Product> findNew() throws Exception;

	List<Product> findHot() throws Exception;

	Product getByPid(String pid) throws Exception;

	List<Product> findByPage(int currPage, int pageSize, String cid) throws Exception;

	int getTotalCount(String cid) throws Exception;

	List<Product> findAll() throws Exception;

	void add(Product p) throws Exception;
	
	void edit(Product p) throws Exception;
	
	void delete(String pid) throws Exception;
}
