<?php
session_start();
include 'config.php';
include 'Database.php';
include 'User.php';

$db = new Database();
$user = new User($db);

$users = $user->getUsers();

if (isset($_SESSION['user_id'])) {
    $userId = $_SESSION['user_id'];
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>CRUD Application</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>CRUD Application</h2>
        <?php if (isset($userId)): ?>
            <a href="create.php" class="btn btn-primary">Create User</a>
        <?php endif; ?>
        <table class="table mt-3">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <?php if (isset($userId)): ?>
                        <th>Action</th>
                    <?php endif; ?>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($users as $user): ?>
                    <tr>
                        <td><?php echo $user['id']; ?></td>
                        <td><?php echo $user['username']; ?></td>
                        <?php if (isset($userId)): ?>
                            <td>
                                <a href="edit.php?id=<?php echo $user['id']; ?>" class="btn btn-success">Edit</a>
                                <a href="delete.php?id=<?php echo $user['id']; ?>" class="btn btn-danger">Delete</a>
                            </td>
                        <?php endif; ?>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
        <?php if (!isset($userId)): ?>
            <a href="register.php" class="btn btn-primary">Register</a>
            <a href="login.php" class="btn btn-secondary">Login</a>
        <?php else: ?>
            <a href="logout.php" class="btn btn-secondary">Logout</a>
        <?php endif; ?>
    </div>
</body>
</html>
