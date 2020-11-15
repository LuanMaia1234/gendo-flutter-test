import 'package:flutter/material.dart';

//Widget customizado
class CustomCircle extends StatelessWidget {
  final String text;

  CustomCircle({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 25,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(2,4,2,3),
        child: Text(text,textAlign: TextAlign.center),
      ),
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: Colors.grey[300]),
    );
  }
}
