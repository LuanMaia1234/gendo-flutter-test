import 'package:flutter/material.dart';

//Widget customizado
class CustomTextField extends StatelessWidget {
  final String hintText;

  CustomTextField({@required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.orange,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
    );
  }
}
