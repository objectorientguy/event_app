import 'package:flutter/material.dart';

class TextUtility extends StatelessWidget {
  final String constantText;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextOverflow overflow;
  final int maxLines;

  TextUtility(
      {this.constantText,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.overflow,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Text(
      constantText,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        letterSpacing: -0.1230769203259395,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
