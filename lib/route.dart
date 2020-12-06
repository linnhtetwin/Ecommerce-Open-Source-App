import 'Screen/login.dart';
import 'Screen/register.dart';
import 'Screen/overviewscreen.dart';
import 'Screen/detailscreen.dart';
import 'Screen/cart_screen.dart';
import 'Screen/checkoutscreen.dart';

var appRoutes = {
  LoginScreen.routeName: (ctx) => LoginScreen(),
  RegisterScreen.routeName: (ctx) => RegisterScreen(),
  Overviewscreen.routeName: (ctx) => Overviewscreen(),
  DetailScreen.routeName: (ctx) => DetailScreen(),
  CartScreen.routeName: (ctx) => CartScreen(),
  CheckoutScreen.routeName: (ctx) => CheckoutScreen(),
};
