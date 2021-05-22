import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/dummyproducts.dart';
import '../Screen/editscreen.dart';


class Selleritem extends StatelessWidget {

  final String id;
  final String name;
  final String genericname;
  final int price;
  final String imageUrl;


  Selleritem(this.id, this.name, this.genericname,this.price, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text(genericname),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(price.toString()+'Ks'),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).pushNamed(EditScreen.routeName, arguments: id);
              },
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => {showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text('ဖျက်မည်?'),
                  content: Text(
                    'ယခုဆေးကိုဖျက်မလား Error အကြီးကြီးတက်နိုင်သည် ?',
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text('မဖျက်ပါ'),
                      onPressed: () {
                        Navigator.of(ctx).pop(false);
                      },
                    ),
                    TextButton(
                      child: Text('ဖျက်မည်'),
                      onPressed: () {
                        Navigator.of(ctx).pop(true);
                        Provider.of<Dummyproducts>(context, listen: false).deleteProduct(id);
                      },
                    ),
                  ],
                ),
              ),

              },
              color: Theme.of(context).errorColor,
            ),
          ],
        ),
      ),
    );
  }
}
