<?php
    $db = mysqli_connect('localhost','root','','quanlyphonghoc');
    if (!$db) {
      echo "Database connection faild";
    }
    $MaLTB = $_POST['MaLTB'];

	$db->query("DELETE FROM loaithietbi WHERE MaLTB = '".$MaLTB."'");