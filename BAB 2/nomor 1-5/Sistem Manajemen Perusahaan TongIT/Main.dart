import 'models/Perusahaan.dart';
import 'models/Karyawan.dart';
import 'models/Proyek.dart';
import 'enums/Peran.dart';

void main() {
  // Membuat objek perusahaan
  var perusahaan = Perusahaan();

  // Menambahkan karyawan tetap dan kontrak
  var dev1 = KaryawanTetap("Andi", umur: 28, peran: Peran.Developer);
  perusahaan.tambahkanKaryawan(dev1);

  var manajer1 = KaryawanManager("Tini", umur: 35, peran: Peran.Manager);
  perusahaan.tambahkanKaryawan(manajer1);

  // Membuat proyek dan menambah fase
  var proyek = Proyek();
  proyek.tambahKaryawan(dev1);
  proyek.tambahKaryawan(manajer1);
  proyek.beralihKePengembangan();
}
