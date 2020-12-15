import 'Screen/login.dart';
import 'Screen/register.dart';
import 'Screen/overviewscreen.dart';
import 'Screen/detailscreen.dart';
import 'Screen/cart_screen.dart';
import 'Screen/checkoutscreen.dart';
import 'Screen/productscreen.dart';
import 'Screen/editscreen.dart';

var appRoutes = {
  LoginScreen.routeName: (ctx) => LoginScreen(),
  RegisterScreen.routeName: (ctx) => RegisterScreen(),
  Overviewscreen.routeName: (ctx) => Overviewscreen(),
  DetailScreen.routeName: (ctx) => DetailScreen(),
  CartScreen.routeName: (ctx) => CartScreen(),
  CheckoutScreen.routeName: (ctx) => CheckoutScreen(),
  Productscreen.routeName: (ctx) => Productscreen(),
  EditScreen.routeName: (ctx) => EditScreen(),
};
