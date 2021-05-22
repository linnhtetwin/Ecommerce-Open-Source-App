import 'package:flutter/material.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({Key key}) : super(key: key);
  @override
  _SidebarState createState() {
    return _SidebarState();
  }
}

class _SidebarState extends State {
  bool _isVisible = true;

  void buyerseller() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

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
          ElevatedButton(
            child: Text('Buyer/Seller'),
            onPressed: buyerseller,
          ),
          ListTile(
            leading: Icon(Icons.shop_outlined),
            title: Text("Overview"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/overview');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Orders'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/checkout');
            },
          ),
          Visibility(visible: _isVisible,
              child: Column (children: <Widget>[
                Divider(),
                ListTile(
                  leading: Icon(Icons.edit),
                  title: Text('Manage Products'),
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed('/productscreen');
                  },
                ),
              ]
          ),),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
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
        ],
      ),
    );
  }
}
