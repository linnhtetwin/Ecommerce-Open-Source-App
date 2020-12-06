import 'package:flutter/material.dart';
import 'cart.dart';

class Checkoutitem {
  final String cid;
  final int camount;
  final DateTime ctime;
  final List<CartItem> cproducts;

  Checkoutitem({
    this.cid,
    this.camount,
    this.ctime,
    this.cproducts,
  });
}

class Checkout with ChangeNotifier {
  List<Checkoutitem> _checkout = [];
  List<Checkoutitem> get checkout {
    return [..._checkout];
  }

  void checkoutnow(List<CartItem> cartProducts, int total) {
    _checkout.insert(
      0,
      Checkoutitem(
          cid: DateTime.now().toString(),
          camount: total,
          ctime: DateTime.now(),
          cproducts: cartProducts),
    );
    notifyListeners();
  }
}
