<div class="row">
	<div class="col-md-12">
	<?php if (isset($_GET["prodi"])) {
		$sqlKriteria = "";
		$namaKriteria = [];
		$queryKriteria = $connection->query("SELECT a.kd_kriteria, a.nama FROM kriteria a JOIN bobot_kriteria b USING(kd_kriteria) WHERE b.kd_prodi=$_GET[prodi]");
		while ($kr = $queryKriteria->fetch_assoc()) {
			$sqlKriteria .= "SUM(
				IF(
					c.kd_kriteria=".$kr["kd_kriteria"].",
					IF(c.sifat='max', nilai.nilai/c.normalization, c.normalization/nilai.nilai), 0
				)
			) AS ".strtolower(str_replace(" ", "_", $kr["nama"])).",";
			$namaKriteria[] = strtolower(str_replace(" ", "_", $kr["nama"]));
		}
		$sql = "SELECT
			(SELECT nama FROM camaba WHERE no_pendaftaran=mhs.no_pendaftaran) AS nama,
			(SELECT no_pendaftaran FROM camaba WHERE no_pendaftaran=mhs.no_pendaftaran) AS no_pendaftaran,
			(SELECT tahun_lulus FROM camaba WHERE no_pendaftaran=mhs.no_pendaftaran) AS tahun,
			$sqlKriteria
			SUM(
				IF(
						c.sifat = 'max',
						nilai.nilai / c.normalization,
						c.normalization / nilai.nilai
				) * c.bobot
			) AS rangking
		FROM
			nilai
			JOIN camaba mhs USING(no_pendaftaran)
			JOIN (
				SELECT
						nilai.kd_kriteria AS kd_kriteria,
						kriteria.sifat AS sifat,
						(
							SELECT bobot FROM bobot_kriteria WHERE kd_kriteria=kriteria.kd_kriteria AND kd_prodi=prodi.kd_prodi
						) AS bobot,
						ROUND(
							IF(kriteria.sifat='max', MAX(nilai.nilai), MIN(nilai.nilai)), 1
						) AS normalization
					FROM nilai
					JOIN kriteria USING(kd_kriteria)
					JOIN prodi ON kriteria.kd_prodi=prodi.kd_prodi
					WHERE prodi.kd_prodi=$_GET[prodi]
				GROUP BY nilai.kd_kriteria
			) c USING(kd_kriteria)
		WHERE kd_prodi=$_GET[prodi]
		GROUP BY nilai.no_pendaftaran
		ORDER BY rangking DESC"; ?>
	  <div class="panel panel-info">
	      <div class="panel-heading"><h3 class="text-center"><h2 class="text-center"><?php $query = $connection->query("SELECT * FROM prodi WHERE kd_prodi=$_GET[beasiswa]"); echo $query->fetch_assoc()["nama_prodi"]; ?></h2></h3></div>
	      <div class="panel-body">
	          <table class="table table-condensed table-hover">
	              <thead>
	                  <tr>
							<th>NIM</th>
							<th>Nama</th>
							<?php //$query = $connection->query("SELECT nama FROM kriteria WHERE kd_prodi=$_GET[prodi]"); while($row = $query->fetch_assoc()): ?>
								<!-- <th><?//=$row["nama"]?></th> -->
							<?php //endwhile ?>
							<th>Nilai</th>
	                  </tr>
	              </thead>
	              <tbody>
					<?php $query = $connection->query($sql); while($row = $query->fetch_assoc()): ?>
					<?php
					$rangking = number_format((float) $row["rangking"], 8, '.', '');
					$q = $connection->query("SELECT no_pendaftaran FROM hasil WHERE no_pendaftaran='$row[no_pendaftaran]' AND kd_prodi='$_GET[prodi]' AND tahun_lulus='$row[tahun_lulus]'");
					if (!$q->num_rows) {
					$connection->query("INSERT INTO hasil VALUES(NULL, '$_GET[prodi]', '$row[no_pendaftaran]', '".$rangking."', '$row[tahun_lulus]')");
					}
					?>
					<tr>
						<td><?=$row["no_pendaftaran"]?></td>
						<td><?=$row["nama"]?></td>
						<?php for($i=0; $i<count($namaKriteria); $i++): ?>
						<!-- <th><?//=number_format((float) $row[$namaKriteria[$i]], 8, '.', '');?></th> -->
						<?php endfor ?>
						<td><?=$rangking?></td>
					</tr>
					<?php endwhile;?>
	              </tbody>
	          </table>
	      </div>
	  </div>
	<?php } else { ?>
		<h1>Silahkan Pilih Prodi Yang Lain...</h1>
	<?php } ?>
	</div>
</div>
