import 'package:flutter/material.dart';

class Productitem extends StatelessWidget {
  final String id;
  final String name;
  final String imageurl;

  Productitem(this.id, this.name, this.imageurl);
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(imageurl),
    );
  }
}
