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
                <tr>
                    <td><?= $row["UserId"]?></td>
                    <td><?= $row["UserName"]?></td>
                    <td><?= $row["Password"]?></td>
                    <td><a href="editUser.php">Edit User</a>
                </tr>

            <?php endforeach; ?>
        </tbody>
    </table>
<?php else : 
    header("Location: index.php");
    exit();

    endif; ?>
</body>
</html>