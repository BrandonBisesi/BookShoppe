<?php
    require "header.php";

    $bookId = filter_input(INPUT_GET, 'bookId', FILTER_SANITIZE_FULL_SPECIAL_CHARS); 
    $sort = "Date Descending";

    //print_r($_GET);

    if($_POST)
    {
        $sort = filter_input(INPUT_POST, 'sort', FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    }
    $sorting = "";

    //print_r($sort);

    switch($sort)
    {
        case "Date Ascending":
            $sorting = "CreationDate ASC";
            break;
        case "Date Descending":
            $sorting = "CreationDate DESC";
            break;
        case "Rating Ascending":
            $sorting = "Rating ASC";
            break;
        case "Rating Descending":
            $sorting = "Rating DESC";
            break;
    }

    print_r($bookId);
    $books_json = file_get_contents("https://www.googleapis.com/books/v1/volumes/$bookId");
    $book = json_decode($books_json,true);

    //print_r($book);
    // $query = "SELECT * FROM books b WHERE b.bookId = :bookId;";

             
    // $statement = $db->prepare($query);
    // $statement->bindValue(':bookId', $bookId);
    // $statement->execute();

    // $book = $statement->fetch();

    //print_r($book);

    $query2 = "SELECT * FROM reviews WHERE bookId = :bookId";

        $query2 = $query2." ORDER BY ".$sorting;
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


    <?php if(true) : ?>
        <div>
            <?php if(isset($book['industryIdentifiers']["1"]["identifier"])): ?>
                <div><?= $book['industryIdentifiers']["1"]["identifier"] ?> </div>
            <?php endif; ?>
            <h2><?= $book['volumeInfo']['title']?></h2>
            <?php if(isset($book['volumeInfo']['authors']['0'])) : ?>
                <div>Written By:
                    <?= $book['volumeInfo']['authors']['0']?>
                    <?php if(isset($book['volumeInfo']['authors']['1'])) : ?>
                        and <?= $book['volumeInfo']['authors']['1']?>
                    <?php endif; ?>
                </div>
            <?php endif; ?>
            <?php if(isset($book['volumeInfo']['imageLinks']['thumbnail'])) : ?>
                <div><img src="<?= $book['volumeInfo']['imageLinks']['thumbnail']?>" /></div>
            <?php endif; ?>
            <?php if(isset($book['industryIdentifiers']["publisher"])): ?>
                <div>Published By: <?= $book['volumeInfo']['publisher'] ?></div>
            <?php endif; ?>
            <?php if(isset($book['volumeInfo']['description'])): ?>
                <div><?= $book['volumeInfo']['description']?> </div>
            <?php endif; ?>
            <h3>Rating: <?= round($rating["rating"], $precision = 1)?>/5</h3>
        </div>

        <form action="#" method="post">
            <label for="sort">Sort:</label>

            <select name="sort" id="sort">
                <option value="Date Ascending">Date Ascending</option>
                <option value="Date Descending">Date Descending</option>
                <option value="Rating Ascending">Rating Ascending</option>
                <option value="Rating Descending">Rating Descending</option>
            </select> 
            <input type="submit" name="submit" value="sort" />
        </form>

        <p><a href="review.php?bookId=<?= $bookId ?>">Leave a review</a></p>
        <div>Sorted by: <?= $sort ?></div>
        <div>
            <?php if($statement2->rowCount() !== 0) : ?>
                <?php foreach($reviews as $review) : ?>
                    <?php   
                            $userquery = "SELECT UserName
                                            FROM users 
                                            WHERE userId = :userId";
                            $userstatement = $db->prepare($userquery);
                            $userstatement->bindValue(':userId', $review["UserId"]);
                            $userstatement->execute();
                            $user = $userstatement->fetch();

                            $imgquery = "SELECT ThumbnailFilePath
                                                FROM user_images 
                                                WHERE userId = :userId";
                                $imgstatement = $db->prepare($imgquery);
                                $imgstatement->bindValue(':userId', $review["UserId"]);
                                $imgstatement->execute();
                                $image = $imgstatement->fetch();
                    ?>


                    <h3><a href="userReview.php?reviewId=<?=$review["ReviewId"]?>"><?= $review["Title"]?></a></h3>
                    <p><?= $review["CreationDate"]?></p>
                    <p>Rating: <?= $review["Rating"]?>/5</p>
                    <p><?= $review["Content"]?></p>
                    <div>
                        User: <?= $user["UserName"]?>

                        <?php if($imgstatement->rowCount() !== 0) : ?>
                            <img src="<?= $image["ThumbnailFilePath"] ?>" alt="<?= $user["UserName"]?>" />
                        <?php else: ?>
                            <img src="userimages/default_thumbnail.jpg" alt="<?= $user["UserName"]?>">
                        <?php endif; ?>
                        
                    </div>

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
