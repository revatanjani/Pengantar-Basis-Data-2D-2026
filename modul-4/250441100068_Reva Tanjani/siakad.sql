CREATE DATABASE siakad;

CREATE TABLE mata_kuliah(
id_mata_kuliah INT PRIMARY KEY,
nama_mk VARCHAR(100),
sks INT
);


CREATE TABLE mahasiswa(
id_mahasiswa INT PRIMARY KEY,
nama_mahasiswa VARCHAR(100),
program_studi VARCHAR(100),
angkatan INT
);

CREATE TABLE krs(
id_krs INT PRIMARY KEY,
id_mata_kuliah INT,
id_mahasiswa INT,
semester_ambil INT,

FOREIGN KEY (id_mata_kuliah) REFERENCES mata_kuliah(id_mata_kuliah),
FOREIGN KEY (id_mahasiswa) REFERENCES mahasiswa(id_mahasiswa)
);

CREATE TABLE dosen(
id_dosen INT PRIMARY KEY,
id_mata_kuliah INT,
nama_dosen VARCHAR(100),
bidang_keahlian VARCHAR(100),

FOREIGN KEY (id_mata_kuliah) REFERENCES mata_kuliah(id_mata_kuliah)
);

INSERT INTO mahasiswa VALUES
(2201, 'Dhani Kusuma', 'Sistem Informasi', 2022),
(2202, 'Rizky Pratama', 'Sistem Informasi', 2022),
(2301, 'Andi Wijaya', 'Sistem Informasi', 2023),
(2302, 'Bunga Citra', 'Sistem Informasi', 2023),
(2303, 'Dimas Anggara', 'Sistem Informasi', 2023),
(2401, 'Candra Gupta', 'Sistem Informasi', 2024),
(2402, 'Dedi Kurniawan', 'Sistem Informasi', 2024),
(2501, 'Farah Nabila', 'Sistem Informasi', 2025),
(2502, 'Gibran Rakabumi', 'Sistem Informasi', 2025),
(2503, 'Hani Safira', 'Sistem Informasi', 2025),
(2504, 'Irfan Bachdim', 'Sistem Informasi', 2025),
(2505, 'Joko Anwar', 'Sistem Informasi', 2025);


INSERT INTO mata_kuliah VALUES
(1, 'Algoritma & Pemrograman', 4),
(2, 'Basis Data Terdistribusi', 3),
(3, 'Struktur Data', 3),
(4, 'Jaringan Komputer', 3),
(5, 'Kecerdasan Buatan', 3),
(6, 'Sistem Informasi Akuntansi', 2),
(7, 'Pemrograman Web Native', 3),
(8, 'Keamanan Informasi', 3),
(9, 'Etika Profesi IT', 2),
(10, 'Administrasi Basis Data', 3);


INSERT INTO dosen VALUES
(1, 1, 'Dr. Budi', 'Pemrograman'),
(2, 2, 'Prof. Siti', 'Basis Data'),
(3, 4, 'Ir. Ahmad', 'Jaringan'),
(4, 1, 'Dian, M.Kom', 'Pemrograman'),
(5, 5, 'Eko, S.T', 'Kecerdasan Buatan'),
(6, 2, 'Rina, M.T', 'Basis Data'),
(7, 8, 'Hadi, Ph.D', 'Keamanan Siber'),
(8, 6, 'Siska, M.SI', 'Sistem Informasi'),
(9, 1, 'Bambang, M.Kom', 'Pemrograman'),
(10, 9, 'Laila, M.T', 'Manajemen Proyek');


INSERT INTO krs VALUES
(101, 1, 2301, 3),
(102, 2, 2301, 3),
(103, 5, 2201, 5),
(104, 4, 2302, 3),
(105, 1, 2401, 1),
(106, 7, 2402, 2),
(107, 10, 2202, 5),
(108, 6, 2303, 4),
(109, 8, 2201, 6),
(110, 3, 2401, 1);

select mk.nama_mk,mk.sks, d.bidang_keahlian,d.nama_dosen
from mata_kuliah mk
join dosen d
on mk.id_mata_kuliah = d.id_dosen
where d.bidang_keahlian in ('pemrograman','basis data');


SELECT m.nama_mahasiswa, k.id_mata_kuliah
FROM mahasiswa m
left JOIN krs k
ON m.id_mahasiswa = k.id_mahasiswa
;

select m.nama_mahasiswa, mk.nama_mk, k.semester_ambil
from mahasiswa m
join krs k
on m.id_mahasiswa = k.id_mahasiswa
join mata_kuliah mk
on mk.id_mata_kuliah = k.id_mata_kuliah
where k.semester_ambil between 3 and 5 order by semester_ambil asc;

select m.nama_mahasiswa,mk.nama_mk, mk.sks, m.program_studi
from mahasiswa m
join krs k
on m.id_mahasiswa = k.id_mahasiswa
join mata_kuliah mk
on mk.id_mata_kuliah = k.id_mata_kuliah
where program_studi = 'Sistem Informasi'
and sks > 2
order by sks desc, nama_mahasiswa asc;

select m.nama_mahasiswa,m.angkatan, mk.nama_mk, d.nama_dosen
from mahasiswa m
join krs k
on m.id_mahasiswa = k.id_mahasiswa
join mata_kuliah mk
on mk.id_mata_kuliah = k.id_mata_kuliah
join dosen d 
on d.id_dosen = mk.id_mata_kuliah
where d.nama_dosen in ('Dr. Budi','Prof. Siti')
order by angkatan desc;