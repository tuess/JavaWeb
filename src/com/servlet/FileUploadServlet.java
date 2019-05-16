package com.servlet;

import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

@WebServlet(name = "FileUploadServlet",value = "/FileUploadServlet")
public class FileUploadServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        boolean multipartContent = ServletFileUpload.isMultipartContent(request);
        if (multipartContent) { //判断前台表单是否有multipart属性
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            //设置缓冲区大小 40KB
            ((DiskFileItemFactory) factory).setSizeThreshold(40960);
            //设置上传文件大小 40KB
            upload.setFileSizeMax(40960);
            //通过parseRequest解析form中所有请求的字段，并保存到Items集合中
            try {
                List<FileItem> fileItems = upload.parseRequest(request);
                //通过迭代器遍历取出集合中的数据
                Iterator<FileItem> iterator = fileItems.iterator();
                while (iterator.hasNext()){
                    FileItem item = iterator.next();
                    String itemname = item.getFieldName(); //拿到表单提交的字段
                    //定义两个表单初始值
                    String name=null;
                    int age=0;
                    if(item.isFormField()){ //判断是否为普通表单字段
                        if(itemname.equals("name")){
                            name=item.getString("UTF-8");
                            response.getWriter().print("姓名："+name+"<br>");
                        }
                        else if(itemname.equals("age")){
                            age= Integer.parseInt(item.getString("UTF-8"));
                            response.getWriter().print("年龄："+age+"<br>");
                        }
                    }
                    else { //则为上传的文件
                        //获取文件名（带路径）
                        String fileNameTemp = item.getName();
                        //分割路径,取最后一段文件名
                        String[] temp = fileNameTemp.split("\\\\");
                        String fileName = temp[temp.length-1];
                        //取文件的后缀名并比较
                        String fileExt = fileName.substring(fileName.indexOf(".")+1);
                        if(!(fileExt.equals("jpg") || fileExt.equals("png") || fileExt.equals("bmp"))){
                            response.getWriter().print("<script>alert('图片格式有误，只能为jpg，png，bmp');</script>");
                            response.getWriter().print("<script>window.history.back(-1)</script>");
                            return;
                        }
                        //指定上传的位置（在服务器目录下寻找upload文件夹）
                        String path = request.getSession().getServletContext().getRealPath("upload");
                        File file = new File(path,fileName);
                        //上传文件
                        item.write(file);
                        response.getWriter().println(fileName+"上传成功！");
                    }
                }
            }catch (FileUploadBase.FileSizeLimitExceededException e){
                response.getWriter().print("<script>alert('文件大小超出限制，最大为40KB');</script>");
                response.getWriter().print("<script>window.history.back(-1)</script>");
            }
            catch (FileUploadException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
