package com.test;

public class Rectange {
    //类中的所有方法必须时public，构造方法必须无参数
    private double length;
    private double width;
    public Rectange(){
        length=10;
        width=5;
    }

    public double getLength() {
        return length;
    }

    public void setLength(double length) {
        this.length = length;
    }

    public double getWidth() {
        return width;
    }

    public void setWidth(double width) {
        this.width = width;
    }

    //获取面积方法
    public double computerArea(){
        return length*width;
    }

    //获取周长方法
    public double computerLength(){
        return (length+width)*2;
    }
}
