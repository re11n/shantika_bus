class Tiket {
  String? asal;
  String? tujuan;
  String? kodeasal;
  String? kodetujuan;
  String? durasi;
  String? jamberangkat;
  String? jamsampai;
  String? tanggal;
  String? no;
  String? harga;
  String? tipebus;

  Tiket({
    required this.asal,
    required this.tujuan,
    required this.kodeasal,
    required this.kodetujuan,
    required this.durasi,
    required this.jamberangkat,
    required this.jamsampai,
    required this.tanggal,
    required this.no,
    required this.harga,
    required this.tipebus,
  });

  Tiket.fromJson(Map<String, dynamic> json) {
    asal = json['asal'];
    tujuan = json['tujuan'];
    kodeasal = json['kodeasal'];
    kodetujuan = json['kodetujuan'];
    durasi = json['durasi'];
    jamberangkat = json['jamberangkat'];
    jamsampai = json['jamsampai'];
    tanggal = json['tanggal'];
    no = json['no'];
    harga = json[harga];
    tipebus = json['tipebus'];
  }
}
