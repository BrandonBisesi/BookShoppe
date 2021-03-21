<?php 
    require "connect.php";

    $query = "SELECT * FROM genres;";
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
        <h1><a href="index.php?genreId=<?=$row["GenreId"]?>"><?= $row["Genre"]?></a></h1>
    <?php endforeach; ?>

  </body>
</html>