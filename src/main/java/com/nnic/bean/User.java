package com.nnic.bean;

/**
 * @Description com.nnic.bean
 * @Author Yannic
 * @Date 2018/8/19
 * @Version 1.0
 */
public class User {
    private Integer id;
    private String username;
    private String password;
    private String name;
    private int sex;
    private String phone;
    private String idnumber;
    public User() {
    }

    public User(String username, String password, String name, int sex, String phone, String idnumber) {
        this.username = username;
        this.password = password;
        this.name = name;
        this.sex = sex;
        this.phone = phone;
        this.idnumber = idnumber;
    }

    @Override
    public String toString() {
        return "User{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", sex=" + sex +
                ", phone=" + phone +
                ", idnumber='" + idnumber + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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

    public String getIdnumber() {
        return idnumber;
    }

    public void setIdnumber(String idnumber) {
        this.idnumber = idnumber;
    }
}
