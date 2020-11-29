import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/detailscreen';

  @override
  Widget build(BuildContext context) {
    final argument_parameter =
        ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(argument_parameter),
      ),
    );
  }
}
