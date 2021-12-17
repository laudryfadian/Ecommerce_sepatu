class Produks {
  final String id;
  final String nama;
  final String stok;
  final String hargaJual;
  final String urlGambar;
  final String size;
  final String keterangan;

  Produks(
      {required this.id,
      required this.nama,
      required this.stok,
      required this.hargaJual,
      required this.urlGambar,
      required this.size,
      required this.keterangan});

  factory Produks.fromJson(Map<String, dynamic> json) {
    return Produks(
        id: json['_id'] as String,
        nama: json['nama'] as String,
        stok: json['stok'].toString(),
        hargaJual: json['hargaJual'].toString(),
        urlGambar: json['urlGambar'] as String,
        size: json['size'] as String,
        keterangan: json['keterangan'] as String);
  }
}
