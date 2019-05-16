package com.Filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

@WebFilter(filterName = "Filter",value = "/index.jsp")
public class  Filter implements javax.servlet.Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        String remoteAddr = req.getRemoteAddr();
        int remoteHost = req.getRemotePort()    ;
        System.out.println("执行过滤器");
        System.out.println(remoteAddr);
        System.out.println(remoteHost);
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }
}
