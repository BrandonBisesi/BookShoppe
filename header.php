<!-------------------------------------
----  Author: Brandon Bisesi
----  Date: 2021-04-21
----  
--------------------------------------->
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
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css">
    </head>
    <body>

    <nav class="navbar navbar-inverse navbar-static-top">
        <div class="container">
            <div class="navbar-header">
                <div id="navbar" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li>
                            <a class="navbar-brand" href="index.php">BookShoppe</a>
                        </li>
                        <li>
                            <a href="search.php">Search</a>
                        </li>
                        <?php if(isset($_SESSION["userId"])) : ?>
                            <li>
                                <a href="User.php"><?= ($_SESSION["username"]); ?></a>
                            </li>
                            <li>
                                <a href="logout.php">Logout</a>
                            </li>
                            <?php if($_SESSION["role"] == 2): ?>
                                <li>
                                    <a href="categories.php">Categories</a>
                                </li>
                            <?php endif; ?>
                        <?php else : ?>
                            <li>
                                <a href="login.php">Login</a>
                            </li>
                            <li>
                                <a href="register.php">Register</a>
                            </li>
                        <?php endif; ?>
                    



                    </ul>
                </div>
            </div>
        </div>
    </nav>