package com.nnic.bean;

/**
 * @Description com.nnic.bean
 * @Author Yannic
 * @Date 2018/8/22
 * @Version 1.0
 */
public class Admin {
    private Integer id;
    private String accountname;
    private String password;
    private String name;
    private int sex;
    private String phone;

    public Admin() {
    }

    public Admin(String accountname, String password, String name, int sex, String phone) {
        this.accountname = accountname;
        this.password = password;
        this.name = name;
        this.sex = sex;
        this.phone = phone;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAccountname() {
        return accountname;
    }

    public void setAccountname(String accountname) {
        this.accountname = accountname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "accountname='" + accountname + '\'' +
                ", password=" + password +
                ", name='" + name + '\'' +
                ", sex=" + sex +
                ", phone=" + phone +
                '}';
    }
}
