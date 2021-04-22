<!-------------------------------------
----  Author: Brandon Bisesi
----  Date: 2021-04-21
----  
--------------------------------------->
<?php 
    require "header.php";

    if($_POST)
    {
        $genre = filter_input(INPUT_POST, "genre", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        $newGenre = filter_input(INPUT_POST, "newGenre", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        $command = filter_input(INPUT_POST, "command", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        if($command == "Delete")
        {
            $query = "DELETE FROM genres WHERE Genre = :genre";
            $statement = $db->prepare($query);
            $statement->bindValue(':genre', $genre);
            $statement->execute();
        }
        elseif($genre == "new")
        {
            $insertquery = "INSERT INTO genres (Genre) VALUE (:genre)";
            $instatement = $db->prepare($insertquery);
            $instatement->bindValue(':genre', $newGenre);
            $instatement->execute();
        }
        else
        {
            $query = "UPDATE genres SET Genre = :newGenre WHERE Genre = :genre";
                $statement = $db->prepare($query);
                $statement->bindValue(':newGenre', $newGenre);
                $statement->bindValue(':genre', $genre);
                $statement->execute();
        }

    }

    $query = "SELECT * FROM genres;";
    $statement = $db->prepare($query);
    $statement->execute();
    $rows = $statement->fetchAll(); 
?>


<?php if($_SESSION["role"] == 2) : ?>
    <form action="#" method="POST">
        <div>
        <?php foreach($rows as $row) : ?>
            <div>
                <input type="radio" name="genre" value="<?= $row["Genre"]?>">
                <label for="<?= $row["Genre"]?>"><?= $row["Genre"]?></label>
            </div>
        <?php endforeach; ?>
            <input type="radio" name="genre" value="new"><label for="new">New</label>
        </div>


        <fieldset>
            <h2>Update Categories</h2>
            <p>
                <label for="newGenre">Genre:</label>
                <input name="newGenre" />
            </p>

            <p>
                <input type="submit" name="command" value="Update" />
                <input type="submit" name="command" value="Delete" />
            </p>
        </fieldset>
    </form>

<?php else : 
    header("Location: index.php");
    exit();

    endif; ?>


  </body>
</html>