USE KampusDB

--Cross Join
--menampilkan semua kombinasi Mahasiswa dan Matakuliah
SELECT NamaMahasiswa FROM Mahasiswa
SELECT NamaMK FROM MataKuliah

SELECT M.NamaMahasiswa, MK.NamaMK
FROM Mahasiswa AS M
CROSS Join MataKuliah AS MK;

--MEnampilkan semua kombinasi dosen dan ruangan
SELECT D.NamaDosen, R.KodeRuangan
FROM Dosen D
CROSS join Ruangan R;

-- LEfT JOIn 
--menampilkan semua mahasiswa teramsuk yang belum menagmbil krs
SELECT M.NamaMahasiswa, K.MataKuliahID
FROM Mahasiswa M
LEFT Join KRS K ON M.MahasiswaID = K.MahasiswaID;

--MENGAMBIL SEMUA MATAKULIAH YANG BELUM PUNYA JADWAL
SELECT MK.NamaMK,J.Hari
FROM MataKuliah MK
LEFT Join JadwalKuliah J ON MK.MataKuliahID = J.MataKuliahID;

--RIGHT Join 
-- MEnampilkan semua jadwal,walaupun tidak ada matakuliah
SELECT MK.NamaMK, J.Hari
FROM MataKuliah MK
RIGHT Join JadwalKuliah J ON MK.MataKuliahID = J.MataKuliahID;

--MEnampilakan semua ruangan, apakah dipakai atau tidak
SELECT R.KodeRuangan, J.Hari
FROM JadwalKuliah J
RIGHT Join Ruangan R ON J.RuanganID = R.RuanganID;

--INER JOIN
--MEnampilkan nama mahsiswa dan matakuliahnya tetapi lewat tabel krs
SELECT *FROM Mahasiswa
SELECT *FROM Matakuliah
SELECT *FROM KRS

SELECT M.NamaMahasiswa, MK.NamaMK
FROM KRS K
INNER Join Mahasiswa M ON K.MahasiswaID = M.MahasiswaID
INNER Join Matakuliah MK ON K.MatakuliahID = MK.MAtakuliahID

--MEnampilkan Matakuliah dan dosen pengampu 
SELECT MK.NamaMK, D.NamaDosen
FROM MataKuliah MK 
Join Dosen D ON MK.DosenID = D.DosenID

--Menampilkan jadwal lengkap 
SELECT MK.NamaMK, D.NamaDosen, R.KodeRuangan, J.Hari
FROM JadwalKuliah J 
INNER Join MataKuliah MK ON J.MataKuliahID = MK.MataKuliahID
INNER Join Dosen D ON J.DosenID = D.DosenID
INNER Join Ruangan R ON J.RuanganID = R.RuanganID

-- Menampilkan Nama Mahasiswa dan Nilai Akhirnya 
SELECT M.NamaMahasiswa, MK.NamaMK, N.NilaiAkhir
FROM Nilai N 
INNER Join Mahasiswa M ON N.MahasiswaID = M.MahasiswaID
INNER Join MataKuliah MK ON N.MataKuliahID = MK.MataKuliahID

--Menampilkan dosen dan matakuliah di ajar 
SELECT D.NamaDosen, MK.NamaMK
FROM Dosen D
INNER Join MataKuliah MK  ON D.DosenID = MK.DosenID


--MEnampilkan nama mahsiswa  dan nilai akhir
SELECT M.NamaMahasiswa, N.NilaiAkhir
FROM Mahasiswa M 
INNER Join Nilai N  ON M.MahasiswaID = N.MahasiswaID

--SELF JOIN'
--Mencaari pasangan mahasiswa dari prodi sama
SELECT A.NamaMahasiswa  AS Mahasiswa1,
		B.NamaMahasiswa AS Mahasisaw2,
		A.Prodi 
FROM Mahasiswa A 
INNER Join Mahasiswa B ON A.Prodi = B.Prodi
WHERE A.MahasiswaID < B.MahasiswaID; --Agar gaada pasangan yang sama  dan jika tidak mengggunakan where akan menampilkan semua

--Latihan
--1.Tampilkan nama mahasiswa (NamaMahasiswa) beserta prodi-nya (Prodi) dari tabel Mahasiswa,tetapi hanya mahasiswa yang memiliki nilai di tabel Nilai.
SELECT M.NamaMahasiswa, M.Prodi, N.NilaiAkhir
FROM Mahasiswa M
INNER JOIN Nilai N ON M.MahasiswaID = N.MahasiswaID;

--2.Tampilkan nama dosen(NamaDosen) dan ruangan(KodeRuangan) tempat dosen tersebut mengajar
SELECT D.NamaDosen, R.KodeRuangan
FROM JadwalKuliah J
INNER JOIN Dosen D ON J.DosenID = D.DosenID
INNER JOIN Ruangan R ON J.RuanganID = R.RuanganID;

--3.Tampilkan daftar mahasiswa (NamaMahasiswa) yang mengambil suatu mata kuliah(NamaMK) beserta nama mata kuliah dan dosen pengampu-nya(NamaDosen)
SELECT M.NamaMahasiswa, MK.NamaMK, D.NamaDosen
FROM KRS K
INNER JOIN Mahasiswa M ON K.MahasiswaID = M.MahasiswaID
INNER JOIN MataKuliah MK ON K.MataKuliahID = MK.MataKuliahID
INNER JOIN Dosen D ON MK.DosenID = D.DosenID;

--4. Tampilkan jadwal kuliah berisi nama mata kuliah(NamaMK), nama dosen(NamaDosen), dan hari kuliah(Hari) tetapi tidak perlu menampilkan ruangan.
SELECT MK.NamaMK, D.NamaDosen, J.Hari
FROM JadwalKuliah J
INNER JOIN MataKuliah MK ON J.MataKuliahID = MK.MataKuliahID
INNER JOIN Dosen D ON J.DosenID = D.DosenID;

--5. Tampilkan nilai mahasiswa(NilaiAkhir) lengkap dengan nama mahasiswa(NamaMahasiswa) nama mata kuliah (NamaMK) , nama dosen pengampu(NamaDosen) dan nilai akhirnya(NilaiAkhir)
SELECT M.NamaMahasiswa, MK.NamaMK, D.NamaDosen, N.NilaiAkhir
FROM Nilai N
INNER JOIN Mahasiswa M ON N.MahasiswaID = M.MahasiswaID
INNER JOIN MataKuliah MK ON N.MataKuliahID = MK.MataKuliahID
INNER JOIN Dosen D ON MK.DosenID = D.DosenID;