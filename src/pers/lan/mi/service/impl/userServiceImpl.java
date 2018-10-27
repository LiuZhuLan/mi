package pers.lan.mi.service.impl;

import java.util.List;

import pers.lan.mi.bean.User;
import pers.lan.mi.dao.userDao;
import pers.lan.mi.dao.impl.userDaoImpl;
import pers.lan.mi.service.userService;
import pers.lan.mi.utils.MailUtils;

public class userServiceImpl implements userService{

	
	
	/**
	 * 判断用户名是否已存在
	 */
	public User checkUsername(String username) throws Exception{
		
		userDao dao=new userDaoImpl();
		return dao.getUserByUsername(username);
	}
	/**
	 * 用户注册
	  * @throws Exception 
	 */
	@Override
	public void register(User user)  throws Exception{
		userDao dao=new userDaoImpl();
		dao.add(user);
		//发送邮件
		//email:收件人地址
		//emailMsg:邮件的内容
		String emailMsg="欢迎您注册成我们的一员,<a href='http://localhost:8080/mi/user?method=active&code="+user.getCode()+"'>点此激活</a>";
		MailUtils.sendMail(user.getEmail(), emailMsg);
	}
	/**
	 * 添加管理员
	  * @throws Exception 
	 */
	@Override
	public void adminRegister(User user)  throws Exception{
		
		userDao dao=new userDaoImpl();
		dao.add(user);
		
	}
	
	/**
	 * 查询所有用户
	 */
	public List<User> findAll() throws Exception{
		
		userDao dao=new userDaoImpl();
		return dao.findAll();
	}
	
	/**
	 * 查询一个用户
	 * @throws Exception 
	 */
	public User getUser(String uid) throws Exception{
		
		userDao dao=new userDaoImpl();
		
		return dao.getUserById(uid);
	}
	/**
	 * 用户激活
	 * @throws Exception 
	 */
	@Override
	public User active(String code) throws Exception {
		
		userDao dao=new userDaoImpl();
		//1.通过code获取一个用户
		User user=dao.getByCode(code);
		
		//2.判断用户是否为空
		if(user==null){
			return null;
		}
		
		//3.修改用户状态
		//将用户的状态设置为1
		user.setState(1);
		dao.update1(user);
		
		return user;
	}
	
	
	/**
	 * 更改用户状态
	 *  * @throws Exception 
	 */
	public void updateState(String uid)throws Exception{
		
		userDao dao=new userDaoImpl();
		User user=dao.getUserById(uid);
		dao.updateState(user);
		
	}
	/**
	 * 修改个人信息
	 * @throws Exception 
	 */
	public void changePrivate(User user) throws Exception{
		
		userDao dao=new userDaoImpl();
		dao.update2(user);
		
	}
	
	/**
	 * 修改密码
	 * @throws Exception 
	 */
	
	public int changePassword(String uid,String oldPassword,String password) throws Exception{
		
		userDao dao=new userDaoImpl();
		User user=dao.getUserById(uid);
		if(!user.getPassword().equals(oldPassword))
			return 0;
		else{
			dao.changePassword(uid, password);
			return 1;
		}
		
	}
	
	/**
	 * 删除用户
	  * @throws Exception 
	 */
	
	public void delete(String uid)throws Exception{
		
		userDao dao=new userDaoImpl();
		dao.delete(uid);
	}
	/**
	 * 用户登录
	  * @throws Exception 
	 */
	@Override
	public User login(String username, String password) throws Exception {
		userDao dao=new userDaoImpl();
		return dao.getByUsernameAndPwd(username,password);
	}

}
