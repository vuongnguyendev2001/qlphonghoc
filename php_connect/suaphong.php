<?php
    $db = mysqli_connect('localhost','root','','quanlyphonghoc');
    if (!$db) {
      echo "Database connection faild";
    }
    $MaPH = $_POST['MaPH'];
    $TenPH = $_POST['TenPH'];
    $Tang = $_POST['Tang'];

    $db->query("UPDATE phonghoc SET TenPH = '".$TenPH."',
    Tang = '".$Tang."' WHERE MaPH = '".$MaPH."'");

