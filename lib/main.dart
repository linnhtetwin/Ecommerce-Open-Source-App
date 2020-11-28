import 'package:flutter/material.dart';
import 'route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wechannelmm',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: const Color(0xFFfd0202),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: appRoutes,
      initialRoute: '/',
    );
  }
}
