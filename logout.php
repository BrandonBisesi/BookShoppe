<?php
    require "header.php";

    $_SESSION = [];
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Logout</title>
        <link rel="stylesheet" href="styles.css" type="text/css">
    </head>
    <body>
        <?php if(!isset($_SESSION["userid"])) : ?>       
            <h1>You have successfully signed out</h1>
        <?php else : ?>
            <h1> Sign out failed </h1>
        <?php endif; ?>
    </body>
</html>