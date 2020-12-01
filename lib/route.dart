import 'Screen/login.dart';
import 'Screen/register.dart';
import 'Screen/overviewscreen.dart';
import 'Screen/detailscreen.dart';
import 'Screen/cart_screen.dart';

var appRoutes = {
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  Overviewscreen.routeName: (context) => Overviewscreen(),
  DetailScreen.routeName: (ctx) => DetailScreen(),
  CartScreen.routeName: (ctx) => CartScreen(),
};
