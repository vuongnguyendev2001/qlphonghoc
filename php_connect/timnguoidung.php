<?php
    $db = mysqli_connect('localhost','root','','quanlyphonghoc');
    if (!$db) {
		echo "Database connection faild";
	}
    $sql = "CALL timphong('101');";
    if($result = mysqli_query($db, $sql)){
        while($row = mysqli_fetch_assoc($result)){
            echo json_encode($row);
        }
    }
