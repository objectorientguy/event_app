import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  String hintText;
  IconData icon;
  TextEditingController textEditingController;
  bool obscureText;
  int maxLength;
  String helperText;

  TextFieldWidget(
      {this.hintText,
      this.textEditingController,
      this.icon,
      this.obscureText,
      this.maxLength,this.helperText});

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState(
      hintText: hintText,
      icon: icon,
      textEditingController: textEditingController,
      obscureText: obscureText,
      maxLength: maxLength,helperText:helperText);
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  String hintText;
  int maxLength;
  String helperText;
  IconData icon;
  TextEditingController textEditingController;
  bool obscureText;

  _TextFieldWidgetState(
      {this.hintText,
      this.textEditingController,
      this.icon,
      this.obscureText,
      this.maxLength,this.helperText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        maxLength: maxLength,
        obscureText: obscureText ?? false,
        controller: textEditingController,
        decoration: InputDecoration(
            counterText: '',
            helperText: helperText,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2.0),
          ),
          focusColor: Colors.white12,
          hoverColor: Colors.white12,
          prefixIcon: Icon(
            icon,
            color: Colors.blueGrey,
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
