<?php
    $db = mysqli_connect('localhost','root','','quanlyphonghoc');
    if (!$db) {
		echo "Database connection faild";
	}

    $dbltb = $db->query("SELECT * from  loaithietbi ORDER BY TenLTB");
    $result = array();

    while($rowData = $dbltb->fetch_assoc()){
        $result[] = $rowData;
    }
    echo json_encode($result);


