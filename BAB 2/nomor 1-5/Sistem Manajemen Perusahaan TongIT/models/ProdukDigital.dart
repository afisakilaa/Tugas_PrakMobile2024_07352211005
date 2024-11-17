enum Kategori { DataManagement, NetworkAutomation }

abstract class ProdukDigital {
  String namaProduk;
  double harga;
  Kategori kategori;

  ProdukDigital(this.namaProduk, this.harga, this.kategori);

  void terapkanDiskon() {
    if (kategori == Kategori.NetworkAutomation && harga > 200000) {
      harga *= 0.85;
      if (harga < 200000) harga = 200000;
    }
  }
}

class DataManagement extends ProdukDigital {
  DataManagement(String namaProduk, double harga)
      : assert(harga < 200000, "Harga harus di bawah 200.000 untuk Data Management"),
        super(namaProduk, harga, Kategori.DataManagement);
}

class NetworkAutomation extends ProdukDigital {
  int jumlahTerjual = 0;

  NetworkAutomation(String namaProduk, double harga)
      : assert(harga >= 200000, "Harga minimal 200.000 untuk Network Automation"),
        super(namaProduk, harga, Kategori.NetworkAutomation);

  void tambahPenjualan(int jumlah) {
    jumlahTerjual += jumlah;
    if (jumlahTerjual > 50) terapkanDiskon();
  }
}
