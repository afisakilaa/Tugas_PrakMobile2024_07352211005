import 'Kendaraan.dart';
import 'JenisBahanBakar.dart';
import 'DapatkanService.dart';

class Mobil extends Kendaraan with Dapatkanservice {
  JenisBahanBakar _jenisBahanBakar;

  Mobil({
    required String nama,
    required int kecepatan,
    required int kapasitas,
    required JenisBahanBakar jenisBahanBakar,
  })  : _jenisBahanBakar = jenisBahanBakar,
        super(nama, kecepatan, kapasitas);

  JenisBahanBakar get jenisBahanBakar => _jenisBahanBakar;

  set jenisBahanBakar(JenisBahanBakar baruJenisBahanBakar) {
    _jenisBahanBakar = baruJenisBahanBakar;
  }

  @override
  void tampilkanInfo() {
    super.tampilkanInfo();
    print("Jenis Bahan Bakar: ${_jenisBahanBakar.name}");
  }
}