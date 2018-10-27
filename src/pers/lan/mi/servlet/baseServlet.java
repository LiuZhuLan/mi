package pers.lan.mi.servlet;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 通用的servlet
 */
public class baseServlet extends HttpServlet {
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			Class clazz = this.getClass();
			
			String m = request.getParameter("method");
			if(m==null){
				m="index";
			}
			
			
			Method method = clazz.getMethod(m, HttpServletRequest.class, HttpServletResponse.class);
			
			
			String s=(String) method.invoke(this, request,response);//相当于 userservlet.add(request,response)
			
			if(s!=null){
				request.getRequestDispatcher(s).forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		} 

	}
	
	
}
