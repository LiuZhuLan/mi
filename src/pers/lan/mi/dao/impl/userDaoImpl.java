package pers.lan.mi.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import pers.lan.mi.bean.User;
import pers.lan.mi.dao.userDao;
import pers.lan.mi.utils.DataSourceUtils;

public class userDaoImpl implements userDao{

	/**
	 *  用户注册
	 */
	@Override
	public void add(User user) throws SQLException {
		
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="insert into user values(?,?,?,?,?,?,?,?,?,?);";
		qr.update(sql, user.getUid(),user.getType(),user.getUsername(),user.getPassword(),
				user.getName(),user.getEmail(),user.getTelephone(),
				user.getSex(),user.getState(),user.getCode());
		
		
	}

	/**
	 * 通过激活码获取一个用户
	 */
	@Override
	public User getByCode(String code) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select * from user where code = ? limit 1";
		return 	qr.query(sql, new BeanHandler<>(User.class), code);
	}

	/**
	 * 修改用户
	 */
	@Override
	public void update2(User user) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="update user set username = ?,email=?,name=?,sex=?,telephone=? where uid =? ";
		qr.update(sql, user.getUsername(),user.getEmail(),user.getName(),user.getSex(),
				user.getTelephone(),user.getUid());
	}
	
	public void update1(User user) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="update user set username = ?,password = ? ,name=?,email=?,state = ?,code=? where uid =? ";
		qr.update(sql, user.getUsername(),user.getPassword(),user.getName(),user.getEmail(),
				user.getState(),null,user.getUid());
	}
	/**
	 * 修改密码
	 * @throws SQLException 
	 */
	public void changePassword(String uid,String password) throws SQLException{
		
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="update user set password=? where uid=?";
		qr.update(sql,password,uid);
		
		
	}
	/**
	 * 查询所有用户
	 */
	public List<User> findAll() throws Exception{
		
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select * from user where type=? or type=?";
		return qr.query(sql, new BeanListHandler<>(User.class),1,2);
	}
	
	/**
	 * 根据uid查询一个用户
	 */
	public User getUserById(String uid) throws Exception{
		
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select * from user where uid=?";
		return qr.query(sql, new BeanHandler<>(User.class),uid);
	}
	
	/**
	 * 通过用户名获取一个用户
	 *
	 */
	public User getUserByUsername(String username) throws Exception {
		
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select * from user where username = ? limit 1";
		return qr.query(sql, new BeanHandler<>(User.class), username);
	}
	
	/**
	 * 更改用户状态
	 */
	public void updateState(User user)throws Exception{
		
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="update user set state=? where uid=?";
		int state=user.getState()==1?0:1;
		qr.update(sql,state,user.getUid());
		
	}
	
	/**
	 * 删除用户
	 */
	public  void delete(String uid) throws Exception{
		
		QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
		String sql="delete from user where uid=?";
		qr.update(sql,uid);
	}
	/**
	 * 用户登录
	 */
	@Override
	public User getByUsernameAndPwd(String username, String password) throws Exception {
		
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select * from user where username = ? and password = ? limit 1";
		return qr.query(sql, new BeanHandler<>(User.class), username,password);
	}

}
