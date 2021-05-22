import 'package:flutter/material.dart';
import '../Widgets/textfield.dart';
import '../Sources/passwordfield.dart';
import '../Screen/login.dart';

class Towncode {
  const Towncode(this.postcode, this.townname);
  final int postcode;
  final String townname;
}

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

//https://stackoverflow.com/questions/49720450/flutter-dropdownbutton-using-keyvaluepair
class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Register"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Container(
          child: ListView(
            children: <Widget>[
              customtextfield("Name"),
              customtextfield("Email"),
              customtextfield("Phone"),
              PasswordField(
                color: Colors.green,
                hasFloatingPlaceholder: true,
                labeltext: "Password",
              ),
              PasswordField(
                color: Colors.red,
                hasFloatingPlaceholder: true,
                labeltext: "Confirm Password",
              ),
              SizedBox(height: 20),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    child: Text(
                      "SUBMIT",
                      style: TextStyle(color: Colors.green),
                    ),
                    onPressed: () => print("Register Acc"),
                  ),
                  TextButton(
                    child: Text(
                      "BACK",
                      style: TextStyle(color: Colors.green),
                    ),
                    onPressed: () =>
                        Navigator.pushNamed(context, LoginScreen.routeName),
                  ),
                ],
              ),
              new TextButton(
                child: Text(
                  "Register With Facebook",
                  style: TextStyle(color: Colors.green),
                ),
                onPressed: () => print("Register Acc"),
              ),
              new TextButton(
                child: Text(
                  "Register With Google",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, LoginScreen.routeName),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
