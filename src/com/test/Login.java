package com.test;

public class Login {
    private String name;
    private String pwd;
    private boolean login;

    public Login(String name, String pwd, boolean login) {
        this.name = name;
        this.pwd = pwd;
        this.login = login;
    }

    public Login() {

    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public boolean isLogin() {
        login = name.equals("张三") && pwd.equals("123");
        return login;
    }

    public void setLogin(boolean login) {
        this.login=login;
    }
}
