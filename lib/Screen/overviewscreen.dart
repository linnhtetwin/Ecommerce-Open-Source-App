import 'package:EOA/Model/product.dart';
import 'package:flutter/material.dart';
import '../Widgets/productitem.dart';

class OverviewScreen extends StatelessWidget {
  static const routeName = '/overview';
  final List<Product> loadedproduct = [
    Product(
        id: "a001",
        name: "Decolgen",
        price: 1400,
        imageURL:
            "https://static-01.shop.com.mm/original/61c2cd8d22f2dc0ffa925227aa1beade.jpg"),
    Product(
        id: "a002",
        name: "Decolgen Forte",
        price: 1100,
        imageURL:
            "https://static-01.shop.com.mm/p/461e23350afad55515cb27376bde291d.jpg"),
    Product(
        id: "a003",
        name: "Dolfenal 500",
        price: 800,
        imageURL:
            "https://static-01.shop.com.mm/p/f69ccf57e63cf108f9fb24c9c59c9e6e.jpg"),
    Product(
        id: "a004",
        name: "BPI Para500MG",
        price: 800,
        imageURL:
            "https://static-01.shop.com.mm/p/061a05cd5e1600bd9f9e8a5e72b5f7c9.jpg"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TMD Pharmacy"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: loadedproduct.length,
        itemBuilder: (ctx, i) => Productitem(loadedproduct[i].id,
            loadedproduct[i].name, loadedproduct[i].imageURL),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
      ),
    );
  }
}
