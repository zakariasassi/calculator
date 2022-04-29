import 'package:flutter/material.dart';

class myButtuns extends StatelessWidget {
  final color;
  final textColor;
  final String textButton;

  myButtuns({this.color, required this.textButton, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: color,
          child: Center(
            child: Text(
              textButton,
              style: TextStyle(color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
