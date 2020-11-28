import 'package:flutter/material.dart';
import 'route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E Commerce Open Source App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: const Color(0xFF009900),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: appRoutes,
      initialRoute: '/',
    );
  }
}
