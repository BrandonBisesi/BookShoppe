<?php
    require "header.php";
    $username = filter_input(INPUT_POST, "username", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    $password = filter_input(INPUT_POST, "password", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    

    $query = "SELECT * FROM users WHERE UserName = :username AND Password = :password";
    $statement = $db->prepare($query);
    $statement->bindValue(':username', $username);
    $statement->bindValue(':password', $password);
    $statement->execute();

    $user = $statement->fetch(); 

    $_SESSION["username"] = $user["UserName"];
    $_SESSION["userId"] = $user["UserId"];
    $_SESSION["role"] = $user["role"];

?>