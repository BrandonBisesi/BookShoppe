<?php
    define('DB_DSN','mysql:host=localhost;dbname=bookshoppe');
    define('DB_USER','test');
    define('DB_PASS','test');     
    
    try {
        $db = new PDO(DB_DSN, DB_USER, DB_PASS);
    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
        exit(); // Force execution to stop on errors.
    }
?>