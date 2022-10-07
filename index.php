<?php
    include('app/db.php');

    if (isset($_POST['submit'])) {
        $h = $_COOKIE['hash'];
        //$res = insertNewComment($_POST['picture_id'], $_POST['comment'], $_COOKIE['hash']);
        insertNewComment($_POST['picture_id'], $_POST['comment'], $h);
    }
?>
<!DOCTYPE html>
<html lang="ru">

<head>
    <title>Главная</title>
    <?php include __DIR__.'/assets/header.php';?>    
</head>

<body>
<table class="t1" >
        <tr>
            <?php if(isset($_COOKIE['hash'])){
                echo '<td> Welcome back, '.$_COOKIE['user'].'! <a href="assets/logout.php">Log Out</a></td>';
            }else {
                echo '<td><a href="login.php">Login</a> / <a href="register.php">Register</a></td>';
            }
            ?>
            <td><a href="profile.php"><img src="assets/img/blankProfileLogo.jpg" class="avatar"></a></td>
        </tr>
    </table>
    <table style="margin-left:auto;margin-right:auto;">
       <?php
            $photos = getPhotoList();
            foreach ($photos as $photo) {
            echo'
            <tr>
                <td>
                    <img src="'.$photo['picture_path'] .'" alt="image 1" width="720" id="'.$photo['picture_id'].'">
                </td>
                <td>';
            if(isset($_COOKIE['hash']) AND $_COOKIE['id'] == $photo['user_id']){echo '<a href="assets/delete.php?pic_id='.$photo['picture_id'].'"> <img src="assets/img/x.png" alt="удалить фотографию" class="avatar"></a>';}
            echo '</td>
            </tr>
            <tr>
                <td>
                    <p>Photo by <i>'. $photo['author'].'</i></p>
                </td>
            </tr>';
                $comments = getCommentsByPhotoId($photo['picture_id']);
                    foreach ($comments as $i=>$comment) {
                    echo '<tr>
                    <td>';
                        if(isset($_COOKIE['hash']) AND $_COOKIE['id'] == $comment['user_id']){echo '<a href="assets/delete.php?comm_id='.$comment['comment_id'].'">  <img src="assets/img/x.png" alt="удалить комментарий" class="avatar delete"></a>';}
                    echo  '<b>'.$comment['author'].'</b> '.$comment['text'].'
                    </td>
                    </tr>
                    <tr>
                        <td>
                            '.$comment['db_created'].'
                        </td>
                    </tr>';
                }
              
                if (isset($_COOKIE['hash'])){
                    echo '<tr><td><form method="post">
                    <input type="hidden" name="picture_id" value="'.$photo['picture_id'].'">
                    <input type="text" name="comment" />
                    <input type="submit" name="submit" value="отправить">
                    </form></td></tr>';
                }
            }
        ?>
    </table> 
</body>
</html>