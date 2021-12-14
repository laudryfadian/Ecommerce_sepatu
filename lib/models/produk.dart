class Produks {
  final String id;
  final String nama;
  final String stok;
  final String hargaJual;

  Produks(
      {required this.id,
      required this.nama,
      required this.stok,
      required this.hargaJual});

  factory Produks.fromJson(Map<String, dynamic> json) {
    return Produks(
        id: json['_id'] as String,
        nama: json['nama'] as String,
        stok: json['stok'].toString(),
        hargaJual: json['hargaJual'].toString());
  }
}
