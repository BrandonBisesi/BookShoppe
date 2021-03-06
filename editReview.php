<!-------------------------------------
----  Author: Brandon Bisesi
----  Date: 2021-04-21
----  
--------------------------------------->
<?php
    require "header.php";

    $reviewId = filter_input(INPUT_GET, 'reviewId', FILTER_VALIDATE_INT);

    $query = "SELECT *
                FROM reviews 
                WHERE ReviewId = :reviewId" ;
    $statement = $db->prepare($query);
    $statement->bindValue(':reviewId', $reviewId);
    $statement->execute();

    $review = $statement->fetch();

    if(!($_SESSION["userId"] == $review["UserId"] || $_SESSION["role"] == 2))
    {
        header("Location: index.php");
        exit();
    }
?>



    <div>
        <?php if($statement->rowCount() !== 0) : ?>
            <form action="process.php" method="post">
                <fieldset>
                    <span class="star-cb-group">
                        <h3>Rating:</h3>
                        <input type="radio" id="rating-1" name="rating" value="1" /><label for="rating-1">1</label>
                        <input type="radio" id="rating-2" name="rating" value="2" /><label for="rating-2">2</label>
                        <input type="radio" id="rating-3" name="rating" value="3" /><label for="rating-3">3</label>
                        <input type="radio" id="rating-4" name="rating" value="4" /><label for="rating-4">4</label>
                        <input type="radio" id="rating-5" name="rating" value="5" checked = "checked" /><label for="rating-5">5</label>
                    </span>
                    <p>
                        <label for="title">Title</label>
                        <input name="title" id="title" value="<?= $review["Title"]?>" />
                    </p>
                    <p>
                        <label for="content">Content</label>
                        <textarea name="content" id="content"><?= $review["Content"]?></textarea>
                    </p>
                    <p>
                        <input type="hidden" name="reviewId" value="<?= $review["ReviewId"]?>" />
                        <input type="hidden" name="bookId" value="<?= $review["BookId"]?>" />
                        <?php if($_SESSION["userId"] == $review["UserId"]) :?>
                            <input type="submit" name="command" value="Update" />
                        <?php endif; ?>
                        <input type="submit" name="command" value="Delete" onclick="return confirm('Are you sure you wish to delete this review?')" />
                    </p>
                </fieldset>
            </form>
        <?php else :        
        header("Location: index.php");
        exit();  
        ?>
        <?php endif; ?> 
    </div>



    </body>
</html>
