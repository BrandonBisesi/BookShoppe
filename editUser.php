<!-------------------------------------
----  Author: Brandon Bisesi
----  Date: 2021-04-21
----  
--------------------------------------->
<?php
    require "header.php";

    $invalidEdit = false;
    $passwordError = false;
    $username = "";
    $password = "";
    $passwordVerify = "";
    $button = $username = filter_input(INPUT_POST, "editUser", FILTER_SANITIZE_FULL_SPECIAL_CHARS);

    print_r($_POST);

    $userId = $_SESSION["userId"];

        $query = "SELECT * FROM users WHERE UserId = :userId";
            $statement = $db->prepare($query);
            $statement->bindValue(':userId', $userId);
            $statement->execute();

            $user = $statement->fetch();

            if($statement->rowCount() == 0)
            {   
                header("Location: index.php");
                exit();
            }

            if(isset($_POST["password"]))
            {
                $password = filter_input(INPUT_POST, "password", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
                $passwordVerify = filter_input(INPUT_POST, "passwordVerify", FILTER_SANITIZE_FULL_SPECIAL_CHARS);

                
                if($password === $passwordVerify)
                {
                    $query = "SELECT UserName FROM users WHERE UserId = :userId";
                    $statement = $db->prepare($query);
                    $statement->bindValue(':userId', $userId);
                    $statement->execute();               

                    print_r($statement->rowCount());
                    $encryptedPass = password_hash($password, PASSWORD_DEFAULT);

                    if($statement->rowCount() !== 0)
                    {
                        $updatequery = "UPDATE users 
                                        SET Password = :password
                                        WHERE UserId = :userId";
                        $upstatement = $db->prepare($updatequery);
                        $upstatement->bindValue(':password', $encryptedPass);                        
                        $upstatement->bindValue(':userId', $userId);
                        $upstatement->execute();

                        $result = "Password successfully changed.";
                    }
                
                }
                else
                {
                    $passwordError = true;
                }
            }
            elseif(isset($_POST["username"]))
            {
                $username = filter_input(INPUT_POST, "username", FILTER_SANITIZE_FULL_SPECIAL_CHARS);

                $query = "SELECT UserName FROM users WHERE UserId = :userId";
                $statement = $db->prepare($query);
                $statement->bindValue(':userId', $userId);
                $statement->execute();               

                if($statement->rowCount() !== 0)
                {
                    $updatequery = "UPDATE users 
                                    SET UserName = :username
                                    WHERE UserId = :userId";
                    $upstatement = $db->prepare($updatequery);                      
                    $upstatement->bindValue(':username', $username);
                    $upstatement->bindValue(':userId', $userId);
                    $upstatement->execute();

                    rename('userImages/$_SESSION["username"]', "userImages/".$username);

                    if($_SESSION["userId"] == $userId)
                    {
                        $_SESSION["username"] = $username;
                    }

                    $result = "Username successfully changed.";
                    
                }
                else
                {    
                    $invalidEdit = true;
                }
            }


    
?>


<form action=# method="post">
    <fieldset>
        <?php if($button == "Change Username" || $invalidEdit) : ?>
            <h2>Change Username</h2>
            <p>
                <label for="username">Username:</label>
                <input name="username" id="username" value="<?=$user["UserName"]?>"/>
            </p>

            <?php if($invalidEdit) : ?>
                <p>Username not available</p>
            <?php endif; ?>

            <p>
                <input type="submit" name="editUser" value="Change Username" />
            </p>

        <?php elseif($button == "Change Password" || $passwordError) : ?>
            <h2>Change Password</h2>  
            <p>
                <label for="password">Password:</label>
                <input type="password" name="password" id="password" />
            </p>
            <p>
                <label for="passwordVerify">Password Again:</label>
                <input type="password" name="passwordVerify" id="passwordVerify" />
            </p>

            <p>
                <input type="submit" name="editUser" value="Change Password" />
            </p>

            <?php if($passwordError) : ?>
                <p>Passwords do not match</p>
            <?php endif; ?>
        <?php endif; ?>
        
        <?php if(isset($result)) : ?>
            <p><?= $result ?></p>
        <?php endif; ?>

    </fieldset>
</form>

</body>
</html>