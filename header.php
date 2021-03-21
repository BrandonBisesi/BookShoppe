<?php
    define('DB_DSN','mysql:host=localhost;dbname=bookshoppe');
    define('DB_USER','testUser');
    define('DB_PASS','test');     
    
    try {
        $db = new PDO(DB_DSN, DB_USER, DB_PASS);
    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
        exit(); // Force execution to stop on errors.
    }

    session_start();

?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="styles.css" type="text/css">
    </head>
    <body>
        <div>
            <ul>
                <li><a href="index.php">home</a></li>
                <li><a href="categories.php">Categories</a></li>
                <li><a href="login.php">Login</a></li>
                <li><a href="register.php">Register</a></li></li>
            </ul>
        </div>
    </body>
</html>