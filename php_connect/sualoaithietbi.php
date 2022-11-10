<?php
    $db = mysqli_connect('localhost','root','','quanlyphonghoc');
    if (!$db) {
      echo "Database connection faild";
    }
    $MaLTB = $_POST['MaLTB'];
    $TenLTB = $_POST['TenLTB'];
    $NgayLap = $_POST['NgayLap'];
    $MaTB = $_POST['MaTB'];

    $db->query("UPDATE loaithietbi SET 
    TenLTB = '".$TenLTB."',NgayLap = '".$NgayLap."'
    ,MaTB = '".$MaTB."' WHERE MaLTB = '".$MaLTB."'");

