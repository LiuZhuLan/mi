package pers.lan.mi.servlet;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import pers.lan.mi.bean.User;
import pers.lan.mi.constant.Constant;
import pers.lan.mi.service.userService;
import pers.lan.mi.service.impl.userServiceImpl;
import pers.lan.mi.utils.MD5Utils;
import pers.lan.mi.utils.UUIDUtils;


/**
 * 和用户相关的servlet
 */
public class adminUserServlet extends baseServlet {

	
	private static final long serialVersionUID = 1L;

	//添加管理员
	public String register(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		User user = new User(); 
		
		BeanUtils.populate(user, request.getParameterMap());
		
		user.setUid(UUIDUtils.getId());
		
		user.setState(1);
		user.setPassword(MD5Utils.md5(user.getPassword()));
		
		user.setType(1);
		userService s=new userServiceImpl();
		s.adminRegister(user);
		
		return "/admin/user/msg.jsp";
	}
	
	//查询全部用户
	public String findAll(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		userService s=new userServiceImpl();
		List<User> userList=s.findAll();
		request.setAttribute("userList", userList);
		return "admin/user/list.jsp";
	}
	
	//更改用户状态
	public String updateState(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String uid=(String)request.getParameter("uid");
		userService s=new userServiceImpl();
		s.updateState(uid);
		List<User> userList=s.findAll();
		request.setAttribute("userList", userList);
		return "admin/user/list.jsp";
	}
	//删除用户
	public String delete(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String uid=(String)request.getParameter("uid");
		userService s=new userServiceImpl();
		s.delete(uid);
		List<User> userList=s.findAll();
		request.setAttribute("userList", userList);
		return "admin/user/list.jsp";
	}
	//登录
	public String login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		password=MD5Utils.md5(password);
		
		//调用serive完成登录操作 返回user
		userService s=new userServiceImpl();
		User user=s.login(username,password);
		//判断用户
		if(user==null){
			//用户名密码不匹配
			request.setAttribute("msg", "用户名密码不匹配");
			return "/adminLogin.jsp";
		}else if(user.getType()==2){
			request.setAttribute("msg", "亲爱的用户，只有管理员能登录后台哦");
			return "/adminLogin.jsp";
		}else{
			//继续判断用户的状态是否激活
			if(Constant.USER_IS_ACTIVE!=user.getState()){
				request.setAttribute("msg", "用户未激活");
				return "/adminLogin.jsp";
			}
		}
		
		
		request.getSession().setAttribute("adminUser", user);
		response.sendRedirect(request.getContextPath()+"/admin/home.jsp");//  跳到/mi
		return null;
	}
	
	//注销登录
	public String logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//清空当前会话的全部的session：
		request.getSession().invalidate();
		
		//重定向
		response.sendRedirect(request.getContextPath()+"/adminLogin.jsp");
		
		return null;
	}
	
	
}

