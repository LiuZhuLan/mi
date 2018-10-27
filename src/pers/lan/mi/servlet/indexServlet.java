package pers.lan.mi.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pers.lan.mi.bean.Category;
import pers.lan.mi.bean.Product;
import pers.lan.mi.service.categoryService;
import pers.lan.mi.service.productService;
import pers.lan.mi.service.impl.categoryServiceImpl;
import pers.lan.mi.service.impl.productServiceImpl;

/**
 * 
 * 和首页相关的servlet
 */
public class indexServlet extends baseServlet {

	public String index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		categoryService cs=new categoryServiceImpl();
		productService ps=new productServiceImpl();
		List<Product> newList=null;
		List<Product> hotList=null;
		try {
			hotList=ps.findHot();
			newList=ps.findNew(); 
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("newList", newList);
		request.setAttribute("hotList", hotList);
		return "/jsp/index.jsp";
	}

}
