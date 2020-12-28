-- Normalisasi
SELECT
	nilai.kd_kriteria,
    kriteria.sifat,
    (SELECT bobot FROM bobot_kriteria WHERE kd_kriteria=kriteria.kd_kriteria AND kd_prodi=prodi.kd_prodi) AS bobot_kriteria,
	ROUND(IF(kriteria.sifat='max', MAX(nilai.nilai), MIN(nilai.nilai)), 1) AS normalization
FROM nilai
JOIN kriteria USING(kd_kriteria)
JOIN prodi ON kriteria.kd_prodi=prodi.kd_prodi
WHERE prodi.kd_prodi=1
GROUP BY nilai.kd_kriteria

-- Rangking
SELECT
	(SELECT nama FROM camaba WHERE no_pendaftaran=mhs.no_pendaftaran) AS nama,
	(SELECT no_pendaftaran FROM camaba WHERE no_pendaftaran=mhs.no_pendaftaran) AS no_pendaftaran,
	(SELECT tahun_lulus FROM camaba WHERE no_pendaftaran=mhs.no_pendaftaran) AS tahun,
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
			nilai.kd_kriteria,
		    kriteria.sifat,
		    (SELECT bobot FROM bobot_kriteria WHERE kd_kriteria=kriteria.kd_kriteria AND kd_prodi=prodi.kd_prodi) AS bobot,
			ROUND(IF(kriteria.sifat='max', MAX(nilai.nilai), MIN(nilai.nilai)), 1) AS normalization
		FROM nilai
		JOIN kriteria USING(kd_kriteria)
		JOIN prodi ON kriteria.kd_prodi=prodi.kd_prodi
		WHERE prodi.kd_prodi=1
		GROUP BY nilai.kd_kriteria
	) c USING(kd_kriteria)
WHERE kd_prodi=1
GROUP BY nilai.no_pendaftaran
ORDER BY rangking DESC

-- Rangking dengan menampilkan nilai perkriteria
SELECT
	(SELECT nama FROM camaba WHERE no_pendaftaran=mhs.no_pendaftaran) AS nama,
	(SELECT no_pendaftaran FROM camaba WHERE no_pendaftaran=mhs.no_pendaftaran) AS no_pendaftaran,
	(SELECT tahun_lulus FROM camaba WHERE no_pendaftaran=mhs.no_pendaftaran) AS tahun,
	SUM(
		IF(
			c.kd_kriteria=1,
			IF(c.sifat='max', nilai.nilai/c.normalization, c.normalization / nilai.nilai), 0
		)
	) AS C1,
	SUM(
		IF(
			c.kd_kriteria=2,
			IF(c.sifat='max', nilai.nilai/c.normalization, c.normalization / nilai.nilai), 0
		)
	) AS C2,
	SUM(
		IF(
			c.kd_kriteria=3,
			IF(c.sifat='max', nilai.nilai/c.normalization, c.normalization / nilai.nilai), 0
		)
	) AS C3,
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
			nilai.kd_kriteria,
		    kriteria.sifat,
		    (SELECT bobot FROM bobot_kriteria WHERE kd_kriteria=kriteria.kd_kriteria AND kd_prodi=prodi.kd_prodi) AS bobot,
			ROUND(IF(kriteria.sifat='max', MAX(nilai.nilai), MIN(nilai.nilai)), 1) AS normalization
		FROM nilai
		JOIN kriteria USING(kd_kriteria)
		JOIN prodi ON kriteria.kd_prodi=prodi.kd_prodi
		WHERE prodi.kd_prodi=1
		GROUP BY nilai.kd_kriteria
	) c USING(kd_kriteria)
WHERE kd_prodi=1
GROUP BY nilai.no_pendaftaran
ORDER BY rangking DESC
