<?php 
  $db = mysqli_connect('localhost','root','','quanlyphonghoc');
    if (!$db) {
      echo "Database connection faild";
    }

	$query = $db->query("SELECT * FROM thietbi ORDER BY TenTB");
	$result = array();


	while ($rowData = $query->fetch_assoc()) {
		$result[] = $rowData;
	}

	echo json_encode($result);