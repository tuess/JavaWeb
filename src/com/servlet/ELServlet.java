package com.servlet;

import com.test.Login;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

@WebServlet(name = "ELServlet",value = "/ELServlet")
public class ELServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Login login = new Login("张三","123",true);
        request.setAttribute("login",login);
        String[] hobbit = new String[]{"football","basketball","baseball"};
        request.setAttribute("hobbit",hobbit);
        Map<String,String> map = new HashMap<>();
        map.put("篮球","basketball");
        map.put("棒球","baseball");
        map.put("足球","football");
        request.setAttribute("map",map);
        List list = new ArrayList();
        Set set = new HashSet();
        request.getRequestDispatcher("EL_JSTL/EL.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
