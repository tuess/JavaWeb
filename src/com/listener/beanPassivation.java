package com.listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionActivationListener;
import javax.servlet.http.HttpSessionEvent;
import java.io.Serializable;

//session的钝化与活化,需要实现Serializable接口
//配置钝化，活化
//maxIdleSwap，最大空闲时间，超过该时间会被自动钝化
//directory，保存session文件的位置，如果填相对路径，是相对于在tomcat中项目文件夹下
//<Manager className="org.apache.catalina.session.PersistentManager" maxIdleSwap="5" >
//  <Store className="org.apache.catalina.session.FileStore" directory="E:\桌面" />
//</Manager>
@WebListener()
public class beanPassivation implements HttpSessionActivationListener, Serializable {

    private int id;
    private String name;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    //即将钝化之前
    @Override
    public void sessionWillPassivate(HttpSessionEvent httpSessionEvent) {
        System.out.println("即将钝化之前，beanPassivation对象会随着session的钝化而钝化");
    }

    //刚刚活化之后
    @Override
    public void sessionDidActivate(HttpSessionEvent httpSessionEvent) {
        //活化
        System.out.println("即将活化之前，beanPassivation对象会随着session的活化而活化");
    }
}
