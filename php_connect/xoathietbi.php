<?php
    $db = mysqli_connect('localhost','root','','quanlyphonghoc');
    if (!$db) {
      echo "Database connection faild";
    }
    $MaTB = $_POST['MaTB'];

	$db->query("DELETE FROM thietbi WHERE MaTB = '".$MaTB."'");