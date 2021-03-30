<?php
    require "header.php";
    $invalidLogin = filter_input(INPUT_GET, 'invalid', FILTER_VALIDATE_INT);
?>


<form action=verification.php method="post">
    <fieldset>
    <h2>Login</h2>
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
        <p><a href="register.php">Register</a></p>
    </fieldset>
</form>

</body>
</html>
