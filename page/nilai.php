<?php
$update = (isset($_GET['action']) AND $_GET['action'] == 'update') ? true : false;
if ($update) {
	$sql = $connection->query("SELECT * FROM nilai JOIN penilaian USING(kd_kriteria) WHERE kd_nilai='$_GET[key]'");
	$row = $sql->fetch_assoc();
}

if ($_SERVER["REQUEST_METHOD"] == "POST" AND isset($_POST["save"])) {
	$validasi = false; $err = false;
	if ($update) {
		$sql = "UPDATE nilai SET kd_kriteria='$_POST[kd_kriteria]', no_pendaftaran='$_POST[no_pendaftaran]', nilai='$_POST[nilai]' WHERE kd_nilai='$_GET[key]'";
	} else {
		$query = "INSERT INTO nilai VALUES ";
		foreach ($_POST["nilai"] as $kd_kriteria => $nilai) {
			$query .= "(NULL, '$_POST[kd_prodi]', '$kd_kriteria', '$_POST[no_pendaftaran]', '$nilai'),";
		}
		$sql = rtrim($query, ',');
		$validasi = true;
	}

	if ($validasi) {
		foreach ($_POST["nilai"] as $kd_kriteria => $nilai) {
			$q = $connection->query("SELECT kd_nilai FROM nilai WHERE kd_prodi=$_POST[kd_prodi] AND kd_kriteria=$kd_kriteria AND no_pendaftaran=$_POST[no_pendaftaran] AND nilai LIKE '%$nilai%'");
			if ($q->num_rows) {
				echo alert("Nilai untuk ".$_POST["no_pendaftaran"]." sudah ada!", "?page=nilai");
				$err = true;
			}
		}
	}

  if (!$err AND $connection->query($sql)) {
		echo alert("Berhasil!", "?page=nilai");
	} else {
		echo alert("Gagal!", "?page=nilai");
	}
}

