
<?php
        $bookId = filter_input(INPUT_GET, 'bookId', FILTER_VALIDATE_INT);
        $userId = filter_input(INPUT_GET, 'userId', FILTER_VALIDATE_INT);
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>New Review</title>
        <link rel="stylesheet" href="styles.css" type="text/css">
    </head>
    <body>
        <form action=process.php method="post">
            <fieldset>
                <span class="star-cb-group">
                    <h3>Rating</h3>
                    <input type="radio" id="rating-1" name="rating" value="1" /><label for="rating-1">1</label>
                    <input type="radio" id="rating-2" name="rating" value="2" /><label for="rating-2">2</label>
                    <input type="radio" id="rating-3" name="rating" value="3" /><label for="rating-3">3</label>
                    <input type="radio" id="rating-4" name="rating" value="4" /><label for="rating-4">4</label>
                    <input type="radio" id="rating-5" name="rating" value="5" checked = "checked" /><label for="rating-5">5</label>
                </span>
                <input type="hidden" name="bookId" value="<?= $bookId?>" />
                <input type="hidden" name="userId" value="<?= $userId?>" />
                
                <p>
                    <label for="title">Title</label>
                    <input name="title" id="title" />
                </p>
                <p>
                    <label for="content">Content</label>
                    <textarea name="content" id="content"></textarea>
                </p>
                <p>
                    <input type="submit" name="command" value="Create" />
                </p>
            </fieldset>
        </form>
    </body>
</html>