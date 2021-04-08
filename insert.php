<?php
    require "header.php";
    $books_json = file_get_contents('https://api.nytimes.com/svc/books/v3/lists/2009-07-01/hardcover-fiction.json?api-key=2zxFlGeOZfi4LTyXOV1fL3YGsdu9snNp');

    $books = json_decode($books_json,true);

    //print_r($books);

    //print_r($books['results']['books'][0]);

    foreach($books['results']['books'] as $book)
    {
        $publisher = $book['publisher'];
        $description = $book['description'];
        $title = ucwords(strtolower($book['title']));
        $author = $book['author'];
        $image = $book['book_image'];
        $isbn = $book['primary_isbn13'];

        $query = "INSERT INTO books (BookTitle, ISBN, Author, BookCover, Description) 
            values (:title, :isbn, :author, :cover, :description)";
        $statement = $db->prepare($query);
        $statement->bindValue(':title', $title);
        $statement->bindValue(':isbn', $isbn);
        $statement->bindValue(':author', $author);
        $statement->bindValue(':cover', $image);
        $statement->bindValue(':description', $description);
        $statement->execute();



        //echo nl2br($publisher." ".$description." ".$title." ".$author." ".$image." ".$isbn." "."\n");
    }
?>

</body>
</html>