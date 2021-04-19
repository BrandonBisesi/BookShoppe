<?php 
    require "header.php";

      $genre = filter_input(INPUT_GET, 'genreId', FILTER_VALIDATE_INT);

    $query = "SELECT * FROM books LIMIT 30;";
    $statement = $db->prepare($query);
    $statement->execute();
    $rows = $statement->fetchAll();
?>


    <?php foreach($rows as $row) : ?>
        <h1><a href="bookpage.php?bookId=<?=$row["BookId"]?>"><?=$row["BookTitle"]?></a></h1>
        <img src ="<?= $row["BookCover"]?>" alt = <?=$row["BookTitle"]?> 
            style="width:100px;height:150px;"/>
        
        <p><?= $row["Author"]?></p>
        <p><?= $row["Description"]?></p>
    <?php endforeach; ?>

    </body>
</html>