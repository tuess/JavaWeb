package com.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

//监听器一般监听的是request(ServletRequestListener),session(HttpSessionListener),application(ServletContextListener)
//监听三大类，实现三大类的接口,每个监听器提供了两个方法，监听开始和结束
//监听对象属性的变更，通过三个接口(ServletRequestAttributeListener,HttpSessionAttributeListener,ServletContextAttributeListener)
//获取其中的属性名用对象名.getName(),获取值用对象名.get对象.getAttribute()
@WebListener()
public class Listener implements ServletContextListener,HttpSessionListener,ServletRequestListener{

    // Public constructor is required by servlet spec
    public Listener() {
    }

    // -------------------------------------------------------
    // ServletContextListener implementation
    // -------------------------------------------------------
    public void contextInitialized(ServletContextEvent sce) {
      /* This method is called when the servlet context is
         initialized(when the Web application is deployed). 
         You can initialize servlet context related data here.
      */
        System.out.println("监听ServletContext对象，创建ServletContext对象"+sce);
    }

    public void contextDestroyed(ServletContextEvent sce) {
      /* This method is invoked when the Servlet Context 
         (the Web application) is underplayed or
         Application Server shuts down.
      */
        System.out.println("监听ServletContext对象，销毁ServletContext对象"+sce);
    }

    public void sessionCreated(HttpSessionEvent se) {
        /* Session is created. */
        System.out.println("监听Session对象，创建Session对象"+se);
    }

    public void sessionDestroyed(HttpSessionEvent se) {
        /* Session is destroyed. */
        System.out.println("监听Session对象，销毁Session对象"+se);
    }

    @Override
    public void requestDestroyed(ServletRequestEvent servletRequestEvent) {
        System.out.println("监听request对象,添加request对象"+servletRequestEvent);
    }

    @Override
    public void requestInitialized(ServletRequestEvent servletRequestEvent) {
        System.out.println("监听request对象,销毁request对象"+servletRequestEvent);
    }
}
