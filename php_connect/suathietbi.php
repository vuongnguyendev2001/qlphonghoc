<?php
    $db = mysqli_connect('localhost','root','','quanlyphonghoc');
    if (!$db) {
      echo "Database connection faild";
    }
    $MaTB = $_POST['MaTB'];
    $TenTB = $_POST['TenTB'];
    $TenNhanHieu = $_POST['TenNhanHieu'];
    $SoLuong = $_POST['SoLuong'];
    $MaPH = $_POST['MaPH'];

    $db->query("UPDATE thietbi SET 
    TenTB = '".$TenTB."',TenNhanHieu = '".$TenNhanHieu."'
    ,SoLuong = '".$SoLuong."',MaPH = '".$MaPH."' WHERE MaTB = '".$MaTB."'");

