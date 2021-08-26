import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  String buttonText;
  Function onPressed;

  ButtonWidget({this.buttonText, this.onPressed});

  @override
  _ButtonWidgetState createState() =>
      _ButtonWidgetState(buttonText: buttonText, onPressed: onPressed);
}

class _ButtonWidgetState extends State<ButtonWidget> {
  String buttonText;
  Function onPressed;

  _ButtonWidgetState({this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
          height: MediaQuery.of(context).size.height / 14,
          width: MediaQuery.of(context).size.width / 1.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.black,
          ),
          alignment: Alignment.center,
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}
