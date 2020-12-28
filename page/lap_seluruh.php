<div class="row">
	<div class="col-md-12">
	    <div class="panel panel-info">
	        <div class="panel-heading"><h3 class="text-center">Laporan Nilai Seluruh Mahasiswa</h3></div>
	        <div class="panel-body">
				<form class="form-inline" action="<?=$_SERVER["REQUEST_URI"]?>" method="post">
					<label for="tahun">Tahun :</label>
					<select class="form-control" name="tahun">
						<option>---</option>
						<option value="2017">2017</option>
					</select>
					<button type="submit" class="btn btn-primary">Tampilkan</button>
				</form> 
	            <?php if ($_SERVER["REQUEST_METHOD"] == "POST"): ?>
				<?php
				$q = $connection->query("SELECT b.kd_prodi, b.nama_prodi, h.nilai, m.nama AS camaba, m.no_pendaftaran, (SELECT MAX(nilai) FROM hasil WHERE no_pendaftaran=h.no_pendaftaran) AS nilai_max FROM camaba m JOIN hasil h ON m.no_pendaftaran=h.no_pendaftaran JOIN prodi b ON b.kd_prodi=h.kd_prodi WHERE m.tahun_lulus='$_POST[tahun]'");
				$prodi = []; $data = []; $d = [];
				while ($r = $q->fetch_assoc()) {
					$prodi[$r["kd_prodi"]] = $r["nama_prodi"];
					$s = $connection->query("SELECT b.nama, a.nilai FROM hasil a JOIN prodi b USING(kd_prodi) WHERE a.no_pendaftaran=$r[no_pendaftaran] AND a.tahun_lulus=$_POST[tahun]");
					while ($rr = $s->fetch_assoc()){
						$d[$rr['nama']] = $rr['nilai'];
					}
					$m = max($d);
					$k = array_search($m, $d);
					$data[$r["no_pendaftaran"]."-".$r["camaba"]."-".$r["nilai_max"]."-".$k][$r["kd_prodi"]] = $r["nilai"];
				}
				?>
				<hr>
				<table class="table table-condensed">
	                <thead>
	                    <tr>
							<th>No. Pendaftaran</th>
							<th>Nama</th>
							<?php foreach ($prodi as $val): ?>
		                        <th><?=$val?></th>
							<?php endforeach; ?>
							<th>Nilai Maksimal</th>
							<th>Lolos ke Prodi</th>
	                    </tr>
	                </thead>
					<tbody>
					<?php foreach($data as $key => $val): ?>
						<tr>
							<?php $x = explode("-", $key); ?>
							<td><?=$x[0]?></td>
							<td><?=$x[1]?></td>
							<?php foreach ($val as $v): ?>
								<td><?=number_format($v, 8)?></td>
							<?php endforeach; ?>
							<td><?=number_format($x[2], 8)?></td>
							<td><?=$x[3]?></td>
						</tr>
					<?php endforeach ?>
					</tbody>
		            </table>
	            <?php endif; ?>
	        </div>
	    </div>
	</div>
</div>
