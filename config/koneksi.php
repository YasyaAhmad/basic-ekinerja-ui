<?php
	$server = "localhost";
	$user = "root";
	$password = "";
	$database = "ekinerja_db";

	$koneksi = mysqli_connect($server,$user,$password,$database)or die(mysqli_error($koneksi));



	$base_url = "http://localhost/ekinerja/ssadmin/";
	$logo = "../assets/images/logounindra.png";
	$nama_aplikasi = "E-Kinerja - Kelompok 4";

	@$halaman = $_GET['halaman'];
	if($halaman == "data_user"){
		@$title = "Data User | ";
	}else{
		$title = "";
	}
	@$title = $title.$nama_aplikasi;
