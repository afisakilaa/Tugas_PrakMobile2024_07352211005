mixin Kinerja {
  int produktivitas = 0;
  DateTime? lastUpdated;

  void updateProduktivitas(int nilai) {
    final now = DateTime.now();
    if (lastUpdated == null || now.difference(lastUpdated!).inDays >= 30) {
      produktivitas = (produktivitas + nilai).clamp(0, 100);
      lastUpdated = now;
      print("Produktivitas diperbarui ke $produktivitas");
    } else {
      print("Produktivitas hanya dapat diperbarui setiap 30 hari.");
    }
  }
}
