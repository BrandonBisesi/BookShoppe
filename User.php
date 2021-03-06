<!-------------------------------------
----  Author: Brandon Bisesi
----  Date: 2021-04-21
----  
--------------------------------------->
<?php
    require "header.php";
    require 'php-image-resize-master\lib\ImageResize.php';
    require 'php-image-resize-master\lib\ImageResizeException.php';

    use \Gumlet\ImageResize;

    $command = filter_input(INPUT_POST, "submit", FILTER_SANITIZE_FULL_SPECIAL_CHARS);

    $imgstatement = select_userimage_table();


    function select_userimage_table()
    {
        global $db;

        $imgquery = "SELECT FilePath, MediumFilePath, ThumbnailFilePath FROM user_images WHERE UserId = :userId";
        $imgstatement = $db->prepare($imgquery);
        $imgstatement->bindValue(':userId', $_SESSION["userId"]);
        $imgstatement->execute();

        return $imgstatement;
    }

    function delete_images($imgstatement)
    {
        $picture = $imgstatement->fetch();

        unlink($picture["FilePath"]);
        unlink($picture["MediumFilePath"]);
        unlink($picture["ThumbnailFilePath"]);
        
    }

    function file_is_allowed($temporary_path, $new_path) 
    {
        $allowed_mime_types      = ['image/gif', 'image/jpeg', 'image/png'];
        $allowed_file_extensions = ['gif', 'jpg', 'jpeg', 'png'];
        
        $actual_file_extension   = pathinfo($new_path, PATHINFO_EXTENSION);
        $actual_mime_type        = mime_content_type($temporary_path);

        $file_extension_is_valid = in_array($actual_file_extension, $allowed_file_extensions);
        $mime_type_is_valid      = in_array($actual_mime_type, $allowed_mime_types);
        
        return $file_extension_is_valid && $mime_type_is_valid;
    }

    function file_upload_path($original_filename, $upload_subfolder_name = 'userImages')
    {
       $current_folder = dirname(__FILE__);
       $extension = "." . pathinfo($original_filename, PATHINFO_EXTENSION);
       $path_segments = [$current_folder, $upload_subfolder_name, $_SESSION["username"], basename($_SESSION["username"]."profile".microtime(true).$extension)];

       return join(DIRECTORY_SEPARATOR, $path_segments);
    }

    $image_upload_detected = isset($_FILES['image']) && ($_FILES['image']['error'] === 0);

    $value = "";

    if ($image_upload_detected) 
    {
        $image_filename       = $_FILES['image']['name'];
        $temporary_image_path = $_FILES['image']['tmp_name'];
        $new_image_path       = file_upload_path($image_filename);

        if(file_is_allowed($temporary_image_path,$new_image_path))
        {
            move_uploaded_file($temporary_image_path, $new_image_path);

            $basename = basename($new_image_path, ".".pathinfo($new_image_path, PATHINFO_EXTENSION));
            $extension = "." . pathinfo($new_image_path, PATHINFO_EXTENSION);

            $filePath = ('userImages/' . $_SESSION["username"] . '/' . $basename . $extension);

            $image = new ImageResize($new_image_path);
            $image->resizeToWidth(300);
            $image->save('userImages/' . $_SESSION["username"] . '/' . $basename . '_medium' . $extension );
            $imagePath = ('userImages/' . $_SESSION["username"] . '/' . $basename . '_medium' . $extension);
            
            $thumbnail = new ImageResize($new_image_path);
            $thumbnail->resizeToWidth(50);
            $thumbnail->save('userImages/'. $_SESSION["username"] . '/' . $basename . '_thumbnail' . $extension );
            $thumbPath = ('userImages/' . $_SESSION["username"] . '/' . $basename . '_thumbnail' . $extension);
            
            if($command == "Upload Image" && $imgstatement->rowcount() == 0)
            {   $query = "INSERT INTO user_images (UserId, FilePath, MediumFilePath, ThumbnailFilePath) 
                        VALUES (:userId, :filePath, :medium, :thumbnail)";
                    $statement = $db->prepare($query);
                    $statement->bindValue(':userId', $_SESSION["userId"]);
                    $statement->bindValue(':filePath', $filePath);
                    $statement->bindValue(':medium', $imagePath);
                    $statement->bindValue(':thumbnail', $thumbPath);

                    $statement->execute();
                    header("Location: User.php");
            }
            else if($command == "Update Image")
            {      
                delete_images($imgstatement);

                $query = "UPDATE `user_images` SET FilePath = :filePath , MediumFilePath = :medium, ThumbnailFilePath = :thumbnail WHERE UserId = :userId;";
                    $statement = $db->prepare($query);
                    $statement->bindValue(':userId', $_SESSION["userId"]);
                    $statement->bindValue(':filePath', $filePath);
                    $statement->bindValue(':medium', $imagePath);
                    $statement->bindValue(':thumbnail', $thumbPath);

                    $statement->execute();

                    header("Location: User.php");
            }




            
        }
        else
        {
            $value = "Invalid file type.";
        }

    }

    if($command == "Delete Image")
    {
        delete_images($imgstatement);

        $query = "DELETE FROM user_images WHERE UserId = :userId;";
            $statement = $db->prepare($query);
            $statement->bindValue(':userId', $_SESSION["userId"]);

            $statement->execute();
            header("Location: User.php");

    }


    $picture = $imgstatement->fetch();


?>


<?php if(isset($_SESSION["userId"])) : ?>
    <h1><?= $_SESSION["username"] ?></h1>


    <?php if($imgstatement->rowcount() == 0) : ?>
        <img src="userimages/default_medium.jpg" alt="<?= $_SESSION["username"] ?>">
        <form action="User.php" method="post" enctype="multipart/form-data">
            <fieldset>
                <label for="image">Change profile picture</label>
                <input type="file" name="image" id="image">
                <div>
                    <input type="submit" name="submit" value="Upload Image">
                </div>
                <?php if(isset($value)) : ?>
                    <h2><?=$value?></h2>
                <?php endif; ?>
            </fieldset>
        </form>
    <?php else : ?>
        <img src="<?=$picture["MediumFilePath"]?>" alt="<?= $_SESSION["username"] ?>">
        <form action="User.php" method="post" enctype="multipart/form-data">
            <fieldset>
                <label for="image">Change profile picture</label>
                <input type="file" name="image" id="image">
                <div>
                    <input type="submit" name="submit" value="Update Image">
                    <input type="submit" name="submit" value="Delete Image">
                </div>
                
                <?php if(isset($value)) : ?>
                    <h2><?=$value?></h2>
                <?php endif; ?>
            </fieldset>
        </form>
    <?php endif; ?>

        



    <form action="editUser.php" method="post">
        <div>
            <input type="submit" name="editUser" value="Change Password" />
            <input type="submit" name="editUser" value="Change Username" />
        </div>
    </form>
<?php else : 
    header("Location: Login.php");
    exit();

endif; ?>


</body>
</html>