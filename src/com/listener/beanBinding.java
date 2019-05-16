package com.listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

//session的绑定与解绑
@WebListener()
public class beanBinding implements HttpSessionBindingListener {

    @Override
    public void valueBound(HttpSessionBindingEvent httpSessionBindingEvent) {
        System.out.println("绑定bean对象（将bean对象增加到session域中），绑定的对象："+this+"，sessionId："+httpSessionBindingEvent.getSession().getId());
    }

    @Override
    public void valueUnbound(HttpSessionBindingEvent httpSessionBindingEvent) {
        System.out.println("解绑bean对象（将bean对象从session域中移除）,解绑的对象"+this+"，sessionId："+httpSessionBindingEvent.getSession().getId());
    }

}
