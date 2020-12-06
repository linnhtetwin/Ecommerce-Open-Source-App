import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/checkout.dart' show Checkout;
import '../Widgets/checkoutwidget.dart';

class CheckoutScreen extends StatelessWidget {
  static const routeName = '/checkout';
  @override
  Widget build(BuildContext context) {
    final cData = Provider.of<Checkout>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: ListView.builder(
        itemCount: cData.checkout.length,
        itemBuilder: (ctx, i) => CheckoutWidget(cData.checkout[i]),
      ),
    );
  }
}
