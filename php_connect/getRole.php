<?php 
  $db = mysqli_connect('localhost','root','','quanlyphonghoc');
    if (!$db) {
      echo "Database connection faild";
    }
    $db->query("SELECT Role FROM user WHERE ");