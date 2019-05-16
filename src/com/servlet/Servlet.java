package com.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Servlet" , value="/Servlet")
public class Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置响应的内容类型
       response.setContentType("text/html;charset=utf-8");
       //取得输出对象
        PrintWriter out = response.getWriter();
        String name=request.getParameter("id");
        String pwd=request.getParameter("pwd");
        System.out.print(name);
        out.println("<html><body>");
        if(name==null || name.length()==0){
            out.println("请输入用户名！");
        }
        else if(pwd==null || pwd.length()==0){
            out.println("请输入密码！");
        }
        else if(name.length()>0 && pwd.length()>0){
            if(name.equals("111") && pwd.equals("123")){
                out.println("输入正确！");
            }
            else{
                out.println("输入错误！");
            }
        }
        out.println("</body></html>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
