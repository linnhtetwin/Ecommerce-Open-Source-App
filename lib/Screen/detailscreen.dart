import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import '../Model/dummyproducts.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/detailscreen';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct = Provider.of<Dummyproducts>(
      context,
      listen: false,
    ).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Hero(
                tag: loadedProduct.id,
                child: FadeInImage(
                  placeholder: AssetImage("images/placeholder.png"),
                  image: NetworkImage(loadedProduct.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.remove_circle, color: Colors.amber),
                  onPressed: null,
                ),
                Container(
                  width: 50.0,
                  color: Colors.green[50],
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Qty'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add_circle, color: Colors.amber),
                  onPressed: null,
                ),
              ],
            ),
            Text(
              '${loadedProduct.price} Kyat',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                loadedProduct.genericname,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
