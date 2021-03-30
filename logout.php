<?php
    require "header.php";

    $_SESSION = [];
?>


<?php if(!isset($_SESSION["userid"])) : ?>       
    <h1>You have successfully signed out</h1>
    <h3><a href="index.php">Return Home</a></h3>
<?php else : ?>
    <h1> Sign out failed </h1>
<?php endif; ?>
</body>
</html>