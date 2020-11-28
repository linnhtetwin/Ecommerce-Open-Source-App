import 'package:flutter/material.dart';
import 'package:tmd/Sources/addressfield.dart';
import 'package:tmd/Sources/textfield.dart';
import 'package:tmd/Sources/passwordfield.dart';
import 'package:tmd/Screen/login.dart';


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
  Towncode selectedTown;
  List<Towncode> townships = <Towncode>[
    const Towncode(11121, 'Ahlone'),
    const Towncode(11012, 'Insein'),
    const Towncode(11201, 'Bahan'),
    const Towncode(11062, 'Mayangone'),
    const Towncode(11143, 'Pabedan'),
    const Towncode(11162, 'Botahtaung'),
    const Towncode(11051, 'Hlaing'),
    const Towncode(11111, 'Sanchaung'),
  ];
  void initState() {
    selectedTown = townships[0]; //Default Ahlone
  }

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
              AddressField(),
              customtextfield("Shop Name"),
              Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "Postal Code -   ",
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    DropdownButtonHideUnderline(
                      //wrap to remove underline
                      child: DropdownButton<Towncode>(
                        value: selectedTown,
                        onChanged: (Towncode newValue) {
                          setState(() {
                            selectedTown = newValue;
                          });
                        },
                        items: townships.map((Towncode selectedtown) {
                          return new DropdownMenuItem<Towncode>(
                            value: selectedtown,
                            child: new Text(
                              selectedtown.townname,
                              style: new TextStyle(color: Colors.black),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    Text(
                      " ${selectedTown.postcode}",
                      style: TextStyle(color: Colors.black54),
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 1.2,
                color: Color.fromARGB(255, 250, 35, 35),
              ),
              PasswordField(
                color: Colors.red,
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
                  FlatButton(
                    color: Color.fromARGB(255, 250, 35, 35),
                    child: Text(
                      "SUBMIT",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => print("Register Acc"),
                  ),
                  FlatButton(
                    color: Color.fromARGB(255, 250, 35, 35),
                    child: Text(
                      "BACK",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () =>
                        Navigator.pushNamed(context, LoginScreen.routeName),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
