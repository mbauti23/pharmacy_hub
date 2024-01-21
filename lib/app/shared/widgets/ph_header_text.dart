import 'package:flutter/material.dart';

class PhHeaderText extends StatelessWidget {
  const PhHeaderText(this.text, {super.key}) : color = Colors.black;
  const PhHeaderText.white(this.text, {super.key}) : color = Colors.white;

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 0, 5),
      child: Text(text,
          style: TextStyle(
              fontSize: 26, fontWeight: FontWeight.bold, color: color)),
    );
  }
}
