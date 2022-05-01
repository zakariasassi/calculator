import 'package:flutter/material.dart';

class myButtuns extends StatelessWidget {
  final color;
  final textColor;
  final String textButton;
  final buttonTaped;
  myButtuns(
      {this.color, required this.textButton, this.textColor, this.buttonTaped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTaped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                textButton,
                style: TextStyle(color: textColor, fontSize: 24),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
