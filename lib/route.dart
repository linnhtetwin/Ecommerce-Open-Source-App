import 'Screen/login.dart';
import 'Screen/register.dart';
import 'Screen/overviewscreen.dart';
import 'Screen/detailscreen.dart';

var appRoutes = {
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  OverviewScreen.routeName: (context) => OverviewScreen(),
  DetailScreen.routeName: (context) => DetailScreen(),
};
