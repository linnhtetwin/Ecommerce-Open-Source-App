import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Model/checkout.dart';

class CheckoutWidget extends StatelessWidget {
  final Checkoutitem checkoutWidget;

  CheckoutWidget(this.checkoutWidget);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              DateFormat('dd MM yyyy hh:mm').format(checkoutWidget.ctime),
            ),
            subtitle: Text('${checkoutWidget.camount} Kyat'),
            trailing: IconButton(
              icon: Icon(Icons.expand_more),
              onPressed: () {
                print("Order Detail");
              },
            ),
          ),
        ],
      ),
    );
  }
}
