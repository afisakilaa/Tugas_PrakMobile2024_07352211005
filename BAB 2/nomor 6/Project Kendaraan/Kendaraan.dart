abstract class Kendaraan {
  // Atribut
  String nama;
  int kecepatan;
  int kapasitas;

  Kendaraan(this.nama, this.kecepatan, this.kapasitas);

  // Method
  void tampilkanInfo() {
    print("Nama: $nama");
    print("Kecepatan: $kecepatan km/jam");
    print("Kapasitas: $kapasitas orang");
  }
}