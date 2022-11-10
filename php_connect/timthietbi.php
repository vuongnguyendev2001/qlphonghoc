<?php
    $db = mysqli_connect('localhost','root','','quanlyphonghoc');
    if (!$db) {
		echo "Database connection faild";
	}
    $TenTB = $_POST['TenTB'];
    $MaPH =$_POST['MaPH'];

    // $sql = "CALL timphong('".$TenPH."');";
    $sql = $db->query("SELECT * FROM thietbi 
    WHERE thietbi.MaPH LIKE CONCAT('%','".$MaPH."','%') 
    && thietbi.TenTB LIKE CONCAT('%','".$TenTB."','%') ORDER BY TenTB;");
    $result = array();
    while($row = $sql->fetch_assoc()){
        $result[] = $row;
    }
    echo json_encode($result);
