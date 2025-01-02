public class Employee extends User {
    public float salary;
    public String position;
    public String department;
    public Address address;

    @Override
    public void displayInfo() {
        super.displayInfo();
        System.out.println("Salary: " + salary);
        System.out.println("Position: " + position);
        System.out.println("Department: " + department);
        System.out.println("Address: " + address.city + ", " +
                address.street + ", " +
                address.houseNumber + ", " +
                address.roomNumber);
    }
}
