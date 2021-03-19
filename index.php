<?php 
    require "connect.php";

    $query = "SELECT * FROM books;";
    $statement = $db->prepare($query);
    $statement->execute();
    $rows = $statement->fetchAll(); 
?>