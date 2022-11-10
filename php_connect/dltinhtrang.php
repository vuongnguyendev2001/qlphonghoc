<?php
    $db = mysqli_connect('localhost','root','','quanlyphonghoc');
    if (!$db) {
		echo "Database connection fail";
	}
    // $TenLTB = $_POST['TenLTB'];
	// $NgayLap = $_POST['NgayLap'];
	// $MaTT = $_POST['MaTB'];

	$query = $db->query("SELECT * FROM `bctinhtrang` 
	INNER JOIN user ON bctinhtrang.id = user.id ORDER BY bctinhtrang.NgayBC DESC");
	$result = array();


	while ($rowData = $query->fetch_assoc()) {
		$result[] = $rowData;
	}

	echo json_encode($result);