import 'Karyawan.dart';

class Perusahaan {
  List<Karyawan> karyawanAktif = [];
  List<Karyawan> karyawanNonAktif = [];

  void tambahkanKaryawan(Karyawan karyawan) {
    if (karyawanAktif.length < 20) {
      karyawanAktif.add(karyawan);
      print("${karyawan.nama} ditambahkan sebagai karyawan aktif.");
    } else {
      print("Maksimal 20 karyawan aktif dalam perusahaan.");
    }
  }

  void resignKaryawan(Karyawan karyawan) {
    if (karyawanAktif.contains(karyawan)) {
      karyawanAktif.remove(karyawan);
      karyawanNonAktif.add(karyawan);
      print("${karyawan.nama} telah resign dan statusnya berubah menjadi non-aktif.");
    }
  }
}
