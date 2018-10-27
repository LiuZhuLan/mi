package pers.lan.mi.servlet;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pers.lan.mi.bean.Order;
import pers.lan.mi.service.OrderService;
import pers.lan.mi.service.impl.OrderServiceImpl;

/**
 * 后台订单模块
 */
public class adminOrderServlet extends baseServlet {
	private static final long serialVersionUID = 1L;

	/**
	 *	查询订单
	 * @throws Exception 
	 */
	public  String findAllByState(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String state=request.getParameter("state");
		
		OrderService os=new OrderServiceImpl();
		List<Order> list=os.findAllByState(state);
		
		request.setAttribute("olist", list);
		return "/admin/order/list.jsp";
	}
	
	
	
	/**
	 * 修改订单状态
	 **/
	public  String updateState(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String oid = request.getParameter("oid");
		String state = request.getParameter("state");
		
		OrderService os=new OrderServiceImpl();
		Order order = os.getById(oid);		
		order.setState(2);
		
		os.update(order);
		
		
		response.sendRedirect(request.getContextPath()+"/adminOrder?method=findAllByState");
		return null;
	}	
}
