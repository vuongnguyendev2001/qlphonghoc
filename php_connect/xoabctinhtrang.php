<?php
    $db = mysqli_connect('localhost','root','','quanlyphonghoc');
    if (!$db) {
      echo "Database connection faild";
    }
    $MaTT = $_POST['MaTT'];

	$db->query("DELETE FROM bctinhtrang WHERE MaTT = '".$MaTT."'");