import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final int price;
  final int quantity;
  final String name;

  CartItem(
    this.id,
    this.productId,
    this.price,
    this.quantity,
    this.name,
  );

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      direction: DismissDirection.horizontal,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: Text(name),
            title: Text('$price'),
            subtitle: Text('x $quantity    Total:${(price * quantity)} Kyat'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () => { showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: Text('ဖယ်မည်?'),
                content: Text(
                  'ယခုဆေးကိုဖယ်မလား ?',
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('မဖယ်ပါ'),
                    onPressed: () {
                      Navigator.of(ctx).pop(false);
                    },
                  ),
                  TextButton(
                    child: Text('ဖယ်မည်'),
                    onPressed: () {
                      Navigator.of(ctx).pop(true);
                      Provider.of<Cart>(context, listen: false).removeItem(productId);
                    },
                  ),
                ],
              ),
            ) },
            ),

          ),
        ),
      ),
    );
  }
}
