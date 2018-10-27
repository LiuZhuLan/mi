package pers.lan.mi.servlet;

import java.io.IOException;
import java.util.Collection;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import pers.lan.mi.bean.Cart;
import pers.lan.mi.bean.CartItem;
import pers.lan.mi.bean.Order;
import pers.lan.mi.bean.OrderItem;
import pers.lan.mi.bean.Page;
import pers.lan.mi.bean.User;
import pers.lan.mi.service.OrderService;
import pers.lan.mi.service.impl.OrderServiceImpl;
import pers.lan.mi.utils.UUIDUtils;


public class orderServlet extends baseServlet {

	
	 //生成订单
	
	public String add(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		User user=(User) request.getSession().getAttribute("user");
		if(user == null){
			request.setAttribute("msg", "请先登录~~");
			return "/jsp/msg.jsp";
		}
		Order order=new Order();
		order.setOid(UUIDUtils.getId());
		order.setOrdertime(new Date());
		Cart cart=(Cart) request.getSession().getAttribute("cart");
		order.setTotal(cart.getTotal());
		//订单的所有订单项
		/*
		 * 先获取cart中itmes
		 * 遍历itmes 组装成orderItem
		 * 将orderItem添加到list(items)中
		 */
		for (CartItem cartItem : cart.getItems()) {
			OrderItem oi = new OrderItem();
			
			oi.setItemid(UUIDUtils.getId());
			oi.setCount(cartItem.getCount());
			oi.setSubtotal(cartItem.getSubtotal());
			oi.setProduct(cartItem.getProduct());
			oi.setOrder(order);
			order.getItems().add(oi);
		}
		order.setUser(user);
		OrderService os=new OrderServiceImpl();
		os.add(order);
		request.setAttribute("order", order);
		//清空购物车
		request.getSession().removeAttribute("cart");
		return "/jsp/order_info.jsp";
	}
	
	//分页查询所有订单
	
	public String findAllByPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int currPage=Integer.parseInt(request.getParameter("currPage"));
		int pageSize=3;
		
		User user=(User) request.getSession().getAttribute("user");
		if(user == null){
			request.setAttribute("msg", "你还没有登录,请登录!");
			return "/jsp/msg.jsp";
		}
		
		OrderService os=new OrderServiceImpl();
		Page<Order> order_list=os.findAllByPage(currPage,pageSize,user);
		
		request.setAttribute("order_list", order_list);
		return "/jsp/order_list.jsp";
	}
	
	//根据id获得订单
	
	public String getById(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String oid = request.getParameter("oid");
		OrderService os=new OrderServiceImpl();
		Order order=os.getById(oid);
		
		request.setAttribute("order", order);
		
		return "/jsp/order_info.jsp";
	}
	
	//修改订单状态
	
	public String updateState(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String oid=(String)request.getParameter("oid");
		
		OrderService os=new OrderServiceImpl();
		Order order=os.getById(oid);
		order.setState(3);
		os.update(order);
		
		response.sendRedirect(request.getContextPath()+"/order?method=findAllByPage&currPage=1");
		return null;
	}
	
	//删除订单
	public String delete(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String oid=(String)request.getParameter("oid");
		
		OrderService os=new OrderServiceImpl();
		os.delete(oid);
		
		response.sendRedirect(request.getContextPath()+"/order?method=findAllByPage&currPage=1");
		return null;
	}
	
	
	//支付
	public String pay(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String oid=(String)request.getParameter("oid");
		String address=(String)request.getParameter("address");
		String name=(String)request.getParameter("name");
		String telephone=(String)request.getParameter("telephone");
		
		OrderService os=new OrderServiceImpl();
		
		Order order=os.getById(oid);
		order.setName(name);
		order.setTelephone(telephone);
		order.setAddress(address);
		order.setState(1);
		
		os.update(order);
		request.setAttribute("msg", "支付成功，请等待发货");
		return "jsp/msg.jsp";
	}

}
