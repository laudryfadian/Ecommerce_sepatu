class History {
  late final String sId;
  late final String tanggal;
  late final User user;
  late final Barang barang;
  late final int jumlah;
  late final String status;
  late final int totalBayar;
  late final String alamat;

  History(
      {required this.sId,
      required this.tanggal,
      required this.user,
      required this.barang,
      required this.jumlah,
      required this.status,
      required this.totalBayar,
      required this.alamat});

  History.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    tanggal = json['tanggal'];
    user = (json['user'] != null ? new User.fromJson(json['user']) : null)!;
    barang =
        (json['barang'] != null ? new Barang.fromJson(json['barang']) : null)!;
    jumlah = json['jumlah'];
    status = json['status'];
    totalBayar = json['totalBayar'];
    alamat = json['alamat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['tanggal'] = this.tanggal;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.barang != null) {
      data['barang'] = this.barang.toJson();
    }
    data['jumlah'] = this.jumlah;
    data['status'] = this.status;
    data['totalBayar'] = this.totalBayar;
    data['alamat'] = this.alamat;
    return data;
  }
}

class User {
  late final String sId;
  late final String nama;

  User({required this.sId, required this.nama});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    nama = json['nama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['nama'] = this.nama;
    return data;
  }
}

class Barang {
  late final String sId;
  late final String nama;
  late final String size;

  Barang({required this.sId, required this.nama, required this.size});

  Barang.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    nama = json['nama'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['nama'] = this.nama;
    data['size'] = this.size;
    return data;
  }
}
