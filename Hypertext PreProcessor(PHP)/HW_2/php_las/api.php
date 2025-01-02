<?php
header('Content-Type: application/json');

$mysqli = new mysqli("localhost", "username", "password", "message_"); 
// заменить "username" и "password" на  учетную запись MySQL!(not forget!)

if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $text = $_POST["text"];
    $sql = "INSERT INTO messages_ (text) VALUES (?)";
    $stmt = $mysqli->prepare($sql);
    $stmt->bind_param("s", $text);
    $result = $stmt->execute();
    $stmt->close();
    
    if ($result) {
        echo json_encode(["success" => true]);
    } else {
        echo json_encode(["success" => false]);
    }
}

if ($_SERVER["REQUEST_METHOD"] === "GET") {
    $sql = "SELECT * FROM messages_";
    $result = $mysqli->query($sql);
    $messages = [];

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $messages[] = $row;
        }
    }
    echo json_encode(["messages_" => $messages]);
}

$mysqli->close();
?>
