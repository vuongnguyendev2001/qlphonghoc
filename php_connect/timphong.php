<?php
    $db = mysqli_connect('localhost','root','','quanlyphonghoc');
    if (!$db) {
		echo "Database connection faild";
	}
    $TenPH = $_POST['TenPH'];
    $sql = $db->query("CALL timphong('".$TenPH."')");
    $result = array();
    while($row = $sql->fetch_assoc()){
        $result[] = $row;
    }
    echo json_encode($result);
