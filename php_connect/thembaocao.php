<?php
    $db = mysqli_connect('localhost','root','','quanlyphonghoc');
    if (!$db) {
		echo "Database connection faild";
	}
    $NoiDungBC = $_POST['NoiDungBC'];
	$MaLTB = $_POST['MaLTB'];
    $id = $_POST['id'];

	$db->query("INSERT INTO bctinhtrang(NoiDungBC,MaLTB,id)
    VALUES('".$NoiDungBC."','".$MaLTB."','".$id."')");

