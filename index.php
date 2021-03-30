<?php 
    require "header.php";

      $genre = filter_input(INPUT_GET, 'genreId', FILTER_VALIDATE_INT);

    $query = "SELECT b.BookId, b.BookTitle, b.Author, b.Description, b.BookCover, g.Genre
              FROM books b
              JOIN genres g ON g.genreId = b.genreId
              WHERE b.genreId LIKE '%{$genre}%'";
    $statement = $db->prepare($query);
    //$statement->bindValue(':genre', $genre);
    $statement->execute();
    $rows = $statement->fetchAll();
?>


    <?php foreach($rows as $row) : ?>
        <img src ="images/<?= $row["BookCover"]?>" alt = <?= $row["BookTitle"]?> 
            style="width:100px;height:150px;"/>
        <h1><a href="bookpage.php?bookId=<?=$row["BookId"]?>"><?= $row["BookTitle"]?></a></h1>
        <p><?= $row["Author"]?></p>
        <p><?= $row["Genre"]?></p>
        <p><?= $row["Description"]?></p>
    <?php endforeach; ?>

    </body>
</html>