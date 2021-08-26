import 'package:flutter/material.dart';
import 'package:smart_clean/API/Methods.dart';
import 'package:smart_clean/Module/LoginModule/Screens/LoginScreen.dart';
import 'package:smart_clean/Utilities/globals.dart';
import 'package:smart_clean/Utilities/navigator.dart';
import 'package:smart_clean/Utilities/toast_utility.dart';

class LoginController extends StatefulWidget {
  @override
  LoginControllerState createState() => new LoginScreen();
}

abstract class LoginControllerState extends State<LoginController> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool isLoading = false;
  loginButtonPress() {
    if (email.text.isEmpty) {
      ToastUtility.showToastAtCenter(context, "Please enter email id");
    } else if (email.text.isNotEmpty) {
      Pattern pattern =
          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
          r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
          r"{0,253}[a-zA-Z0-9])?)*$";
      RegExp regex = new RegExp(pattern);
      if (!regex.hasMatch(email.text) || email.text == null)
        return ToastUtility.showToastAtCenter(
            context, "Please enter valid email id");
      else {
        //checkPassword();
        if (password.text.isEmpty) {
          print('s');

          ToastUtility.showToastAtCenter(context, "Please enter password");
        } else if (password.text.isNotEmpty) {
          if (password.text.length != 7) {
            ToastUtility.showToastAtCenter(
                context, "Please enter valid password");
          } else {
            setState(() {
              isLoading = true;
            });

            DatabaseManager().logIn(email.text, password.text).then((user) {
              if (user != null) {
                print("Login Sucessfull");
                setState(() {
                  isLoading = false;
                });
                NavigatorUtility().navigateToEventListScreen(context);
              } else {
                ToastUtility.showToastAtBotton(context, invalidPasswordError.toString());

                print("Login Failed");
                setState(() {
                  isLoading = false;
                });
              }
            });
          }
        }
      }
    }
  }
}
