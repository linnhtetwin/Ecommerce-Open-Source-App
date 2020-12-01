import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String name;
  final String genericname;
  final int price;
  final String imageUrl;


  Product({
    @required this.id,
    @required this.name,
    @required this.genericname,
    @required this.price,
    @required this.imageUrl,

  });


}
