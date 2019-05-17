package com.ajax;

import com.test.Login;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "TelServlet",value = "/TelServlet")
public class TelServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        String tel = request.getParameter("tel");
        PrintWriter out = response.getWriter();

        Login login1 = new Login("10001","12345",true);
        Login login2 = new Login("10002","54321",true);

        JSONObject json = new JSONObject();
        json.put("login1",login1);
        json.put("login2",login2);

        out.print(json);

//        if("18307211872".equals(tel)){
//            //doPost,doGet方法不能return,用输入输出流进行通信
//            out.write("true");
//            out.write("{\"msg\":\"true\"}"); //如果是用$.getJSON，返回值也要是json
//        }else {
//            out.write("false");
//            out.write("{\"msg\":\"false\"}");
//        }
//        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
