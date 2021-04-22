<!-------------------------------------
----  Author: Brandon Bisesi
----  Date: 2021-04-21
----  
--------------------------------------->
<?php
    require "header.php";
    $error = false;

    $title = filter_input(INPUT_POST, "title", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    $content = filter_input(INPUT_POST, "content", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    $command = filter_input(INPUT_POST, "command", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    $rating = filter_input(INPUT_POST, 'rating', FILTER_SANITIZE_NUMBER_INT);
    $bookId = filter_input(INPUT_POST, 'bookId', FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    $reviewId = filter_input(INPUT_POST, 'reviewId', FILTER_SANITIZE_NUMBER_INT);
    $userId = filter_input(INPUT_POST, 'userId', FILTER_SANITIZE_NUMBER_INT);


    if(empty($_POST["title"]) || empty($_POST["content"]))
    {
        $error = true;
    }
    else if($command === "Create")
    {

        $query = "INSERT INTO reviews (Title, Content, Rating, BookId, UserId) 
            values (:title, :content, :rating, :bookId, :userId)";
        $statement = $db->prepare($query);
        $statement->bindValue(':title', $title);
        $statement->bindValue(':content', $content);
        $statement->bindValue(':rating', $rating);
        $statement->bindValue(':bookId', $bookId);
        $statement->bindValue(':userId', $userId);

        $statement->execute();
        header("Location: bookpage.php?bookId=$bookId");
        exit();
    }
    else if(!$reviewId)
    {
        header("Location: index.php");
        exit();
    }
    else if($command === "Update")
    {

        $query = "UPDATE reviews SET Title = :title, Content = :content, Rating = :rating WHERE ReviewId = :reviewId";
        $statement = $db->prepare($query);
        $statement->bindValue(':reviewId', $reviewId);
        $statement->bindValue(':title', $title);
        $statement->bindValue(':content', $content);
        $statement->bindValue(':rating', $rating);
        $statement->execute();

        header("Location: bookpage.php?bookId=$bookId");
        exit();
    }
    else if($command === "Delete")
    {

        $query = "DELETE FROM reviews WHERE reviewId = :reviewId";
        $statement = $db->prepare($query);
        $statement->bindValue(':reviewId', $reviewId);
        $statement->execute();

        header("Location: bookpage.php?bookId=$bookId");
        exit();
    }
?>

<?=$bookId?>
    <?php if($error): ?>
        <div id="wrapper">

            <div id="header">
                <h1><a href="index.php"></a></h1>
            </div>

            <h1>An error occured while processing your post.</h1>
            <p> Both the title and content must be at least one character.</p>
            <a href="bookpage.php?bookId=<?=$bookId?>">Return</a>
        </div> 

    <?php endif ?>
</body>
</html>