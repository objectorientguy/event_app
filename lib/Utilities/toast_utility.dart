import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtility {
  static void showToastAtCenter(BuildContext context, String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER ,
        timeInSecForIosWeb: 3,
        fontSize: 14.0
    );
  }
  static void showToastAtBotton(BuildContext context, String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM ,
        timeInSecForIosWeb: 3,
        fontSize: 14.0
    );
  }
}