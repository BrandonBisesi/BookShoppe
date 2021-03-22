<?php
    require "header.php";
    $invalidRegister = filter_input(INPUT_GET, 'invalid', FILTER_VALIDATE_INT);
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Register</title>
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
                    <input type="submit" name="login" value="Register" />
                </p>
                <?php if(isset($invalidRegister)) : ?>
                    <p>Username not available</p>
                <?php endif; ?>
            </fieldset>
        </form>

    </body>
</html>