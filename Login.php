<?php
    require "header.php";

    $invalidLogin = false;
    $username = "";
    $password = "";

    if($_POST)
    {
        $username = filter_input(INPUT_POST, "username", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        $password = filter_input(INPUT_POST, "password", FILTER_SANITIZE_FULL_SPECIAL_CHARS);

        $query = "SELECT * FROM users WHERE UserName = :username";
        $statement = $db->prepare($query);
        $statement->bindValue(':username', $username);
        $statement->execute();
        $user = $statement->fetch();

        if($statement->rowCount() !== 0 && password_verify($password, $user["Password"]))
        {
            $_SESSION["username"] = $user["UserName"];
            $_SESSION["userId"] = $user["UserId"];
            $_SESSION["role"] = $user["Role"];
    
            header("Location: index.php");
            exit();
        }
        else
        {
            $invalidLogin = true;
        }
    } 
?>


<form action=# method="post">
    <fieldset>
        <h2>Login</h2>
        <p>
            <label for="username">Username:</label>
            <input name="username" id="username" value="<?=$username?>"/>
        </p>  
        <p>
            <label for="password">Password:</label>
            <input type="password" name="password" id="password" value="<?=$password ?>"/>
        </p>
        <?php if($invalidLogin) : ?>
            <p>Invalid username or password</p>
        <?php endif; ?>
        <p>
            <input type="submit" name="login" value="Login" />
        </p>

        <p><a href="register.php">Register</a></p>
    </fieldset>
</form>

</body>
</html>
