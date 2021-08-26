import 'package:flutter/material.dart';
import 'package:smart_clean/Module/LoginModule/Controller/SignUpController.dart';
import 'package:smart_clean/Module/LoginModule/Controller/SignUpController.dart';
import 'package:smart_clean/Module/LoginModule/Screens/SignUpScreen.dart';

class TextWidget extends StatefulWidget {
  DateTime selectedDate = DateTime.now();

  TextWidget({this.selectedDate});

  @override
  _TextWidgetState createState() =>
      _TextWidgetState(selectedDate: selectedDate);
}

class _TextWidgetState extends State<TextWidget> {
  DateTime selectedDate = DateTime.now();
  SignUpScreen SignUpController;

  _TextWidgetState({this.selectedDate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          height: MediaQuery.of(context).size.height / 14,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Icon(
                  Icons.cake_outlined,
                  color: Colors.blueGrey,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  (selectedDate.toLocal().toString() == null)
                      ? "Date of birth"
                      : "${selectedDate.toLocal()}".split(' ')[0],
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.46),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: GestureDetector(
                      onTap: () {
                        SignUpController.selectDate(context);
                      },
                      child: Icon(Icons.calendar_today)),
                ),
              )
            ],
          )),
    );
  }
}
