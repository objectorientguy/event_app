import 'package:flutter/material.dart';
import 'package:smart_clean/Module/LoginModule/Controller/LoginController.dart';
import 'package:smart_clean/Widgets/buttonWidget.dart';
import 'package:smart_clean/Module/LoginModule/Widgets/textFieldWidget.dart';
import 'package:smart_clean/Utilities/circular_progress_indicator.dart';
import 'package:smart_clean/Utilities/constants.dart';
import 'package:smart_clean/Utilities/navigator.dart';
import 'package:smart_clean/Utilities/textfield_utility.dart';

class LoginScreen extends LoginControllerState {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: isLoading
            ? CircularProgressIndicatorWidget()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height / 8,
                    ),
                    Container(
                      width: size.width / 1.1,
                      child: TextUtility(
                        constantText: Constants().welcomeText,
                        color: Colors.black,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                        width: size.width / 1.1,
                        child: TextUtility(
                          constantText: Constants().signInToContinueText,
                          color: Colors.grey,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        )),
                    SizedBox(
                      height: size.height / 10,
                    ),
                    TextFieldWidget(
                        icon: Icons.email,
                        textEditingController: email,
                        hintText: Constants().emailText),
                    TextFieldWidget(
                        obscureText: true,
                        maxLength: 7,
                        icon: Icons.lock,
                        textEditingController: password,
                        hintText: Constants().passwordText),
                    SizedBox(
                      height: size.height / 20,
                    ),
                    ButtonWidget(
                        buttonText: Constants().loginText,
                        onPressed: loginButtonPress),
                    SizedBox(
                      height: size.height / 40,
                    ),
                    GestureDetector(
                        onTap: () {
                          NavigatorUtility().navigateToSignUpScreen(context);
                        },
                        child: TextUtility(
                          constantText: Constants().createAccountText,
                          color: Colors.black87,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ))
                  ],
                ),
              ),
      ),
    );
  }
}
