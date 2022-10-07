<?php
        $nc_stmt = $dbc->prepare("CALL new_comment(:pic_id, :comm, 'ca321ef499c02ca7ab0c423c5e1f50d7')");
        $nc_stmt->bindParam(':pic_id', $_POST['picture_id'], PDO::PARAM_INT); 
        $nc_stmt->bindParam(':comm', $_POST['comment'], PDO::PARAM_STR, 1028); 
        //$nc_stmt->bindParam(3, $_POST['picture_id'], PDO::PARAM_INT); 

        // call the stored procedure
        $nc_stmt->execute();