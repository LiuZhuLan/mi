package pers.lan.mi.service.impl;

import java.util.List;

import pers.lan.mi.bean.Category;
import pers.lan.mi.dao.categoryDao;
import pers.lan.mi.dao.impl.categoryDaoImpl;
import pers.lan.mi.service.categoryService;


public class categoryServiceImpl implements categoryService {

	
	 //查询所有的分类
	
	@Override
	public List<Category> findAll() throws Exception
	{
		categoryDao cd=new categoryDaoImpl();
		return cd.findAll();
	}
	
	//添加分类
	public void add(Category c)throws Exception{
		
		categoryDao cd=new categoryDaoImpl();
		cd.add(c);
	}
	
	//通过id获得分类信息
	public Category getById(String cid)throws Exception{
		
		categoryDao cd=new categoryDaoImpl();
		return cd.getById(cid);
	}
	
	//更新分类
	public void update(Category c) throws Exception{
		
		categoryDao cd=new categoryDaoImpl();
		cd.update(c);
	}
	
	//删除分类
	public void delete(String cid) throws Exception{
		
		categoryDao cd=new categoryDaoImpl();
		cd.delete(cid);
	}
	
}
