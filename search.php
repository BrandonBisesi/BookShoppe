<?php
    require "header.php";

    $query = "SELECT * FROM genres ORDER BY Genre;";
    $statement = $db->prepare($query);
    $statement->execute();
    $rows = $statement->fetchAll();
    $genre = "";
    $search = "";

    if(isset($_GET["searchBar"]))
    {
        $genre = filter_input(INPUT_GET, "genre", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        $search = filter_input(INPUT_GET, "searchBar", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        $page = filter_input(INPUT_GET, "page", FILTER_SANITIZE_NUMBER_INT);

        if($page > 1)
        {
            $startIndex = (($page-1)*20)+1;
        }
        else
        {
            $startIndex = 1;
        }

        $query = str_replace(" ", "+", $search);

        if($genre == "All")
        {
            if($search != "")
            {
                $books_json = file_get_contents('https://www.googleapis.com/books/v1/volumes?q=intitle:"'.$query.'"&maxResults=20&startIndex='.$startIndex.'&printType=books');
                $books = json_decode($books_json,true);
            }
            else
            {
                $books_json = file_get_contents("https://www.googleapis.com/books/v1/volumes?q=intitle:".$query.'&maxResults=20&startIndex='.$startIndex.'&printType=books');
                $books = json_decode($books_json,true);
            }

            //print_r($books);
        }
        else
        {
            if($search != "")
            {
                $books_json = file_get_contents('https://www.googleapis.com/books/v1/volumes?q=intitle:"'.$query.'"+subject:"'.$genre.'"&maxResults=20&startIndex='.$startIndex.'&printType=books');
                $books = json_decode($books_json,true);
            }
            else
            {
                $books_json = file_get_contents('https://www.googleapis.com/books/v1/volumes?q=subject:"'.$genre.'"&maxResults=20&startIndex='.$startIndex.'&printType=books');
                $books = json_decode($books_json,true);
            }
            //print_r($books);
        }
    }

?>


<form action="#" method="GET">
    <label for="genre">Genre:</label>

    <select name="genre" id="genre">
        <?php foreach($rows as $row) : ?>
            <option value="<?=$row["Genre"]?>"><?= $row["Genre"]?></option>
        <?php endforeach; ?>
    </select> 

    <input name="searchBar" id="searchBar" value="<?=$search?>" />
    <input type="hidden" name="page" value= "1" />
    <input type="submit" name="submit" value="Search" />

</form>

<?php if(isset($_GET["searchBar"]) && isset($books['items'])) :?>
    <?php foreach($books['items'] as $book) : ?>
        <div>
            <?php if(isset($book['industryIdentifiers']["1"]["identifier"])): ?>
                <div><?= $book['industryIdentifiers']["1"]["identifier"] ?> </div>
            <?php endif; ?>
            <h2><a href="bookpage.php?bookId=<?= $book["id"] ?>"><?= $book['volumeInfo']['title']?></a></h2>
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
            <p>------------------------------------------------------------------------</p>
        </div>
    <?php endforeach; ?>


    <div class="pagination">
        <?php if($startIndex != 1) :?>
            <a href="search.php?genre=<?=$genre ?>&searchBar=<?=$search?>&page=<?= $page-1 ?>&submit=Search">&laquo;</a>
        <?php endif; ?>
        <?php if(count($books["items"]) == 20):?>
            <a href="search.php?genre=<?=$genre ?>&searchBar=<?=$search?>&page=<?= $page+1 ?>&submit=Search">&raquo;</a>
        <?php endif; ?>
    </div>
<?php endif; ?> 

</body>
</html>