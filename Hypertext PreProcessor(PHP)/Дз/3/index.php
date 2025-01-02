<?php 
class TrainRequest {
    private $destination;
    private $dateTime;

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
    private $trainNumber;
    private $intermediateStations;
    private $finalStation;
    private $price;

    public function __construct($trainNumber, $intermediateStations, $finalStation, $price) {
        $this->trainNumber = $trainNumber;
        $this->intermediateStations = $intermediateStations;
        $this->finalStation = $finalStation;
        $this->price = $price;
    }

    public function getTrainNumber() {
        return $this->trainNumber;
    }

    public function getIntermediateStations() {
        return $this->intermediateStations;
    }

    public function getFinalStation() {
        return $this->finalStation;
    }

    public function getPrice() {
        return $this->price;
    }
}

class Passenger {
    private $name;
    private $trainRequest;

    public function __construct($name, $trainRequest) {
        $this->name = $name;
        $this->trainRequest = $trainRequest;
    }

    public function chooseTrain($trains) {
        foreach ($trains as $train) {
            if ($train->getFinalStation() == $this->trainRequest->getDestination()) {
               
                return $train;
            }
        }
        return null; 
    }

    public function generateInvoice($chosenTrain) {
       
        $invoice = "Счет на оплату для пассажира {$this->name}:\n";
        $invoice .= "Поезд №{$chosenTrain->getTrainNumber()}\n";
        $invoice .= "Цена билета: {$chosenTrain->getPrice()} рублей\n";
        return $invoice;
    }
}

class Cashier {
    public function registerTrain($trainNumber, $intermediateStations, $finalStation, $price) {
        
        return new Train($trainNumber, $intermediateStations, $finalStation, $price);
    }
}


$cashier = new Cashier();
$passenger = new Passenger("Иван", new TrainRequest("Станция Б", "2023-12-01 12:00"));

$train1 = $cashier->registerTrain(101, ["Станция А", "Станция Б"], "Станция В", 500);
$train2 = $cashier->registerTrain(102, ["Станция Б", "Станция Г"], "Станция Д", 700);

$trains = [$train1, $train2];

$chosenTrain = $passenger->chooseTrain($trains);

if ($chosenTrain) {
    $invoice = $passenger->generateInvoice($chosenTrain);
    echo $invoice;
} else {
    echo "Извините, подходящего поезда не найдено.\n";
}

?>