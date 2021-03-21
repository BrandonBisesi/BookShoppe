<?php 
    require "connect.php";

    $query = "SELECT * FROM books;";
    $statement = $db->prepare($query);
    $statement->execute();
    $rows = $statement->fetchAll(); 
?>

<!DOCTYPE html>
<html lang="en">
  <head>
      <meta charset="utf-8">
      <title>Book Shoppe</title>
      <link rel="stylesheet" href="styles.css" type="text/css">
  </head>
  <body>
    <?php foreach($rows as $row) : ?>
        <img src ="images/<?= $row["BookCover"]?>" alt = <?= $row["Title"]?> 
            style="width:100px;height:150px;"/>
        <h1><a href="bookpage.php?bookId=<?=$row["BookId"]?>"><?= $row["Title"]?></a></h1>
        <p><?= $row["Author"]?></p>
        <p><?= $row["Genre"]?></p>
        <p><?= $row["Description"]?></p>
    <?php endforeach; ?>

  </body>
</html>