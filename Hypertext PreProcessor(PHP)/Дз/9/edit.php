<?php
session_start();
include 'config.php';
include 'Database.php';
include 'User.php';

$db = new Database();
$user = new User($db);

if (!isset($_SESSION['user_id'])) {
    header('Location: index.php');
    exit;
}

if (isset($_GET['id'])) {
    $userId = $_GET['id'];
    $userData = $user->getUserById($userId);
}

if (isset($_POST['update'])) {
    $username = $_POST['username'];
    $user->updateUser($userId, $username);
    header('Location: index.php');
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Edit User</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>Edit User</h2>
        <form method="POST">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" name="username" class="form-control" value="<?php echo $userData['username']; ?>" required>
            </div>
            <button type="submit" name="update" class="btn btn-primary">Update User</button>
        </form>
    </div>
</body>
</html>

