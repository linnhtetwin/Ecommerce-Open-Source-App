import 'package:flutter/cupertino.dart';

class Product {
  final String id;
  final String name;
  final int price;
  final String imageURL;

  Product({
    @required this.id,
    @required this.name,
    @required this.price,
    @required this.imageURL,
  });
}
