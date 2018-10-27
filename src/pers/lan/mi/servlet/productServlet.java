package pers.lan.mi.servlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pers.lan.mi.bean.Page;
import pers.lan.mi.bean.Product;
import pers.lan.mi.constant.Constant;
import pers.lan.mi.service.productService;
import pers.lan.mi.service.impl.productServiceImpl;

/**
 * 商品servlet
 */
public class productServlet extends baseServlet {

	
	public String  getById(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String pid=request.getParameter("pid");
		
		
		productService ps=new productServiceImpl();
		Product p=ps.getByPid(pid);
		
		
		request.setAttribute("product", p);
		return "/jsp/product_info.jsp";
	}
	
	//分页查询商品
	 
	public String  getByPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//1.获取类别,当前页,设置一个pagesize
		
		String cid=request.getParameter("cid");
		int currPage=Integer.parseInt(request.getParameter("currPage"));
		int pageSize=Constant.PRODUCT_PAGESIZE;
		
		productService ps=new productServiceImpl();
		Page<Product> page=ps.findByPage(currPage,pageSize,cid);
		
		request.setAttribute("page", page);
		return "/jsp/product_list.jsp";
	}

}
