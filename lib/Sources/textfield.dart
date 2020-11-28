import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customtextfield(String label) {
  return TextField(
    decoration: InputDecoration(
      labelText: label,
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromARGB(255, 35, 200, 35),
        ),
      ),
    ),
  );
}
