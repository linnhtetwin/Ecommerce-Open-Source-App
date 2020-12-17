import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/dummyproducts.dart';
import '../Widgets/productitem.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Dummyproducts>(context);
    final products = productsData.items;
    return Column (children: <Widget>[
    GridView.builder(
      shrinkWrap: true,
      primary: true,
    padding: const EdgeInsets.all(10.0),
    itemCount: products.length,
    itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
    value: products[i],
    child: Draggable(
        feedback:ProductItem(),
        child:ProductItem(),
        childWhenDragging: ProductItem(),
        onDragEnd: (details) => print(details.offset))
    ),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: 3 / 2,
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
    ),
    ),

    ],);


  }
}
