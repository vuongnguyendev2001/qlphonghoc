<?php
    $db = mysqli_connect('localhost','root','','quanlyphonghoc');
    if (!$db) {
		echo "Database connection faild";
	}
    $TenPH = $_POST['TenPH'];
    $Tang = $_POST['Tang'];

    $sql = "SELECT TenPH FROM phonghoc WHERE 
	TenPH = '".$TenPH."' AND Tang = '".$Tang."'";
	$result = mysqli_query($db ,$sql);
	$count = mysqli_num_rows($result);

    if ($count != NULL) {
		echo json_encode("Error");
	}
    else{
        $insert = "INSERT INTO phonghoc(TenPH,Tang)
		VALUES('".$TenPH."','".$Tang."')";
        $query = mysqli_query($db,$insert);
        if ($query) {
            echo json_encode("Success");
        }
    }
?>