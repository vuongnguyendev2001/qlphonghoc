<?php
    $db = mysqli_connect('localhost','root','','quanlyphonghoc');
    if (!$db) {
      echo "Database connection faild";
    }
    $MaPH = $_POST['MaPH'];
    $db->query("CALL xoaphong('".$MaPH."');");