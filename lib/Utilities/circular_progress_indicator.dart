import 'package:flutter/material.dart';

class CircularProgressIndicatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        height: size.height / 20,
        width: size.height / 20,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
