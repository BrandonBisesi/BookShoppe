<?php
    define('DB_DSN','mysql:host=localhost;dbname=bookshoppe');
    define('DB_USER','testUser');
    define('DB_PASS','test');     
    
    try {
        $db = new PDO(DB_DSN, DB_USER, DB_PASS);
    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
        exit(); 
    }

    session_start();
    

?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Book Shoppe</title>
        <link rel="stylesheet" href="styles.css" type="text/css">
    </head>
    <body>
        <div>
            <ul>
                <li><a href="index.php">Home</a></li>
                <li><a href="categories.php">Categories</a></li>
                <?php if(isset($_SESSION["userId"])) : ?>
                    <li><a href="User.php"><?= ($_SESSION["username"]); ?></a></li>
                    <li><a href="logout.php">Logout</a></li>
                <?php else : ?>
                    <li><a href="login.php">Login</a></li>
                    <li><a href="register.php">Register</a></li>
                <?php endif; ?>



            </ul>
        </div>