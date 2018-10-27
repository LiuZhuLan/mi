package pers.lan.mi.service.impl;

import java.util.List;

import pers.lan.mi.bean.Page;
import pers.lan.mi.bean.Product;
import pers.lan.mi.dao.productDao;
import pers.lan.mi.dao.impl.productDaoImpl;
import pers.lan.mi.service.productService;

public class productServiceImpl implements productService{

	/**
	 * 查询最新
	 */
	@Override
	public List<Product> findNew() throws Exception {
		productDao pdao=new productDaoImpl();
		return pdao.findNew();
	}

	/**
	 * 查询热门
	 */
	@Override
	public List<Product> findHot() throws Exception {
		productDao pdao=new productDaoImpl();
		return pdao.findHot();
	}

	/**
	 * 查询单个商品
	 */
	@Override
	public Product getByPid(String pid) throws Exception {
		productDao pdao=new productDaoImpl();
		return pdao.getByPid(pid);
	}

	/**
	 * 按类别分页查询商品
	 */
	@Override
	public Page<Product> findByPage(int currPage, int pageSize, String cid) throws Exception {
		productDao pdao=new productDaoImpl();
		
		//当前页数据
		List<Product> list=pdao.findByPage(currPage,pageSize,cid);
		
		//总条数
		int totalCount = pdao.getTotalCount(cid);
		
		return new Page<>(list, currPage, pageSize, totalCount);
	}
	
	/**
	 * 查询所有
	 */
	@Override
	public List<Product> findAll() throws Exception {
		
		productDao pdao=new productDaoImpl();
		return pdao.findAll();
	}

	/**
	 * 添加商品
	 */
	@Override
	public void add(Product p) throws Exception {
		
		productDao pdao=new productDaoImpl();
		pdao.add(p);
	}
	
	/**
	 * 编辑商品
	 */
	public void edit(Product p) throws Exception{
		
		productDao pdao=new productDaoImpl();
		pdao.edit(p);
	}
	
	/**
	 * 删除商品
	 */
	@Override
	public void delete(String pid) throws Exception{
		
		productDao pd=new productDaoImpl();
		pd.delete(pid);
	}

}
