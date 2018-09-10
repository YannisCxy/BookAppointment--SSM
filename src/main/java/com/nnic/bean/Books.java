package com.nnic.bean;

/**
 * @Description com.nnic.bean
 * @Author Yannic
 * @Date 2018/8/22
 * @Version 1.0
 */
public class Books {
    private Integer id;
    private String book_name;
    private String book_type;
    private double book_price;
    private String book_publish;
    private int book_number;
    private String book_text;

    public Books(String book_name, String book_type, double book_price, String book_publish, int book_number, String book_text) {
        this.book_name = book_name;
        this.book_type = book_type;
        this.book_price = book_price;
        this.book_publish = book_publish;
        this.book_number = book_number;
        this.book_text = book_text;
    }

    public Books() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBook_name() {
        return book_name;
    }

    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }

    public String getBook_type() {
        return book_type;
    }

    public void setBook_type(String book_type) {
        this.book_type = book_type;
    }

    public double getBook_price() {
        return book_price;
    }

    public void setBook_price(double book_price) {
        this.book_price = book_price;
    }

    public String getBook_publish() {
        return book_publish;
    }

    public void setBook_publish(String book_publish) {
        this.book_publish = book_publish;
    }

    public int getBook_number() {
        return book_number;
    }

    public void setBook_number(int book_number) {
        this.book_number = book_number;
    }

    public String getBook_text() {
        return book_text;
    }

    public void setBook_text(String book_text) {
        this.book_text = book_text;
    }

    @Override
    public String toString() {
        return "Books{" +
                "book_name='" + book_name + '\'' +
                ", book_type='" + book_type + '\'' +
                ", book_price=" + book_price +
                ", book_publish='" + book_publish + '\'' +
                ", book_number=" + book_number +
                ", book_text='" + book_text + '\'' +
                '}';
    }
}
