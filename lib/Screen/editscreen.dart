import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/dummyproducts.dart';
import '../Model/product.dart';


class EditScreen extends StatefulWidget {
  static const routeName = '/selleritem';
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditScreen> {
  final _nameFocusNode = FocusNode();
  final _genericnameFocusNode = FocusNode();
  final _priceFocusNode = FocusNode();


  final _form = GlobalKey<FormState>();
  var _x = Product(
    id: null,
    name: '',
    genericname: '',
    price: 0,
    imageUrl: '',
  );
  var _initValues = {
    'name': '',
    'genericname': '',
    'price': '',
    'imageUrl': '',
  };
  var _isInit = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context).settings.arguments as String;
      if (productId != null) {
        _x =
            Provider.of<Dummyproducts>(context, listen: false).findById(productId);
        _initValues = {
          'name': _x.name,
          'genericname': _x.genericname,
          'price': _x.price.toString(),
          'imageUrl': 'https://static-01.shop.com.mm/p/0cdfbfedc20f5efd589da860366cc313.jpg_200x200q75.jpg',
        };

      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _priceFocusNode.dispose();
    _genericnameFocusNode.dispose();

    super.dispose();
  }

  void _saveForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    if (_x.id != null) {
      Provider.of<Dummyproducts>(context, listen: false)
          .updateProduct(_x.id, _x);
    } else {
      Provider.of<Dummyproducts>(context, listen: false).addProduct(_x);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              TextFormField(
                initialValue: _initValues['name'],
                decoration: InputDecoration(labelText: 'Name'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_nameFocusNode);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _x = Product(
                      id: _x.id,
                      name: value,
                      genericname: _x.genericname,
                      price: _x.price,
                    imageUrl:
                    'https://static-01.shop.com.mm/p/0cdfbfedc20f5efd589da860366cc313.jpg_200x200q75.jpg',);
                },
              ),
              TextFormField(
                initialValue: _initValues['genericname'],
                decoration: InputDecoration(labelText: 'Generic Name'),
                keyboardType: TextInputType.multiline,
                focusNode: _genericnameFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_genericnameFocusNode);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Generic Name.';
                  }

                  return null;
                },
                onSaved: (value) {
                  _x = Product(
                    id: _x.id,
                    name: _x.name,
                    genericname: value,
                    price: _x.price,
                    imageUrl:
                    'https://static-01.shop.com.mm/p/0cdfbfedc20f5efd589da860366cc313.jpg_200x200q75.jpg',);
                },
              ),
              TextFormField(
                initialValue: _initValues['price'],
                decoration: InputDecoration(labelText: 'Price'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _priceFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a price.';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number.';
                  }
                  if (double.parse(value) <= 0) {
                    return 'Please enter a number greater than zero.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _x = Product(
                    id: _x.id,
                    name: _x.name,
                    price: int.parse(value),
                    genericname: _x.genericname,
                    imageUrl:
                    'https://static-01.shop.com.mm/p/0cdfbfedc20f5efd589da860366cc313.jpg_200x200q75.jpg',);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Image URL'),
                readOnly: true,
                onFieldSubmitted: (_) {
                  _saveForm();
                },

                onSaved: (value) {
                  _x = Product(
                    id: _x.id,
                    name: _x.name,
                    price: _x.price,
                    genericname: _x.genericname,
                    imageUrl:
                    'https://static-01.shop.com.mm/p/0cdfbfedc20f5efd589da860366cc313.jpg_200x200q75.jpg',);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
