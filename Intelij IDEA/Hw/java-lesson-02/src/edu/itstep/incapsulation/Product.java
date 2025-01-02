package edu.itstep.incapsulation;

public class Product {
    private String name;
    private int price;//0
    private String color;//null
    //alt + insert


    public Product() {
        System.out.println(price);
        System.out.println(color);
        System.out.println("constructor: " + this);
    }

    public Product(String name, int price, String color) {
        this.name = name;
        this.price = price;
        this.color = color;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        if (price < 0) {
            this.price = 0;
        }else{
            this.price = price;
        }

    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }
}
