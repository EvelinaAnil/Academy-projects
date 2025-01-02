<?php 
class Car {
    protected $brand;
    protected $cylinders;
    protected $power;

    public function __construct($brand, $cylinders, $power) {
        $this->brand = $brand;
        $this->cylinders = $cylinders;
        $this->power = $power;
    }

    public function printInfo() {
        echo "Brand: {$this->brand}, Cylinders: {$this->cylinders}, Power: {$this->power}\n";
    }
}
 
class Truck extends Car {
    protected $payload;

    public function __construct($brand, $cylinders, $power, $payload) {
        parent::__construct($brand, $cylinders, $power);
        $this->payload = $payload;
    }

    public function printInfo() {
        parent::printInfo();
        echo "Payload: {$this->payload} tons\n";
    }

    public function setBrand($brand) {
        $this->brand = "Truck: " . $brand;
    }

    public function setPayload($payload) {
        $this->payload = $payload;
    }
}

class TicketRequest {
    protected $destination;
    protected $dateTime;

    public function __construct($destination, $dateTime) {
        $this->destination = $destination;
        $this->dateTime = $dateTime;
    }

    public function getDestination() {
        return $this->destination;
    }

    public function getDateTime() {
        return $this->dateTime;
    }
}

class Train {
    protected $trainNumber;
    protected $startStation;
    protected $endStation;
    protected $price;

    public function __construct($trainNumber, $startStation, $endStation, $price) {
        $this->trainNumber = $trainNumber;
        $this->startStation = $startStation;
        $this->endStation = $endStation;
        $this->price = $price;
    }

    public function generateInvoice() {
        return "Train Number: {$this->trainNumber}, Start Station: {$this->startStation}, End Station: {$this->endStation}, Price: {$this->price}\n";
    }
}

// Создаем объекты машин и грузовиков
$car = new Car("Toyota", 4, 200);
$truck = new Truck("Volvo", 6, 300, 10);

// Выводим информацию о машинах
$car->printInfo();
$truck->printInfo();

// Изменяем марку и грузоподъемность грузовика
$truck->setBrand("Mercedes");
$truck->setPayload(15);

$truck->printInfo();

// Создаем объекты для системы "Железнодорожная касса"
$ticketRequest = new TicketRequest("Station B", "2023-11-15 12:00");
$train = new Train(123, "Station A", "Station B", 50);

// Получаем информацию о поезде и счет на оплату
echo $train->generateInvoice();


?>