<?php
    include "koneksi.php";

    $id = $_GET['id_trans'];
    $code = $_POST['codec'];
    $desc = $_POST['description'];
    $seat = $_POST['seatc'];
    $id_ty = $_POST['id_trans_type'];
    $id_cat = $_POST['id_cat'];
    $sql = mysqli_query($conn, 'update trans set code="'.$code.'", description="'.$desc.'", seat="'.$seat.'", id_trans_type="'.$id_ty.'", id_cat="'.$id_cat.'" where id_trans="'.$id.'" ');
    
    if($sql) {
        echo "<script>window.alert('Data berhasil di Edit');window.location.href='trans.php';</script>";
    } else {
        echo "<script>window.alert('Data Gagal');window.close();</script>";
    }
?>
