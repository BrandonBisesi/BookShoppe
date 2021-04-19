<?php
    require "header.php";
    $invalidRegister = false;
    $passwordError = false;

    $username = "";
    $password = "";
    $passwordVerify = "";


    if($_POST)
    {
        $username = filter_input(INPUT_POST, "username", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        $password = filter_input(INPUT_POST, "password", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        $passwordVerify = filter_input(INPUT_POST, "passwordVerify", FILTER_SANITIZE_FULL_SPECIAL_CHARS);

        
        if($password === $passwordVerify)
        {
            $query = "SELECT UserName FROM users WHERE UserName = :username";
            $statement = $db->prepare($query);
            $statement->bindValue(':username', $username);
            $statement->execute();

            if($statement->rowCount() === 0)
            {
                $encryptedPass = password_hash($password, PASSWORD_DEFAULT);

                $insertquery = "INSERT INTO users (UserName, Password) VALUE (:username, :password)";
                $instatement = $db->prepare($insertquery);
                $instatement->bindValue(':username', $username);
                $instatement->bindValue(':password', $encryptedPass);
                $instatement->execute();

                mkdir('userImages/'.$username);
            

                header("Location: login.php");
                exit();
            }
            else
            {         
                $invalidRegister = true;
            }
        
        }
        else
        {
            $passwordError = true;
        }

    }

?>


    <form action=# method="post">
        <fieldset>
            <h2>Register</h2>
            <p>
                <label for="Username">Username:</label>
                <input name="username" id="username" value="<?=$username?>"/>
            </p>

            <?php if($invalidRegister) : ?>
                <p>Username not available</p>
            <?php endif; ?>
            
            <p>
                <label for="password">Password:</label>
                <input type="password" name="password" id="password" value="<?=$password ?>"/>
            </p>
            <p>
                <label for="passwordVerify">Password Again:</label>
                <input type="password" name="passwordVerify" id="passwordVerify" value ="<?= $passwordVerify ?>"/>
            </p>

            <?php if($passwordError) : ?>
                <p>Passwords do not match</p>
            <?php endif; ?>

            <p>
                <input type="submit" name="register" value="Register" />
            </p>


        </fieldset>
    </form>

    </body>
</html>