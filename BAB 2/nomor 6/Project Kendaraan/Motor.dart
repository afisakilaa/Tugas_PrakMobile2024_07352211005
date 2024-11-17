import 'Kendaraan.dart';

class Motor extends Kendaraan {
  Motor(String nama, int kecepatan, int kapasitas) : super(nama, kecepatan, kapasitas);

  @override
  void tampilkanInfo() {
    super.tampilkanInfo();
    print("Ini adalah motor.");
  }
}