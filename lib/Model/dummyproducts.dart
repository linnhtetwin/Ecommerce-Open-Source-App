import 'package:flutter/material.dart';

import './product.dart';

class Dummyproducts with ChangeNotifier {
  List<Product> _items = [
    Product(
        id: "a001",
        name: "Decolgen",
        genericname: "Paracetamol",
        price: 1400,
        imageUrl:
            "https://static-01.shop.com.mm/original/61c2cd8d22f2dc0ffa925227aa1beade.jpg"),
    Product(
        id: "a002",
        name: "Decolgen Forte",
        genericname: "Paracetamol",
        price: 1100,
        imageUrl:
            "https://static-01.shop.com.mm/p/461e23350afad55515cb27376bde291d.jpg"),
    Product(
        id: "a003",
        name: "Dolfenal 500",
        genericname: "Dolfenal",
        price: 800,
        imageUrl:
            "https://static-01.shop.com.mm/p/f69ccf57e63cf108f9fb24c9c59c9e6e.jpg"),
    Product(
        id: "a004",
        name: "BPI Para500MG",
        genericname: "Paracetamol",
        price: 800,
        imageUrl:
            "https://static-01.shop.com.mm/p/061a05cd5e1600bd9f9e8a5e72b5f7c9.jpg"),
  ];

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addProduct(Product product) {
    final newProduct = Product(
      id: DateTime.now().toString(),
      name: product.name,
      genericname: product.genericname,
      price: product.price,
      imageUrl: product.imageUrl,
    );
    _items.add(newProduct);
    // _items.insert(0, newProduct); // at the start of the list
    notifyListeners();
  }

  void updateProduct(String id, Product newProduct) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
