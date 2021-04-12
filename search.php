<?php
    require "header.php";

    $query = "SELECT * FROM genres ORDER BY Genre;";
    $statement = $db->prepare($query);
    $statement->execute();
    $rows = $statement->fetchAll(); 
    $genre = "";
    $search = "";
    $page = 1;

    if(isset($_POST))
    {
        $genre = filter_input(INPUT_POST, "genre", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        $search = filter_input(INPUT_POST, "searchBar", FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        $page = filter_input(INPUT_GET, "Page", FILTER_SANITIZE_NUMBER_INT);

        $search = str_replace(" ", "+", $search);

        if($genre == "All")
        {
            if($search != "")
            {
                $books_json = file_get_contents('https://www.googleapis.com/books/v1/volumes?q="'.$search.'"&maxResults=20&startIndex=1&printType=books');
                $books = json_decode($books_json,true);
            }
            else
            {
                $books_json = file_get_contents("https://www.googleapis.com/books/v1/volumes?q=".$search."maxResults=20&startIndex=1&printType=books");
                $books = json_decode($books_json,true);
            }

            //print_r($books);
        }
        else
        {
            if($search != "")
            {
                $books_json = file_get_contents('https://www.googleapis.com/books/v1/volumes?q=intitle:"'.$search.'"+subject:"'.$genre.'"&maxResults=20&startIndex=1&printType=books');
                $books = json_decode($books_json,true);
            }
            else
            {
                $books_json = file_get_contents('https://www.googleapis.com/books/v1/volumes?q=subject:"'.$genre.'"&maxResults=20&startIndex=1&printType=books');
                $books = json_decode($books_json,true);
            }
            //print_r($books);
        }
    }



?>


<form action="#" method="POST">
    <label for="genre">Genre:</label>

    <select name="genre" id="genre">
        <?php foreach($rows as $row) : ?>
            <option value="<?=$row["Genre"]?>"><?= $row["Genre"]?></option>
        <?php endforeach; ?>
    </select> 

    <input name="searchBar" id="searchBar" />
    <input type="submit" name="submit" value="Search" />
</form>

<?php if(isset($_POST["searchBar"]) && $books['totalItems'] != 0) :?>
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
<?php endif; ?> 

<?= $books["totalItems"] ?>
<div class="pagination">
    <a href="search.php?page=<?php $page-1 ?>">&laquo;</a>

    <?php for($i=1; $i<=5; $i++) : ?>

        <a href="#"><?= $i?></a>

    <?php endfor; ?>
    <a href="search.php?page=<?php $page+1 ?>">&raquo;</a>
</div>

</body>
</html>