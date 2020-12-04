import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Widgets/products_grid.dart';
import '../Widgets/badge.dart';
import '../Model/cart.dart';
import './cart_screen.dart';
import '../Widgets/sidebar.dart';

class Overviewscreen extends StatefulWidget {
  static const routeName = '/overview';
  @override
  _OverviewScreenState createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<Overviewscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TMD Pharmacy'),
        actions: <Widget>[
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      drawer: Sidebar(),
      body: ProductsGrid(),
    );
  }
}
