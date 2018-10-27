package pers.lan.mi.servlet;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pers.lan.mi.bean.Category;
import pers.lan.mi.service.categoryService;
import pers.lan.mi.service.impl.categoryServiceImpl;
import pers.lan.mi.utils.UUIDUtils;


public class adminCategoryServlet extends baseServlet {

	
	 //展示所有分类
	public String findAll(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		categoryService cs=new categoryServiceImpl();
		List<Category> list = cs.findAll();
		
		request.setAttribute("list", list);
		return "/admin/category/list.jsp";
	}
	
	//添加分类
	public String add(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String cname = request.getParameter("cname");
		Category c = new Category();
		c.setCid(UUIDUtils.getId());
		c.setCname(cname);
		categoryService cs=new categoryServiceImpl();
		cs.add(c);
		response.sendRedirect(request.getContextPath()+"/adminCategory?method=findAll");
		
		
		return null;
	}
	
	
	 //通过id获取分类信息
	 
	public String getById(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String cid = request.getParameter("cid");
		categoryService cs=new categoryServiceImpl();
		Category c=cs.getById(cid);
		request.setAttribute("edit", c);
		return "/admin/category/edit.jsp";
	}
	
	
	 //更新分类信息
	
	public String update(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		Category c=new Category();
		c.setCid(request.getParameter("cid"));
		c.setCname(request.getParameter("cname"));
		categoryService cs=new categoryServiceImpl();
		cs.update(c);
		response.sendRedirect(request.getContextPath()+"/adminCategory?method=findAll");
		return null;
	}
	
	
	 //删除分类
	 
	public String delete(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String cid = request.getParameter("cid");
		categoryService cs=new categoryServiceImpl();
		cs.delete(cid);
		response.sendRedirect(request.getContextPath()+"/adminCategory?method=findAll");
		return null;
	}

}
