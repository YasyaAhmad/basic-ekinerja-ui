<?php
include "../config/koneksi.php";
$id_karyawan = escape($_SESSION['id_karyawan']);
?>

<br>
<form class="form-horizontal" enctype="multipart/form-data" method="post" id="idform">


	<div class="form-group">
		<label for="address" class="col-sm-4 control-label">Tanggal</label>
		<div class="col-sm-2">
			<div class="input-group">
				<input class="form-control date-picker" id="tanggal1" name="tanggal1" value="<?= date('Y-m-d') ?>" type="text" data-date-format="yyyy-mm-dd" />
				<span class="input-group-addon">
					<i class="fa fa-calendar bigger-110"></i>
			</div>
		</div>
		<div class="col-sm-2">
			<div class="input-group">
				<input class="form-control date-picker" id="tanggal2" name="tanggal2" value="<?= date('Y-m-d') ?>" type="text" data-date-format="yyyy-mm-dd" />
				<span class="input-group-addon">
					<i class="fa fa-calendar bigger-110"></i>
				</span>
			</div>

		</div>

	</div>
</form>
<center><button class=" btn btn-primary" id="btampil">Tampilkan</button></center>
<form method="post" action="<?= $base_url ?>ssadmin/modul/cetak/cetak_riwayat_laporan.php" style="display: inline;">
	<input type="hidden" name="tanggal1a" id="tanggal1a">
	<input type="hidden" name="tanggal2a" id="tanggal2a">
	<button type="submit" class="btn btn-success" id="cetak" style="display: none;"> <i class="fa fa-print"></i>Cetak Laporan</button>
</form>
<form method="post" action="<?= $base_url ?>ssadmin/modul/cetak/excel_riwayat_laporan.php" style="display: inline;">
	<input type="hidden" name="tanggal1b" id="tanggal1b">
	<input type="hidden" name="tanggal2b" id="tanggal2b">
	<button type="submit" class="btn btn-warning" id="excel" style="display: none;"><i class="fa fa-download"></i>Export Excel</button>
</form>
<div id="tampildataku">

</div>


<script type="text/javascript">
	var main = "modul/karyawan/riwayat_laporan/";

	function kirim() {
		var atasan = $("#atasan1").val();
		alert(atasan);
	}
	$("#btampil").click(function() {
		var tanggal1 = escape($("#tanggal1").val());
		var tanggal2 = escape($("#tanggal2").val());
		$("#tanggal1a").val(tanggal1);
		$("#tanggal2a").val(tanggal2);
		$("#tanggal1b").val(tanggal1);
		$("#tanggal2b").val(tanggal2);
		$("#tampildataku").load(main + "dataharian.php?tanggal1=" + tanggal1 + "&tanggal2=" + tanggal2);

		$("#cetak").show();
		$("#excel").show();

	});

	$("#nama_karyawan").change(function() {

		var nama = escape($("#nama_karyawan").val());
		var tanggal1 = escape($("#tanggal1").val());
		var tanggal2 = escape($("#tanggal2").val());

		$("#tampildataku").load(main + "dataharian.php?nama_karyawan=" + nama + "&tanggal1=" + tanggal1 + "&tanggal2=" + tanggal2);

	});
	//$("#bproses").click(function(){
	//data = new FormData();
	//data.append('atasan1', $("#atasan1").val());

	//alert($("#atasan1").val());
	//	$("#tampildataku").load(main+"dataharian.php"); 

	//});

	function Sditerima(id = null, nm = null, tgl1 = null, tgl2 = null) {

		if (id) {
			$.ajax({
				url: main + "server.php?hal=sditerima",
				type: "post",
				data: {
					id: id
				},
				dataType: "json",
				success: function(response) {
					$("#tampildataku").load(main + "dataharian.php?nama_karyawan=" + escape(nm) + "&tanggal1=" + escape(tgl1) + "&tanggal2=" + escape(tgl2));
				},
				error: function(xhr, ajaxOptions, thrownError) { // Ketika terjadi error
					alert("ERROR : " + xhr.responseText); // Munculkan alert
				}
			});
			//});
		}
	}

	function Sditolak(id = null, nm = null, tgl1 = null, tgl2 = null) {
		if (id) {
			$.ajax({
				url: main + "server.php?hal=sditolak",
				type: "post",
				data: {
					id: id
				},
				dataType: "json",
				success: function(response) {
					$("#tampildataku").load(main + "dataharian.php?nama_karyawan=" + escape(nm) + "&tanggal1=" + escape(tgl1) + "&tanggal2=" + escape(tgl2));
				},
				error: function(xhr, ajaxOptions, thrownError) { // Ketika terjadi error
					alert("ERROR : " + xhr.responseText); // Munculkan alert
				}
			});
			//});
		}
	}

	$('.date-picker').datepicker({
		autoclose: true,
		todayHighlight: true
	});

	$('.chosen-select').chosen({
		allow_single_deselect: true
	});
	$('#chosen-multiple-style .btn').on('click', function(e) {
		var target = $(this).find('input[type=radio]');
		var which = parseInt(target.val());
		if (which == 2) $('#form-field-select-4').addClass('tag-input-style');
		else $('#form-field-select-4').removeClass('tag-input-style');
		$(".chosen-select").chosen({
			width: "inherit"
		});
	});

	$(".chosen-select").chosen({
		width: "95%"
	});
</script>
<style type="text/css">
	.chosen-container {
		width: 100% !important;
	}
</style>