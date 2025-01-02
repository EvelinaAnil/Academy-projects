<?php

class Employee
{
    public $name;
    public $salary;
    public $phoneNumber;
    public $department;

    public function __construct($name, $salary, $phoneNumber, $department)
    {
        $this->name = $name;
        $this->salary = $salary;
        $this->phoneNumber = $phoneNumber;
        $this->department = $department;
    }
}


$employees = [
    new Employee("John Adams", 1500, "123.456.7890", "HR Department"),
    new Employee("Alice Anderson", 2000, "234.567.8901", "Finance Department"),
    new Employee("Micke Anderson", 2000, "222.456.8901", "Last Department"),
    new Employee("Alice Robrnson", 2000, "567.567.7563", "Php Department"),
];


$resultN = array_filter($employees, function ($employee) {
    return substr_count(strtolower($employee->name), 'a') >= 2;
});


$resultO = array_filter($employees, function ($employee) {
    return $employee->salary % 1000 == 0;
});


$resultP = array_map(function ($employee) {
    $phoneParts = explode('.', $employee->phoneNumber);
    return (int)$phoneParts[0];
}, $employees);


$resultQ = array_map(function ($employee) {
    $departmentWords = explode(' ', $employee->department);
    return $departmentWords[0];
}, array_filter($employees, function ($employee) {
    return substr_count($employee->department, ' ') > 0;
}));


$resultR = array_map(function ($employee) {
    return substr($employee->name, 1, -1);
}, $employees);


$resultS = array_filter($employees, function ($employee) {
    return substr($employee->name, -1) == 'm' && strlen($employee->name) > 5;
});


print_r($resultN);
print_r($resultO);
print_r($resultP);
print_r($resultQ);
print_r($resultR);
print_r($resultS);
