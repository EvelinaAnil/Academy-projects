package Huiswerk;

public class Address {
    private String city;
    private String street;
    private String house;
    private String room;

    // Конструктор
    public Address(String city, String street, String house, String room) {
        this.city = city;
        this.street = street;
        this.house = house;
        this.room = room;
    }

    // Геттеры и сеттеры
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getHouse() {
        return house;
    }

    public void setHouse(String house) {
        this.house = house;
    }

    public String getRoom() {
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
    }

    // Метод toString для отображения информации об адресе
    @Override
    public String toString() {
        return "Address{" +
                "city='" + city + '\'' +
                ", street='" + street + '\'' +
                ", house='" + house + '\'' +
                ", room='" + room + '\'' +
                '}';
    }
}
