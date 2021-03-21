<?php
    require "header.php";

    $reviewId = filter_input(INPUT_GET, 'reviewId', FILTER_VALIDATE_INT);

    $query = "SELECT r.Title, r.CreationDate, r.Rating, r.Content, r.UserId, b.BookTitle, b.Author 
                FROM reviews AS r 
                INNER JOIN books AS b ON b.bookId = r.bookId 
                WHERE reviewId = :reviewId" ;
    $statement = $db->prepare($query);
    $statement->bindValue(':reviewId', $reviewId);
    $statement->execute();

    $review = $statement->fetch();
    print_r($review);
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title><?= $review["BookTitle"]?> </title>
        <link rel="stylesheet" href="styles.css" type="text/css">
    </head>
    <body>
        <div>
            <ul>
                <li><a href="index.php">home</a></li>
                <li><a href="categories.php">Categories</a></li>
            </ul>
            
            <div>
                <?php if($statement->rowCount() !== 0) : ?>
                    <h2>Review for <?=$review["BookTitle"]?> by <?= $review["Author"]?></h2>
                    <h3><?= $review["Title"]?></h3>
                    <p><?= $review["CreationDate"]?></p>
                    <p><?= $review["Rating"]?>/5</p>
                    <p><?= $review["Content"]?></p>
                    <p><?= $review["UserId"]?></p>
                
                    <?php if(true) :?>
                        <p><a href="editReview.php?reviewId=<?= $reviewId ?>">Edit</a></p>
                    <?php endif; ?>

                <?php else :        
                    header("Location: index.php");
                    exit();  
                ?>
                <?php endif; ?> 
            </div>
        </div>
    </body>
</html>
