package pers.lan.mi.servlet;

import java.io.IOException;

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



public class userServlet extends baseServlet {

	
	private static final long serialVersionUID = 1L;


	// 跳转到注册页面
	public String registerUI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "/jsp/register.jsp";
	}
	
	//判断用户名是否存在
	public String checkUsername(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String username=request.getParameter("username");
		userService s=new userServiceImpl();
		User user=s.checkUsername(username);
		if(user == null){
			response.getWriter().println("1");
		}else{
			response.getWriter().println("0");
		}
		return null;
	}
	//用户注册
	public String register(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		User user = new User(); 
		
		BeanUtils.populate(user, request.getParameterMap());
		
		user.setUid(UUIDUtils.getId());
		user.setCode(UUIDUtils.getCode());
		user.setPassword(MD5Utils.md5(user.getPassword()));
		//用户类型为2：普通用户
		user.setType(2);
		
		userService s=new userServiceImpl();
		s.register(user);
		
		request.setAttribute("msg", "用户注册已成功,请去邮箱激活~~");
		return "/jsp/msg.jsp";
	}
	
	
	 //用户激活
	
	public String active(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String code = request.getParameter("code");
		
		userService s=new userServiceImpl();
		User user=s.active(code);
		if(user==null){
			//通过激活码没有找到用户
			request.setAttribute("msg", "请重新激活");
		}else{
			
			request.setAttribute("msg", "激活成功");
		}
		
		return "/jsp/msg.jsp";
	}
	
	
	 //跳转到登录页面
	 
	public String loginUI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "/jsp/login.jsp";
	}
	
	//登录
	
	public String login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		password=MD5Utils.md5(password);
		
		
		userService s=new userServiceImpl();
		User user=s.login(username,password);
		
		//3.判断用户
		if(user==null){
			//用户名密码不匹配
			request.setAttribute("msg", "用户名密码不匹配");
			return "/jsp/login.jsp";
		}
		else{
			//继续判断用户的状态是否激活
			if(Constant.USER_IS_ACTIVE!=user.getState()){
				request.setAttribute("msg", "用户未激活");
				return "/jsp/msg.jsp";
			}
		}
		
		//将user放入session中 重定向
		request.getSession().setAttribute("user", user);
		response.sendRedirect(request.getContextPath()+"/");//  跳到/mi
		return null;
	}

	//展示个人中心
	public String showPrivate(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String uid=request.getParameter("uid");
		
		userService us=new userServiceImpl();
		User uprivate=us.getUser(uid);
		
		request.getSession().setAttribute("uprivate", uprivate);
		return "/jsp/user_info.jsp";
		
	}
	
	//修改个人信息
	public String changePrivate(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String uid=request.getParameter("uid");
		userService us=new userServiceImpl();
		User uupdate=us.getUser(uid);
		BeanUtils.populate(uupdate, request.getParameterMap());
		us.changePrivate(uupdate);
		
		User uprivate=us.getUser(uid);
		request.getSession().setAttribute("uprivate", uprivate);
		return "/jsp/user_info.jsp";
	}
	
	//修改密码
	public String changePassword(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String uid=request.getParameter("uid");
		userService us=new userServiceImpl();
		User uupdate=us.getUser(uid);
		
		String oldPassword=request.getParameter("oldPassword");
		String password=request.getParameter("password");
		oldPassword=MD5Utils.md5(oldPassword);
		password=MD5Utils.md5(password);
		int flag=us.changePassword(uid,oldPassword,password);
		if(flag==0){
			request.setAttribute("msg", "原密码输入错误");
			return "/jsp/msg.jsp";
		}
		else{
			request.setAttribute("msg", "修改密码成功");
			return "/jsp/msg.jsp";
		}
	}
	
	public String logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//清空当前会话的全部的session：
		request.getSession().invalidate();
		
		//重定向
		response.sendRedirect(request.getContextPath());
		
		return null;
	}
}

