import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Model/checkout.dart';
import 'dart:math';

class CheckoutWidget extends StatefulWidget {
  final Checkoutitem checkoutWidget;

  CheckoutWidget(this.checkoutWidget);

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<CheckoutWidget> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              DateFormat('dd/MM/yyyy hh:mm')
                  .format(widget.checkoutWidget.ctime),
            ),
            subtitle: Text('${widget.checkoutWidget.camount} Kyat'),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: min(widget.checkoutWidget.cproducts.length * 50.0,
                  400), // Dynamic Size  စုစုပေါင်း ၄၀၀ထက်မပို
              child: ListView(
                children: widget.checkoutWidget.cproducts
                    .map(
                      (prod) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            prod.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${prod.quantity} ခု ${prod.price} Kyat',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    )
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
