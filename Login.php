<?php
        require "header.php";
?>

<?php
    
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
                    <label for="Username">Username</label>
                    <input name="username" id="username" />
                </p>
                <p>
                    <label for="password">password</label>
                    <input name="password" id="password"/>
                </p>
                <p>
                    <input type="submit" name="login" value="Login" />
                </p>
            </fieldset>
        </form>

    </body>
</html>
