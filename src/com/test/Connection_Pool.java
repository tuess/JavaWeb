package com.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

public class Connection_Pool {
    //存放Connection对象的数组，数组被看成连接池
    ArrayList<Connection>list=new ArrayList<Connection>();
    //构造方法

    public Connection_Pool() {
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        for(int i=0;i<15;i++){
            try{
                Connection con= DriverManager.getConnection("jdbc:sqlserver://localhost:1433;database=Library","sa","157175");
                list.add(con);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    //从连接池中取出一个对象
    public synchronized Connection getOneCon(){
        if(list.size()>0){
            //删除数组的第一个元素，并返回该元素中的连接对象
            return list.remove(0);
        }
        else{
            //连接对象用完
            return null;
        }
    }
    //把连接对象放回连接池中
    public synchronized void releaseCon(Connection con){
        list.add(con);
    }
}
