<?php
session_start();
require_once 'config.php';

if (!isset($_SESSION['user'])) {
    header("Location: login.php");
    exit();
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $content = $_POST['content'];

    try {
        $stmt = $pdo->prepare("INSERT INTO messages (user_id, content) VALUES (?, ?)");
        $stmt->execute([$_SESSION['user']['id'], $content]);

        // Увеличиваем рейтинг пользователя
        $pdo->exec("UPDATE users SET rating = rating + 1 WHERE id = " . $_SESSION['user']['id']);
    } catch (PDOException $e) {
        echo "Message failed: " . $e->getMessage();
    }
}

try {
    $messages = $pdo->query("SELECT messages.*, users.username FROM messages JOIN users ON messages.user_id = users.id ORDER BY created_at DESC")->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat</title>
</head>
<body>
    <h2>Welcome, <?php echo $_SESSION['user']['username']; ?>!</h2>
    <p>Your Rating: <?php echo $_SESSION['user']['rating']; ?></p>

    <form method="post" action="">
        <label for="content">Message:</label>
        <textarea name="content" rows="4" cols="50" required></textarea><br>
        <input type="submit" value="Send Message">
    </form>

    <h3>Messages</h3>
    <?php foreach ($messages as $message) : ?>
        <div>
            <strong><?php echo $message['username']; ?>:</strong>
            <?php echo $message['content']; ?>
            <small><?php echo $message['created_at']; ?></small>
        </div>
    <?php endforeach; ?>
</body>
</html>
