import 'package:flutter/material.dart';
import 'package:modul_7/models/product.dart';
import 'package:modul_7/pages/detailpage.dart';

class Mypage extends StatelessWidget {
  Mypage({super.key});
   
  final List<Product> products = [
    Product(
      id: 1, 
      nama: 'Mouse Gaming', 
      harga: 300000.00, 
      gambarUrl:
          'https://resource.logitechg.com/w_386,ar_1.0,c_limit,f_auto,q_auto,dpr_2.0/d_transparent.gif/content/dam/gaming/en/products/g502x-plus/gallery/g502x-plus-gallery-1-black.png?v=1', 
      dekripsi: 'di Jamin josss TENAN'),
          Product(
      id: 2, 
      nama: 'Casing HP', 
      harga: 100000.00, 
      gambarUrl:
          'https://resource.logitech.com/w_1600,c_limit,q_auto,f_auto,dpr_1.0/d_transparent.gif/content/dam/logitech/en/products/keyboards/mx-mechanical/gallery/mx-mechanical-keyboard-top-view-graphite-us.png?v=1&quot',
      dekripsi: 'di Jamin josss TENAN'),
          Product(
      id: 3, 
      nama: 'leptop', 
      harga: 30000000.00, 
      gambarUrl:
          'https://m.media-amazon.com/images/I/61CGHv6kmWL.AC_UF894,1000_QL80.jpg', 
      dekripsi: 'di Jamin josss TENAN'),
  ];

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Class Model'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 51, 255, 0),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
        final product = products[index];
        return ListTile(
          leading: Image.network(
            product.gambarUrl,
            width: 100,
            height: 100,
          ),
          title: Text(product.nama),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Rp${product.harga}'),
              Text(product.dekripsi),],
          ),
          onTap: (){
            print('Tap Layar Berhasil');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetailPage(
                  data: Icon(Icons.notification_add),
                  ),
                ),
            );
          },
        );
      })
    );
  }
}




