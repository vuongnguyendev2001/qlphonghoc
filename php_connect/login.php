<?php
    $db = mysqli_connect('localhost','root','','quanlyphonghoc');
    if (!$db) {
		echo "Database connection faild";
	}
    $username = $_POST['username'];
	$password = $_POST['password'];

    $sql = "SELECT * FROM user WHERE username = '".$username."' AND password = '".$password."'";
    
    $result = mysqli_query($db,$sql);
	$count = mysqli_num_rows($result);
    if($count == 1){
        $row = mysqli_fetch_assoc($result);
        echo json_encode($row["Role"]);
    }else{
        echo json_encode('0');
    }
?>