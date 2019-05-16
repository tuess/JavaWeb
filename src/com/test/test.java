package com.test;

import java.util.*;

class A{
    public void addA(){
        System.out.println("A");
    }
}
class b extends A{
    public void addB(){
        System.out.println("b");
    }
}

public class test {
    public static void main(String[] args) {
        A a = new A();
        a.addA();
        A b= new b();
        b.addA();
        ((b) b).addB();
        //数组迭代
        String[] array=new String[]{"0", "1", "2","3"};
        for(String s:array){
            System.out.println(s);
        }
        //List的特征是其元素以线性方式存储，集合中可以存放重复对象。列表迭代器迭代，迭代器只能用于序列对象
        List<String> list=new ArrayList<>();
        list.add("0");
        list.add("1");
        list.add("2");
        list.add("3");
        for(Iterator<String> it = list.iterator();it.hasNext();){
            System.out.println(it.next());
        }

        //  Map 是一种把键对象和值对象映射的集合，它的每一个元素都包含一对键对象和值对象。Map没有继承于Collection接口。从Map集合中检索元素时，只要给出键对象，就会返回对应的值对象。
        Map<Integer,String> map = new HashMap<>();
        map.put(1,"zhangsan");
        map.put(2,"lisi");
        map.put(3,"wangwu");
        System.out.println(map.entrySet());

        //Set是一个不包含重复元素的 collection， 存放的是对象的引用，没有重复对象
        Set set = new HashSet<>();
        set.add("123");
        set.add("234");
        set.add("123"); //不会显示重复的
        for (Object o : set) {
            System.out.println(o);
        }


//        int[] array=new int[]{1,2,3,4,5};
//        int target=9;
//        for (int a=0;a<array.length;a++){
//            for(int b=0;b<array.length;b++){
//                if(array[a]+array[b]==target){
//                    System.out.println(array[a]);
//                    System.out.println(array[b]);
//                }
//            }
//        }
    }
}
