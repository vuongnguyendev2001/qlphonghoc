<?php
    $db = mysqli_connect('localhost','root','','quanlyphonghoc');
    if (!$db) {
      echo "Database connection fail";
    }
    $MaTT = $_POST['MaTT'];
    $sql = $db->query("select ttSuaChua('".$MaTT."') as TinhTrang;");
    $result = array();
    while( $row = $sql->fetch_assoc() ) {
       $result[] = $row;
    }
    echo json_encode($result);