<?php
    include __DIR__.'/../assets/bootstrap.php';

function removePhotoById(INT $id){
    $photos = checkPhotoById($id);
var_dump($photos);

    foreach($photos as $v){
        if ($v['picture_id'] == $_GET['pic_id']){
            deletePhoto($v['picture_id']);
        }
    }
}

function removeCommentById(int $id){
    $comments = checkCommentById($id);
// var_dump($comments);
    foreach($comments as $v){
        // echo $v['comment_id'].'-'.$_GET['comm_id'].'<br>';
        if ($v['comment_id'] == $_GET['comm_id']){
                deleteComment($v['comment_id']);
        }
    }
}
echo 'hash: '.$_COOKIE['hash'].'<br>';

//photo deletion
if (isset($_COOKIE['hash']) AND (isset($_GET['pic_id']))){
    echo 'photo deletion'.'<br>';
    echo 'pic_id: '.$_GET['pic_id'].'<br>';
    removePhotoById($_GET['pic_id']);
}
//comment deletion
if (isset($_COOKIE['hash']) AND (isset($_GET['comm_id']))){
    echo 'comment deletion'.'<br>';
    echo 'comm_id: '.$_GET['comm_id'].'<br>';
    removeCommentById($_GET['comm_id']);
}

header("Location: /");