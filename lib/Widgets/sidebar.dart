import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text("TMD Shop"),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop_outlined),
            title: Text("Overview"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/overview');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.note),
            title: Text("Register"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/register');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
        ],
      ),
    );
  }
}
