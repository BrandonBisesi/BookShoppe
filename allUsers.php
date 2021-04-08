<?php
    require "header.php";

    $query = "SELECT UserId, UserName, Password FROM users";
    $statement = $db->prepare($query);
    $statement->execute();

    
    $rows = $statement->fetchAll(); 
?>


<?php if($_SESSION["role"] == 2) : ?>
    
    <table>
        <thead>
            <tr>
                <th>User Id</th>
                <th>Username</th>
                <th>Password</th>
            </tr>
        </thead>

        <tbody>
        
            <?php foreach($rows as $row) : ?>
            <form action=editUser.php?userid method="post">
                <tr>
                    <td><input name="userid" class="allUserId" value="<?= $row["UserId"]?>" readonly /></td>
                    <td><?= $row["UserName"]?></td>
                    <td><?= $row["Password"]?></td>
                    
                    <!--<td><a href="editUser.php?userid=<?= $row["UserId"]?>">Edit User</a>-->
                    <td><input type="submit" name="editUser" value= "Change Username" /></td>
                    <td><input type="submit" name="editUser" value="Change Password" /></td>
                    
                </tr>
                </form>
            <?php endforeach; ?>
        
        </tbody>
    </table>
    
<?php else : 
    header("Location: index.php");
    exit();

    endif; ?>



</body>
</html>