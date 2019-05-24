package com.servlet;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.Base64;

@WebServlet(name = "fileDownloadServlet",value = "/fileDownloadServlet")
public class fileDownloadServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String filename = request.getParameter("filename");
        System.out.println(filename);
        //下载文件需要设置消息头
        response.addHeader("content-Type","application/octet-stream"); //contentType设置成二进制文件，通用类型
        //对于不同的浏览器不同处理
        String header = request.getHeader("User-Agent");
        if(header.toLowerCase().contains("firefox")){ //火狐浏览器
            response.addHeader("content-Disposition","attachment;filename==?UTF-8?B?"+ Base64.getEncoder().encodeToString(filename.getBytes("UTF-8")) +"?=");
        }else{
            response.addHeader("content-Disposition","attachment;filename="+ URLEncoder.encode(filename,"UTF-8"));
        }
        //将文件转化为输入流，读取到servlet中（序列化）
        InputStream inputStream = getServletContext().getResourceAsStream("/res/"+filename);
        System.out.println("true");
        //转化为输出流输出给用户（反序列化）
        ServletOutputStream outputStream = response.getOutputStream();
        byte[] bs=new byte[1024];
        int len=-1;
        //inputStream.read(byte[] b)从输入流中读取一定数量的字节，并将其存储在缓冲区数组 b 中。以整数形式返回实际读取的字节数。返回0代表数组b的长度为0，返回-1代表读取完毕
        while ((len=inputStream.read(bs))!=-1){
            outputStream.write(bs,0,len);
        }
        outputStream.close();
        inputStream.close();


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
