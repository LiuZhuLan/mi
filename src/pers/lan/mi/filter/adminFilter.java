package pers.lan.mi.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pers.lan.mi.bean.User;


public class adminFilter implements Filter {

   
    public adminFilter() {
        // TODO Auto-generated constructor stub
    }

	
	public void destroy() {
		// TODO Auto-generated method stub
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		HttpServletRequest hrequest=(HttpServletRequest) request;
		HttpServletResponse hresponse=(HttpServletResponse) response;
		User user=(User) hrequest.getSession().getAttribute("adminUser");
		if(user==null){
			hresponse.sendRedirect(hrequest.getContextPath()+"/adminLogin.jsp");
		}
		else{
			chain.doFilter(hrequest, hresponse);
		}
	}

	
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
