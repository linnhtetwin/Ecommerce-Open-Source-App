import 'package:flutter/material.dart';

class Productitem extends StatelessWidget {
  final String id;
  final String name;
  final String imageurl;

  Productitem(this.id, this.name, this.imageurl);
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        imageurl,
        fit: BoxFit.cover,
      ),
      footer: GridTileBar(
        backgroundColor: Colors.white60,
        title: Text(
          name,
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
        ),
        trailing: IconButton(
          icon: Icon(Icons.add_shopping_cart, color: Colors.black),
          onPressed: null,
        ),
      ),
    );
  }
}
