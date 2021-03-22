<?php
    require "header.php";
    $invalidLogin = filter_input(INPUT_GET, 'invalid', FILTER_VALIDATE_INT);
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Login</title>
        <link rel="stylesheet" href="styles.css" type="text/css">
    </head>
    <body>
        <form action=verification.php method="post">
            <fieldset>
                <p>
                    <label for="Username">Username:</label>
                    <input name="username" id="username" />
                </p>
                <p>
                    <label for="password">Password:</label>
                    <input name="password" id="password"/>
                </p>
                <p>
                    <input type="submit" name="login" value="Login" />
                </p>
                <?php if(isset($invalidLogin)) : ?>
                    <p>Invalid username or password</p>
                <?php endif; ?>
            </fieldset>
        </form>

    </body>
</html>
