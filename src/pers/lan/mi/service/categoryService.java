package pers.lan.mi.service;

import java.util.List;

import pers.lan.mi.bean.Category;

public interface categoryService {

	List<Category> findAll () throws Exception;
	
	void add(Category c) throws Exception;

	Category getById(String cid) throws Exception;

	void update(Category c) throws Exception;

	void delete(String cid) throws Exception;


}
