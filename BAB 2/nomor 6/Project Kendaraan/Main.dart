// Implementasi
import 'JenisBahanBakar.dart';
import 'Mobil.dart';
import 'Motor.dart';

void main() {
  Mobil mobil = Mobil(nama: "Toyota", kecepatan: 120, kapasitas: 5, jenisBahanBakar: JenisBahanBakar.pertamax);
  mobil.tampilkanInfo();
  mobil.service();

  print("");

  mobil.jenisBahanBakar = JenisBahanBakar.pertalite;
  print("Jenis Bahan Bakar Diperbarui: ${mobil.jenisBahanBakar.name}");

  print("");

  Motor motor = Motor("Yamaha", 80, 2);
  motor.tampilkanInfo();
}