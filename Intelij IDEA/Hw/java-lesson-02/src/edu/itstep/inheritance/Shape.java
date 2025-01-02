package edu.itstep.inheritance;

public abstract class Shape{
    private String borderColor;
    private String backgroundColor;
    public String name = "SHAPE";

    public Shape(String borderColor, String backgroundColor) {
       // System.out.println("Shape");
        this.borderColor = borderColor;
        this.backgroundColor = backgroundColor;
    }

    public String getBorderColor() {
        return borderColor;
    }

    public void setBorderColor(String borderColor) {
        this.borderColor = borderColor;
    }

    public String getBackgroundColor() {
        return backgroundColor;
    }

    public void setBackgroundColor(String backgroundColor) {
        this.backgroundColor = backgroundColor;
    }

    @Override
    public String toString() {
        return "Shape{" +
                "borderColor='" + borderColor + '\'' +
                ", backgroundColor='" + backgroundColor + '\'' +
                ", area='" + calcArea() + '\'' +
                '}';
    }
    public abstract double calcArea();
}