if (isset($_GET['action']) AND $_GET['action'] == 'delete') {
  $connection->query("DELETE FROM nilai WHERE kd_nilai='$_GET[key]'");
	echo alert("Berhasil!", "?page=nilai");
}
?>
<div class="row">
	<div class="col-md-4">
	    <div class="panel panel-<?= ($update) ? "warning" : "info" ?>">
	        <div class="panel-heading"><h3 class="text-center"><?= ($update) ? "EDIT" : "TAMBAH" ?></h3></div>
	        <div class="panel-body">
	            <form action="<?=$_SERVER["REQUEST_URI"]?>" method="post">
									<div class="form-group">
										<label for="no_pendaftaran">Mahasiswa</label>
										<?php if ($_POST): ?>
											<input type="text" name="no_pendaftaran" value="<?=$_POST["no_pendaftaran"]?>" class="form-control" readonly="on">
										<?php else: ?>
											<select class="form-control" name="no_pendaftaran">
												<option>---</option>
												<?php $sql = $connection->query("SELECT * FROM camaba"); while ($data = $sql->fetch_assoc()): ?>
													<option value="<?=$data["no_pendaftaran"]?>" <?= (!$update) ? "" : (($row["no_pendaftaran"] != $data["no_pendaftaran"]) ? "" : 'selected="selected"') ?>><?=$data["no_pendaftaran"]?> | <?=$data["nama"]?></option>
												<?php endwhile; ?>
											</select>
										<?php endif; ?>
									</div>
									<div class="form-group">
	                  <label for="kd_prodi">Program Studi</label>
										<?php if ($_POST): ?>
											<?php $q = $connection->query("SELECT nama_prodi FROM prodi WHERE kd_prodi=$_POST[kd_prodi]"); ?>
											<input type="text"value="<?=$q->fetch_assoc()["nama_prodi"]?>" class="form-control" readonly="on">
											<input type="hidden" name="kd_prodi" value="<?=$_POST["kd_prodi"]?>">
										<?php else: ?>
											<select class="form-control" name="kd_prodi" id="prodi">
												<option>---</option>
												<?php $sql = $connection->query("SELECT * FROM prodi"); while ($data = $sql->fetch_assoc()): ?>
													<option value="<?=$data["kd_prodi"]?>"<?= (!$update) ? "" : (($row["kd_prodi"] != $data["kd_prodi"]) ? "" : 'selected="selected"') ?>><?=$data["nama_prodi"]?></option>
												<?php endwhile; ?>
											</select>
										<?php endif; ?>
									</div>
									<?php if ($_POST): ?>
										<?php $q = $connection->query("SELECT * FROM kriteria WHERE kd_prodi=$_POST[kd_prodi]"); while ($r = $q->fetch_assoc()): ?>
				                <div class="form-group">
					                  <label for="nilai"><?=ucfirst($r["nama"])?></label>
														<select class="form-control" name="nilai[<?=$r["kd_kriteria"]?>]" id="nilai">
															<option>---</option>
															<?php $sql = $connection->query("SELECT * FROM penilaian WHERE kd_kriteria=$r[kd_kriteria]"); while ($data = $sql->fetch_assoc()): ?>
																<option value="<?=$data["bobot_nilai"]?>" class="<?=$data["kd_kriteria"]?>"<?= (!$update) ? "" : (($row["kd_penilaian"] != $data["kd_penilaian"]) ? "" : ' selected="selected"') ?>><?=$data["keterangan"]?></option>
															<?php endwhile; ?>
														</select>
				                </div>
										<?php endwhile; ?>
										<input type="hidden" name="save" value="true">
									<?php endif; ?>
	                <button type="submit" id="simpan" class="btn btn-<?= ($update) ? "warning" : "info" ?> btn-block"><?=($_POST) ? "Simpan" : "Tampilkan"?></button>
	                <?php if ($update): ?>
										<a href="?page=nilai" class="btn btn-info btn-block">Batal</a>
									<?php endif; ?>
	            </form>
	        </div>
	    </div>
	</div>
	<div class="col-md-8">
	    <div class="panel panel-info">
	        <div class="panel-heading"><h3 class="text-center">DAFTAR</h3></div>
	        <div class="panel-body">
	            <table class="table table-condensed">
	                <thead>
	                    <tr>
	                        <th>No</th>
							<th>No. Pendaftaran</th>
							<th>Nama</th>
	                        <th>Program Studi</th>
	                        <th>Kriteria</th>
	                        <th>Nilai</th>
	                        <th></th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <?php $no = 1; ?>
	                    <?php if ($query = $connection->query("SELECT a.kd_nilai, c.nama_prodi AS nama_prodi, b.nama AS nama_kriteria, d.no_pendaftaran, d.nama AS nama_camaba, a.nilai FROM nilai a JOIN kriteria b ON a.kd_kriteria=b.kd_kriteria JOIN prodi c ON a.kd_prodi=c.kd_prodi JOIN camaba d ON d.no_pendaftaran=a.no_pendaftaran")): ?>
	                        <?php while($row = $query->fetch_assoc()): ?>
	                        <tr>
	                            <td><?=$no++?></td>
								<td><?=$row['no_pendaftaran']?></td>
								<td><?=$row['nama_camaba']?></td>
	                            <td><?=$row['nama_prodi']?></td>
	                            <td><?=$row['nama_kriteria']?></td>
	                            <td><?=$row['nilai']?></td>
	                            <td>
	                                <div class="btn-group">
	                                    <a href="?page=nilai&action=update&key=<?=$row['kd_nilai']?>" class="btn btn-warning btn-xs">Edit</a>
	                                    <a href="?page=nilai&action=delete&key=<?=$row['kd_nilai']?>" class="btn btn-danger btn-xs">Hapus</a>
	                                </div>
	                            </td>
	                        </tr>
	                        <?php endwhile ?>
	                    <?php endif ?>
	                </tbody>
	            </table>
	        </div>
	    </div>
	</div>
</div>
<script type="text/javascript">
$("#kriteria").chained("#prodi");
$("#nilai").chained("#kriteria");
</script>
