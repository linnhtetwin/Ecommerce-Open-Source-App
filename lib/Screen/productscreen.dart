import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/dummyproducts.dart';
import '../Widgets/selleritem.dart';
import '../Widgets/sidebar.dart';
import '../Screen/editscreen.dart';

class Productscreen extends StatelessWidget {
  static const routeName = '/productscreen';

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Dummyproducts>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ဆိုင်ရှိဆေးများ'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditScreen.routeName);
            },
          ),
        ],
      ),
      drawer: Sidebar(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: productsData.items.length,
          itemBuilder: (_, i) => Column(
                children: [
                  Selleritem(
                    productsData.items[i].id,
                    productsData.items[i].name,
                    productsData.items[i].genericname,
                    productsData.items[i].price,
                    productsData.items[i].imageUrl,

                  ),
                  Divider(),
                ],
              ),
        ),
      ),
    );
  }
}
