<?php
	$db = mysqli_connect('localhost','root','','quanlyphonghoc');
	if (!$db) {
		echo "Database connection faild";
	}
	$username = $_POST['username'];
	$name = $_POST['fullname'];
	$password = $_POST['password'];
	$Role = $_POST['Role'];


	$sql = "SELECT username FROM user WHERE 
	username = '".$username."'AND fullname = '".$name."' 
	AND password = '".$password."'";
	$result = mysqli_query($db,$sql);
	$count = mysqli_num_rows($result);

	if ($count == 1) {
		echo json_encode("Error");
	}else{
		$insert = "INSERT INTO user(username,fullname,password,Role)
		VALUES('".$username."','".$name."','".$password."','".$Role."')";
		$query = mysqli_query($db,$insert);
		if ($query) {
			echo json_encode("Success");
		}
	}

?>