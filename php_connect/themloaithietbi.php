<?php
    $db = mysqli_connect('localhost','root','','quanlyphonghoc');
    if (!$db) {
		echo "Database connection faild";
	}
    $TenLTB = $_POST['TenLTB'];
	$NgayLap = $_POST['NgayLap'];
	$MaTB = $_POST['MaTB'];

	$db->query("INSERT INTO loaithietbi(TenLTB,NgayLap,MaTB)
    VALUES('".$TenLTB."','".$NgayLap."','".$MaTB."')");

