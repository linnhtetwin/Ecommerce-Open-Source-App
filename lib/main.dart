import 'package:flutter/material.dart';
import 'route.dart';
import 'package:provider/provider.dart';
import './Model/dummyproducts.dart';
import './Model/cart.dart';
import './Model/checkout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Dummyproducts(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Checkout(),
        ),
      ],
      child: MaterialApp(
        title: 'E Commerce Open Source App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          primaryColor: const Color(0xFF009900),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: appRoutes,
        initialRoute: '/',
      ),
    );
  }
}
