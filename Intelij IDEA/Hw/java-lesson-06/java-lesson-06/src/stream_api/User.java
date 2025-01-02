package stream_api;

import java.util.Objects;

public class User {
    private String name;
    private int age;
    private Speciality speciality;

    public User(String name, int age, Speciality speciality) {
        this.name = name;
        this.age = age;
        this.speciality = speciality;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public Speciality getSpeciality() {
        return speciality;
    }

    public void setSpeciality(Speciality speciality) {
        this.speciality = speciality;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return age == user.age && Objects.equals(name, user.name) && speciality == user.speciality;
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, age, speciality);
    }

    @Override
    public String toString() {
        return "User{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", speciality=" + speciality +
                '}';
    }
}
