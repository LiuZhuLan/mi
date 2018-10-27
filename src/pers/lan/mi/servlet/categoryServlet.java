package pers.lan.mi.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pers.lan.mi.bean.Category;
import pers.lan.mi.service.categoryService;
import pers.lan.mi.service.impl.categoryServiceImpl;
import pers.lan.mi.utils.JsonUtil;


public class categoryServlet extends baseServlet {

	/**
	 * 查询所有的分类
	 */
	public String findAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		categoryService cs = new categoryServiceImpl();
		List<Category> clist = null;
		try {
			clist = cs.findAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String json = JsonUtil.listjson(clist);
		
		
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().println(json);
		return null;
	}

}
