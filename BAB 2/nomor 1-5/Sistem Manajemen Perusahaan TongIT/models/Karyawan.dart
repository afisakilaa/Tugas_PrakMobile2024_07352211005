import '../enums/Peran.dart';
import '../mixins/Kinerja.dart';

abstract class Karyawan {
  String nama;
  int umur;
  Peran peran;

  Karyawan(this.nama, {required this.umur, required this.peran});

  void bekerja();
}

class KaryawanTetap extends Karyawan {
  KaryawanTetap(String nama, {required int umur, required Peran peran})
      : super(nama, umur: umur, peran: peran);

  @override
  void bekerja() {
    print('$nama (Karyawan Tetap) bekerja pada hari kerja reguler.');
  }
}

class KaryawanKontrak extends Karyawan {
  KaryawanKontrak(String nama, {required int umur, required Peran peran})
      : super(nama, umur: umur, peran: peran);

  @override
  void bekerja() {
    print('$nama (Karyawan Kontrak) bekerja pada proyek tertentu.');
  }
}

class KaryawanManager extends Karyawan with Kinerja {
  KaryawanManager(String nama, {required int umur, required Peran peran})
      : super(nama, umur: umur, peran: peran) {
    if (peran == Peran.Manager && produktivitas < 85) {
      produktivitas = 85;
    }
  }

  @override
  void bekerja() {
    print('$nama (Manager) bekerja untuk mengelola tim.');
  }
}
