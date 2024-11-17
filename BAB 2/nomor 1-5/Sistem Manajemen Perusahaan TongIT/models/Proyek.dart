import 'Karyawan.dart';
import '../enums/FaseProyek.dart';

class Proyek {
  FaseProyek fase = FaseProyek.Perencanaan;
  List<Karyawan> timProyek = [];
  DateTime? tanggalMulai;

  void tambahKaryawan(Karyawan karyawan) {
    if (timProyek.length < 20) {
      timProyek.add(karyawan);
    } else {
      print("Maksimal 20 karyawan aktif dalam proyek.");
    }
  }

  void beralihKePengembangan() {
    if (fase == FaseProyek.Perencanaan && timProyek.length >= 5) {
      fase = FaseProyek.Pengembangan;
      tanggalMulai = DateTime.now();
      print("Proyek beralih ke fase Pengembangan.");
    } else {
      print("Tim harus memiliki minimal 5 karyawan aktif untuk beralih ke Pengembangan.");
    }
  }

  void beralihKeEvaluasi() {
    if (fase == FaseProyek.Pengembangan && tanggalMulai != null) {
      if (DateTime.now().difference(tanggalMulai!).inDays > 45) {
        fase = FaseProyek.Evaluasi;
        print("Proyek beralih ke fase Evaluasi.");
      } else {
        print("Proyek harus berjalan lebih dari 45 hari untuk beralih ke Evaluasi.");
      }
    } else {
      print("Tidak dapat beralih ke Evaluasi.");
    }
  }
}
