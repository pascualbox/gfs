import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GfsTextField extends StatelessWidget {
  final double textSize;
  final Color color;
  final bool isSecret;
  const GfsTextField(
      {Key? key,
      required this.textSize,
      required this.color,
      required this.isSecret})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        alignment: Alignment.center,
        color: color,
        height: MediaQuery.of(context).size.height * 0.05,
        width: MediaQuery.of(context).size.width * 0.3,
        child: TextField(
          style: TextStyle(fontSize: textSize),
          obscureText: isSecret,
          enableSuggestions: !isSecret,
          autocorrect: !isSecret,
        ),
      ),
    );
  }
}
