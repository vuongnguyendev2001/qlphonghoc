<?php
    $db = mysqli_connect('localhost','root','','quanlyphonghoc');
    if (!$db) {
		echo "Database connection faild";
	}
    $TenTB = $_POST['TenTB'];
	$TenNhanHieu = $_POST['TenNhanHieu'];
	$SoLuong = $_POST['SoLuong'];
	$MaPH = $_POST['MaPH'];

	$db->query("INSERT INTO thietbi(TenTB,TenNhanHieu,SoLuong,MaPH)
    VALUES('".$TenTB."','".$TenNhanHieu."','".$SoLuong."','".$MaPH."')");

