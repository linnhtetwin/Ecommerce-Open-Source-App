import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Screen/detailscreen.dart';
import '../Model/product.dart';
import '../Model/cart.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              DetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Hero(
            tag: product.id,
            child: FadeInImage(
              placeholder: AssetImage("images/placeholder.png"),
              image: NetworkImage(product.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.white60,
          title: Text(
            product.name,
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          trailing: IconButton(
            icon: Icon(Icons.add_shopping_cart, color: Colors.black),
            onPressed: () {
              cart.addItem(product.id, product.price, product.genericname);
            },
          ),
        ),
      ),
    );
  }
}
