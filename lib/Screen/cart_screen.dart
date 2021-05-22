import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/cart.dart' show Cart;
import '../Widgets/cart_item.dart';
import '../Model/checkout.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) => CartItem(
                cart.items.values.toList()[i].id,
                cart.items.keys.toList()[i],
                cart.items.values.toList()[i].price,
                cart.items.values.toList()[i].quantity,
                cart.items.values.toList()[i].name,
              ),
            ),
          ),
          SizedBox(height: 10),
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '${cart.totalAmount}',
                      style: TextStyle(
                        color:
                            Theme.of(context).primaryTextTheme.headline6.color,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  TextButton(
                    child: Text('Checkout'),
                    onPressed: () {
                      Provider.of<Checkout>(context, listen: false).checkoutnow(
                        cart.items.values.toList(),
                        cart.totalAmount,
                      );
                      cart.clear();
                      Navigator.of(context).pushReplacementNamed('/checkout');
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
