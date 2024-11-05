class Product {
  final int id;
  final String nama;
  final double harga;
  final String gambarUrl;
  final String dekripsi;

  //construktor
  Product({
    required this.id,
    required this.nama,
    required this.harga,
    required this.gambarUrl,
    required this.dekripsi,
  });

  // method untuk mengkonversi JSON => object product
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      nama: json['nama'],
      harga: json['harga'],
      gambarUrl: json['gambarUrl'],
      dekripsi: json['deskripsi']
    );
  }

  // method untuk mengkonversi object product => JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'harga': harga,
      'gambarUrl': gambarUrl,
      'deskripsi': dekripsi,
    };
  }

}