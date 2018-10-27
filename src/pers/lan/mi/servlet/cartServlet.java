package pers.lan.mi.servlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pers.lan.mi.bean.Cart;
import pers.lan.mi.bean.CartItem;
import pers.lan.mi.bean.Product;
import pers.lan.mi.service.productService;
import pers.lan.mi.service.impl.productServiceImpl;


public class cartServlet extends baseServlet {
	
	 //获取购物车
	 
	public Cart getCart(HttpServletRequest request){
		
		Cart cart=(Cart) request.getSession().getAttribute("cart");
		//判断购物车是否为空
		if(cart == null){
			//创建一个cart
			cart=new Cart();
			//添加到session中
			request.getSession().setAttribute("cart", cart);
		}
		return cart;
	}
	
	
	 //添加到购物车
	
	public String add(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		String pid = request.getParameter("pid");
		int count = Integer.parseInt(request.getParameter("count"));
		
		
		productService ps=new productServiceImpl();
		Product product = ps.getByPid(pid);
		
		//组装成CartItem
		CartItem cartItem = new CartItem(product, count);
		
		//4.添加到购物车
		Cart cart = getCart(request);
		cart.addCart(cartItem);
		
		response.sendRedirect(request.getContextPath()+"/jsp/cart.jsp");
		return null;
	}
	
	
	 //从购物车中移除购物车项
	
	public String remove(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
	
		String pid = request.getParameter("pid");
		
		getCart(request).removeFromCart(pid);
		
		
		response.sendRedirect(request.getContextPath()+"/jsp/cart.jsp");
		return null;
	}
	
	//+操作
	public String incrCart(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
	
		String pid = request.getParameter("pid");
		
		getCart(request).incrCart(pid);
		
		
		response.sendRedirect(request.getContextPath()+"/jsp/cart.jsp");
		return null;
	}
	
	
	//-操作
	public String decrCart(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		String pid = request.getParameter("pid");
		
		getCart(request).decrCart(pid);
		
		
		response.sendRedirect(request.getContextPath()+"/jsp/cart.jsp");
		return null;
	}
	
	
	 //清空购物车
	
	public String clear(HttpServletRequest request, HttpServletResponse response) throws Exception {

		getCart(request).clearCart();
		response.sendRedirect(request.getContextPath()+"/jsp/cart.jsp");
		return null;
	}

}
