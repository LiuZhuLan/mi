package pers.lan.mi.dao.impl;

import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import pers.lan.mi.bean.Product;
import pers.lan.mi.dao.productDao;
import pers.lan.mi.utils.DataSourceUtils;

public class productDaoImpl implements productDao{

	/**
	 * 查询最新
	 */
	@Override
	public List<Product> findNew() throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select * from product order by pdate desc limit 8";
		return qr.query(sql, new BeanListHandler<>(Product.class));
		
	}

	/**
	 * 查询热门
	 */
	@Override
	public List<Product> findHot() throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select * from product where is_hot = 1 order by pdate desc limit 8";
		return qr.query(sql, new BeanListHandler<>(Product.class));
	}

	/**
	 * 通过商品id 获取商品详情
	 */
	@Override
	public Product getByPid(String pid) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		
		String sql="select * from product where pid = ? limit 1";
		return qr.query(sql, new BeanHandler<>(Product.class), pid);
	}

	/**
	 * 查询当前页需要展示的数据
	 */
	@Override
	public List<Product> findByPage(int currPage, int pageSize, String cid) throws Exception {
		
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select * from product where cid = ? limit ?,?";
		return qr.query(sql, new BeanListHandler<>(Product.class), cid,(currPage-1)*pageSize,pageSize);
	}

	/**
	 * 查询当前类别的总条数
	 */
	@Override
	public int getTotalCount(String cid) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select count(*) from product where cid = ?";
		return ((Long)qr.query(sql, new ScalarHandler(), cid)).intValue();
	}
	
	/**
	 * 查询所有商品
	 */
	@Override
	public List<Product> findAll() throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select * from product";
		return qr.query(sql, new BeanListHandler<>(Product.class));
	}

	/**
	 * 添加商品
	 */
	@Override
	public void add(Product p) throws Exception {
		
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="insert into product values(?,?,?,?,?,?,?,?,?,?);";
		qr.update(sql, p.getPid(),p.getPname(),p.getMarket_price(),
				p.getShop_price(),p.getPimage(),p.getPdate(),
				p.getIs_hot(),p.getPdesc(),p.getPflag(),p.getCategory().getCid());
	}
	
	/**
	 * 编辑商品
	 */
	public void edit(Product p) throws Exception{
		
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="update product set pid=?,pname=?,market_price=?,shop_price=?,pimage=?,pdate=?,is_hot=?,pdesc=?"
				+ ",pflag=? where pid=?";
		qr.update(sql, p.getPid(),p.getPname(),p.getMarket_price(),
				p.getShop_price(),p.getPimage(),p.getPdate(),
				p.getIs_hot(),p.getPdesc(),p.getPflag(),p.getPid());
	}
	
	/**
	 * 删除商品
	 */
	public void delete(String pid) throws Exception{
		
		QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
		String sql="delete from product where pid=?";
		qr.update(sql,pid);
		
	}
}
