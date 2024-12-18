import 'package:flutter/material.dart';
import '../models/product_model.dart';
import 'product_detail_page.dart';

class ProductPage extends StatelessWidget {
  final List<Product> products = [
    Product(name: 'Laptop', price: 15000000, image: 'assets/laptop.png'),
    Product(name: 'Smartphone', price: 8000000, image: 'assets/smartphone.png'),
    Product(name: 'Headphone', price: 1200000, image: 'assets/headphone.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product List')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: ListTile(
              leading: Image.asset(product.image, width: 50, height: 50),
              title: Text(product.name),
              subtitle: Text('Rp ${product.price}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailPage(product: product),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
