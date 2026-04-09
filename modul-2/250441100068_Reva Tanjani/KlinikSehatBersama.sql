CREATE TABLE dokter(
id_dokter INT PRIMARY KEY,
nama_dokter VARCHAR(100),
spesialis VARCHAR(100)
);

CREATE TABLE pasien(
id_pasien INT PRIMARY KEY,
nama_pasien VARCHAR(100),
tanggal_lahir DATE,
no_telephone VARCHAR (12)
);
CREATE TABLE rekam_medis(
id_rekam INT PRIMARY KEY,
id_pasien INT,
id_dokter INT,
tanggal_periksa DATE,
diagnosis VARCHAR (1000),


FOREIGN KEY (id_pasien) REFERENCES pasien(id_pasien)
ON DELETE RESTRICT,

FOREIGN KEY (id_dokter) REFERENCES dokter(id_dokter)
ON DELETE RESTRICT
);	

INSERT INTO dokter VALUES
(1, 'Dr. Fuad', 'Umum'),
(2, 'Dr. Nasir', 'Kulit');

INSERT INTO pasien VALUES
(1, 'Nafis', '2005-08-21', '08123456789'),
(2, 'Amba', '2006-05-10', '08237777890');

INSERT INTO rekam_medis VALUES
(1, 1, 1, '2026-04-04', 'Flu'),
(2, 2, 2, '2026-04-02', 'Sakit Panu');

UPDATE pasien
SET no_telephone = '08987654321'
WHERE id_pasien = '1';

UPDATE dokter
SET spesialis = 'Dermatologi'
WHERE id_dokter = '2';

DELETE FROM rekam_medis
WHERE id_rekam = 1;

INSERT INTO rekam_medis VALUES
(1, 1, 1, '2026-04-01', 'Flu'),
(2, 2, 1, '2026-04-02', 'Batuk');

DELETE FROM dokter
WHERE id_dokter = 1;

TRUNCATE TABLE rekam_medis;
TRUNCATE TABLE pasien;
