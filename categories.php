<?php 
    require "header.php";

    $query = "SELECT * FROM genres;";
    $statement = $db->prepare($query);
    $statement->execute();
    $rows = $statement->fetchAll(); 
?>


    <?php foreach($rows as $row) : ?>
        <h1><a href="index.php?genreId=<?=$row["GenreId"]?>"><?= $row["Genre"]?></a></h1>
    <?php endforeach; ?>

  </body>
</html>