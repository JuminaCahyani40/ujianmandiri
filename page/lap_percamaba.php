<div class="row">
	<div class="col-md-12">
	    <div class="panel panel-info">
	        <div class="panel-heading"><h3 class="text-center">Laporan Nilai Per Calon Mahasiswa Baru</h3></div>
	        <div class="panel-body">
							<form class="form-inline" action="<?=$_SERVER["REQUEST_URI"]?>" method="post">
								<label for="mhs">Calon Mahasiswa Baru :</label>
								<select class="form-control" name="camaba">
									<option> --- </option>
									<?php $q = $connection->query("SELECT * FROM camaba WHERE no_pendaftaran IN(SELECT no_pendaftaran FROM hasil)"); while ($r = $q->fetch_assoc()): ?>
										<option value="<?=$r["no_pendaftaran"]?>"><?=$r["no_pendaftaran"]?> | <?=$r["nama"]?></option>
									<?php endwhile; ?>
								</select>
								<button type="submit" class="btn btn-primary">Tampilkan</button>
							</form>
	            				<?php if ($_SERVER["REQUEST_METHOD"] == "POST"): ?>
								<?php
								$q = $connection->query("SELECT b.kd_prodi, b.nama, h.nilai, (SELECT MAX(nilai) FROM hasil WHERE no_pendaftaran=h.no_pendaftaran) AS nilai_max FROM camaba m JOIN hasil h ON m.no_pendaftaran=h.no_pendaftaran JOIN prodi b ON b.kd_prodi=h.kd_prodi WHERE m.no_pendaftaran=$_POST[camaba]");
								$prodi = []; $data = [];
								while ($r = $q->fetch_assoc()) {
									$prodi[$r["kd_prodi"]] = $r["nama"];
									$data[$r["kd_prodi"]][] = $r["nilai"];
									$max = $r["nilai_max"];
								}
								?>
								<hr>
								<table class="table table-condensed">
									<tbody>
										<?php $query = $connection->query("SELECT DISTINCT(p.kd_prodi), k.nama, n.nilai FROM nilai n JOIN penilaian p USING(kd_kriteria) JOIN kriteria k USING(kd_kriteria) WHERE n.no_pendaftaran=$_POST[camaba] AND n.kd_prodi=1"); while ($r = $query->fetch_assoc()): ?>
											<tr>
												<th><?=$r["nama"]?></th>
												<td>: <?=number_format($r["nilai"], 8)?></td>
											</tr>
										<?php endwhile; ?>
									</tbody>
								</table>
								<hr>
								<table class="table table-condensed">
		                <thead>
		                    <tr>
													<?php foreach ($prodi as $key => $val): ?>
			                       					 <th><?=$val?></th>
													<?php endforeach; ?>
													<th>Nilai Maksimal</th>
		                    </tr>
		                </thead>
		                <tbody>
											<tr>
                        <?php foreach($prodi as $key => $val): ?>
	                        <?php foreach($data[$key] as $v): ?>
															<td><?=number_format($v, 8)?></td>
													<?php endforeach ?>
												<?php endforeach ?>
												<td><?=number_format($max, 8)?></td>
											</tr>
		                </tbody>
		            </table>
	            <?php endif; ?>
	        </div>
	    </div>
	</div>
</div>

