<!-------------------------------------
----  Author: Brandon Bisesi
----  Date: 2021-04-21
----  
--------------------------------------->
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

    $userquery = "SELECT UserName
                    FROM users 
                    WHERE userId = :userId";
    $userstatement = $db->prepare($userquery);
    $userstatement->bindValue(':userId', $review["UserId"]);
    $userstatement->execute();

    $user = $userstatement->fetch();


?>


    <div>        
        <div>
            <?php if($statement->rowCount() !== 0) : ?>
                <h2>Review for <?=$review["BookTitle"]?> by <?= $review["Author"]?></h2>
                <h3><?= $review["Title"]?></h3>
                <p><?= $review["CreationDate"]?></p>
                <p><?= $review["Rating"]?>/5</p>
                <p><?= $review["Content"]?></p>
                <p><?= $user["UserName"]?></p>
            
                <?php if(isset($_SESSION["userId"]) && $_SESSION["userId"] === $review["UserId"] || isset($_SESSION["userId"]) && $_SESSION["role"] == 2) :?>
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
