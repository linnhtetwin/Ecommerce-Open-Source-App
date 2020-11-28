import 'package:flutter/material.dart';
import 'package:tmd/Sources/passwordfield.dart';
import 'package:tmd/Sources/textfield.dart';
import 'package:tmd/Screen/register.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Login",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
          child: Container(
            child: ListView(
              children: <Widget>[
                Container(
                  width: 150,
                  height: 150,
                  child: Image.asset("images/2083.jpg"),
                ),
                customtextfield("User Name"),
                PasswordField(
                  color: Colors.red,
                  hasFloatingPlaceholder: true,
                  labeltext: "Password",
                ),
                FlatButton(
                  child: Text(
                    "LOGIN",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Color.fromARGB(255, 250, 35, 35),
                  onPressed: () => null,
                ),
                FlatButton(
                  child: Text(
                    "REGISTER",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Color.fromARGB(255, 250, 35, 35),
                  onPressed: () =>
                      Navigator.pushNamed(context, RegisterScreen.routeName),
                )
              ],
            ),
          ),
        ));
  }
}
