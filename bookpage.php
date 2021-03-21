<?php
    require "connect.php";

    $bookId = filter_input(INPUT_GET, 'bookId', FILTER_VALIDATE_INT);


    $query = "SELECT * FROM books WHERE bookId = :bookId";
    $statement = $db->prepare($query);
    $statement->bindValue(':bookId', $bookId);
    $statement->execute();

    $book = $statement->fetch();

    $query2 = "SELECT * FROM reviews WHERE bookId = :bookId";
    $statement2 = $db->prepare($query2);
    $statement2->bindValue(':bookId', $bookId);
    $statement2->execute();

    $reviews = $statement2->fetchAll();

    $ratingQuery = "SELECT AVG(Rating) AS rating FROM reviews WHERE bookId = :bookId";
    $ratingStatement = $db->prepare($ratingQuery);
    $ratingStatement->bindValue(':bookId', $bookId);
    $ratingStatement->execute();

    $rating = $ratingStatement->fetch();

    //print_r($rating);

?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title><?= $book["BookTitle"]?> </title>
        <link rel="stylesheet" href="styles.css" type="text/css">
    </head>
    <body>
        <div>
        <ul>
            <li><a href="index.php">home</a></li>
        </ul>

        </div>
        <?php if($statement->rowCount() !== 0) : ?>
            <div>
                <img src ="images/<?= $book["BookCover"]?>" alt = <?= $book["BookTitle"]?> 
                style="width:100px;height:150px;"/>
                <h1><?= $book["BookTitle"]?></a></h1>
                <h3>Rating: <?= round($rating["rating"], $precision = 1)?>/5</h3>
                <p><?= $book["Author"]?></p>
                <p><?= $book["Genre"]?></p>
                <p><?= $book["Description"]?></p>
            </div>

            <p><a href="review.php?bookId=<?= $bookId ?>">Leave a review</a></p>
            

            <div>
                <?php if($statement2->rowCount() !== 0) : ?>
                    <?php foreach($reviews as $review) : ?>
                        <h3><a href="userReview.php?reviewId=<?=$review["ReviewId"]?>"><?= $review["Title"]?></a></h3>
                        <p><?= $review["Date"]?></p>
                        <p>Rating: <?= $review["Rating"]?>/5</p>
                        <p><?= $review["Content"]?></p>
                        <p>User: <?= $review["UserId"]?></p>
                    <?php endforeach; ?>
                <?php endif; ?>
            </div>

        <?php else :        
            header("Location: index.php");
            exit();  
        ?>
        <?php endif; ?> 
    </body>
</html>
