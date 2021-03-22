<?php
    require "header.php";

    $username = filter_input(INPUT_POST, "username", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    $password = filter_input(INPUT_POST, "password", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    $login = filter_input(INPUT_POST, "login", FILTER_SANITIZE_FULL_SPECIAL_CHARS);

    if($login == "Login")
    {
        $query = "SELECT * FROM users WHERE UserName = :username AND Password = :password";
        $statement = $db->prepare($query);
        $statement->bindValue(':username', $username);
        $statement->bindValue(':password', $password);
        $statement->execute();

        $user = $statement->fetch();

        if($statement->rowCount() !== 0)
        {
            $_SESSION["username"] = $user["UserName"];
            $_SESSION["userId"] = $user["UserId"];
            $_SESSION["role"] = $user["Role"];
    
            header("Location: index.php");
            exit();
        }
        else
        {
            header("Location: Login.php?invalid=1");
            exit();
        }
    } 

    if($login == "Register")
    {
        $query = "SELECT * FROM users WHERE UserName = :username";
        $statement = $db->prepare($query);
        $statement->bindValue(':username', $username);
        $statement->execute();

        $user = $statement->fetch();

        if($statement->rowCount() == 0)
        {
            $insertquery = "INSERT INTO users (UserName, Password) VALUE (:username, :password)";
            $instatement = $db->prepare($insertquery);
            $instatement->bindValue(':username', $username);
            $instatement->bindValue(':password', $password);
            $instatement->execute();

            header("Location: login.php");
            exit();
        }
        else
        {
            header("Location: Register.php?invalid=1");
            exit();
        }
    }



?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Login</title>
        <link rel="stylesheet" href="styles.css" type="text/css">
    </head>
    <body>
        <h1>Welcome back <?= $_SESSION["username"] ?>!</h1>
    </body>
</html>