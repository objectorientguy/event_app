import 'package:flutter/material.dart';
import 'package:smart_clean/API/Methods.dart';
import 'package:smart_clean/Module/LoginModule/Screens/SignUpScreen.dart';
import 'package:smart_clean/Utilities/globals.dart';
import 'package:smart_clean/Utilities/navigator.dart';
import 'package:smart_clean/Utilities/toast_utility.dart';

class SignUpController extends StatefulWidget {
  @override
  SignUpControllerState createState() => new SignUpScreen();
}

abstract class SignUpControllerState extends State<SignUpController> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool isLoading = false;
  DateTime selectedDate = DateTime.now();

  selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(1990),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
  createAccountButtonPressed() {
    if (name.text.isEmpty) {
      ToastUtility.showToastAtCenter(context, "Please enter name");
    } else {
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
          if (password.text.isEmpty) {
            ToastUtility.showToastAtCenter(context, "Please enter password");
          } else if (password.text.isNotEmpty) {
            if (password.text.length != 7) {
              ToastUtility.showToastAtCenter(
                  context, "Password should contain 7 characters");
            } else {
              setState(() {
                isLoading = true;
              });

              DatabaseManager()
                  .createAccount(
                      name.text, email.text, password.text, selectedDate)
                  .then((user) {
                if (user != null) {
                  setState(() {
                    isLoading = false;
                  });
                  NavigatorUtility().navigateToEventListScreen(context);
                  print("Account Created Sucessfull");
                } else {
                  ToastUtility.showToastAtBotton(context, accountExistsError.toString());
                  print("Login Failed !!!");
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
}
