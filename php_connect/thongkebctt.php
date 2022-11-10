<?php
    $db = mysqli_connect('localhost','root','','quanlyphonghoc');
    if (!$db) {
		echo "Database connection faild";
	}

    $dbltb = $db->query("SELECT phonghoc.MaPH, phonghoc.TenPH, thietbi.MaTB, thietbi.TenTB,loaithietbi.MaLTB, loaithietbi.TenLTB, bctinhtrang.MaTT, bctinhtrang.NoidungBC, bctinhtrang.NgayBC 
    FROM phonghoc 
    INNER JOIN thietbi ON phonghoc.MaPH = thietbi.MaPH 
    INNER JOIN loaithietbi ON thietbi.MaTB = loaithietbi.MaTB 
    INNER JOIN bctinhtrang on loaithietbi.MaLTB = bctinhtrang.MaLTB;");
    $result = array();

    while($rowData = $dbltb->fetch_assoc()){
        $result[] = $rowData;
    }
    echo json_encode($result);


