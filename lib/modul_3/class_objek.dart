
mixin Presensi {
  void absen(String status) {
    print("Status presensi: $status");
  }
}

mixin Pengajar {
  void mengajar(String mataKuliah) {
    print("Mengajar mata kuliah $mataKuliah");
  }
}

mixin Peneliti {
  void meneliti(String topik) {
    print("Sedang meneliti tentang $topik");
  }
}

mixin PublikasiIlmiah {
  void publikasi(String judul) {
    print("Mempublikasikan jurnal berjudul '$judul'");
  }
}

class Mahasiswa {
  String? nama;
  int? nim;
  String? jurusan;

  void tampilkanData() {
    print("Nama: ${nama ?? 'Belum diisi'}");
    print("NIM: ${nim ?? 'Belum diisi'}");
    print("Jurusan: ${jurusan ?? 'Belum diisi'}");
  }
}

class Dosen with Presensi, Pengajar, Peneliti, PublikasiIlmiah {
  String? nama;
  String? nidn;
  String? jurusan;

  void tampilkanData() {
    print("Nama: $nama");
    print("NIDN: $nidn");
    print("Jurusan: $jurusan");
  }
}

class MahasiswaAktif extends Mahasiswa with Presensi, Peneliti, PublikasiIlmiah{
  int? semester;
  double? ipk;

  void isiKRS(int jumlahSks) {
    print("${nama ?? 'Mahasiswa'} mengisi KRS sebanyak $jumlahSks SKS.");
  }

  void tampilkanStatus() {
    print("Status: Mahasiswa Aktif");
    print("Semester: ${semester ?? 'Belum diisi'}");
    print("IPK: ${ipk ?? 'Belum diisi'}");
  }
}

class MahasiswaAlumni extends Mahasiswa {
  int? tahunLulus;
  String? pekerjaan;

  void cariKerja(String perusahaan) {
    print("${nama ?? 'Alumni'} melamar kerja di $perusahaan.");
  }

  void tampilkanStatus() {
    print("Status: Mahasiswa Alumni");
    print("Tahun Lulus: ${tahunLulus ?? 'Belum diisi'}");
    print("Pekerjaan: ${pekerjaan ?? 'Belum diisi'}");
  }
}

void main() {
  MahasiswaAktif mhs = MahasiswaAktif();
  mhs.nama = "Andi";
  mhs.nim = 123456;
  mhs.jurusan = "Informatika";
  mhs.semester = 4;
  mhs.ipk = 3.8;

  mhs.tampilkanData();
  mhs.tampilkanStatus();
  mhs.absen("Hadir");
  mhs.isiKRS(20);
  mhs.meneliti("Machine Learning");

  print("\n");

  Dosen dosen = Dosen();
  dosen.nama = "Dr. Budi";
  dosen.nidn = "987654321";
  dosen.jurusan = "Informatika";

  dosen.tampilkanData();
  dosen.absen("Hadir");
  dosen.mengajar("Pemrograman Berorientasi Objek");
  dosen.meneliti("Artificial Intelligence");
  dosen.publikasi("Implementasi AI di Pendidikan");

  print("\n");

  MahasiswaAlumni alumni = MahasiswaAlumni();
  alumni.nama = "Siti";
  alumni.nim = 654321;
  alumni.jurusan = "Sistem Informasi";
  alumni.tahunLulus = 2023;
  alumni.pekerjaan = "Software Developer";

  alumni.tampilkanData();
  alumni.tampilkanStatus();
}
