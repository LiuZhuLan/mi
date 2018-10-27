package pers.lan.mi.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

import pers.lan.mi.bean.Category;
import pers.lan.mi.bean.Product;
import pers.lan.mi.service.categoryService;
import pers.lan.mi.service.productService;
import pers.lan.mi.service.impl.categoryServiceImpl;
import pers.lan.mi.service.impl.productServiceImpl;
import pers.lan.mi.utils.UUIDUtils;
import pers.lan.mi.utils.UploadUtils;


public class adminProductServlet extends baseServlet {
	
	
	 //查询所有商品
	 
	public String findAll(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		productService ps=new productServiceImpl();
		List<Product> list=ps.findAll();
		request.setAttribute("plist", list);
		
		return "/admin/product/list.jsp";
	}
	
	//查询商品分类信息并且跳转到商品添加页面
	
	public String add(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		categoryService cs=new categoryServiceImpl();
		List<Category> clist = cs.findAll();
	
		request.setAttribute("clist", clist);
		return "/admin/product/add.jsp";
	}
	
	
	//通过id获得商品信息
	
	public String  getProductById(HttpServletRequest request, HttpServletResponse response) throws Exception{
			
		String pid=(String)request.getParameter("pid");
		categoryService cs=new categoryServiceImpl();
		List<Category> clist = cs.findAll();
		productService ps=new productServiceImpl();
		Product pr=ps.getByPid(pid);
		request.setAttribute("editp", pr);	
		request.setAttribute("clist", clist);
		return "/admin/product/edit.jsp";	 
		}
	
	
	//编辑商品
	public String edit(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		try {
			String pimage=(String)request.getParameter("pimage");
			String pid=(String)request.getParameter("pid");
			//0.创建map 放入前台传递的数据
			HashMap<String, Object> map = new HashMap<>();
			
			//创建磁盘文件项
			DiskFileItemFactory factory = new DiskFileItemFactory();
			//创建核心上传对象
			ServletFileUpload upload = new ServletFileUpload(factory);
			//解析request
			List<FileItem> list = upload.parseRequest(request);
			//遍历集合
			for (FileItem fi : list) {
				//判断是否是普通的上传组件
				if(fi.isFormField()){
					//普通上传组件
					map.put(fi.getFieldName(),fi.getString("utf-8"));
				}else{
					//文件上传组件
					//获取文件名称
					String name = fi.getName();
					//获取文件的真实名称    xxxx.xx
					String realName = UploadUtils.getRealName(name);
					//获取文件的随机名称
					String uuidName = UploadUtils.getUUIDName(realName);
					//获取文件的存放路径
					String path = this.getServletContext().getRealPath("/products/1");
				
					//获取文件流
					InputStream is = fi.getInputStream();
					//保存图片
					FileOutputStream os = new FileOutputStream(new File(path, uuidName));
					
					IOUtils.copy(is, os);
					os.close();
					is.close();
					
					//删除临时文件
					fi.delete();
					
					//在map中设置文件的路径
					map.put(fi.getFieldName(), "products/1/"+uuidName);
					
				}
				
			}
			
			
			
			//1.封装参数
			Product p = new Product();
			BeanUtils.populate(p, map);
			
			//1.1 商品id
			p.setPid(pid);
			
			//1.2 商品时间
			p.setPdate(new Date());
			
			
			//2.调用service完成添加
			productService ps= new productServiceImpl();
			ps.edit(p);
			
			//3.页面重定向
			response.sendRedirect(request.getContextPath()+"/adminProduct?method=findAll");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "商品编辑失败~");
			request.getRequestDispatcher("/jsp/msg.jsp").forward(request, response);
		}
		return null;
		
	}
	
	//删除商品
	public String delete(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		String pid=(String)request.getParameter("pid");
		productService ps=new productServiceImpl();
		ps.delete(pid);
		
		response.sendRedirect(request.getContextPath()+"/adminProduct?method=findAll");
		return null;
	}
	
}
