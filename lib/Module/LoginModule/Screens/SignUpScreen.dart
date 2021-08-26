import 'package:flutter/material.dart';
import 'package:smart_clean/Module/LoginModule/Controller/SignUpController.dart';
import 'package:smart_clean/Widgets/buttonWidget.dart';
import 'package:smart_clean/Module/LoginModule/Widgets/textFieldWidget.dart';
import 'package:smart_clean/Utilities/circular_progress_indicator.dart';
import 'package:smart_clean/Utilities/constants.dart';
import 'package:smart_clean/Utilities/textfield_utility.dart';

class SignUpScreen extends SignUpControllerState {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: isLoading
          ? CircularProgressIndicatorWidget()
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height / 20,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: size.width / 0.5,
                    child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                  SizedBox(
                    height: size.height / 50,
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
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      )),
                  SizedBox(
                    height: size.height / 20,
                  ),
                  TextFieldWidget(
                      icon: Icons.account_box,
                      textEditingController: name,
                      hintText: "Name"),
                  TextFieldWidget(
                      icon: Icons.email,
                      textEditingController: email,
                      hintText: "email"),
                  text(size),
                  TextFieldWidget(
                      helperText: "Password should contain 7 characters",
                      maxLength: 7,
                      obscureText: true,
                      icon: Icons.lock,
                      textEditingController: password,
                      hintText: "password"),
                  SizedBox(
                    height: size.height / 20,
                  ),
                  ButtonWidget(
                      buttonText: Constants().createAccountText,
                      onPressed: createAccountButtonPressed),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: TextUtility(
                          constantText: Constants().alreadyHaveAnAccountText,
                          color: Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        )),
                  )
                ],
              ),
            ),
    );
  }

  Widget text(Size size) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          height: size.height / 14,
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
              SizedBox(width: size.width * 0.46),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: GestureDetector(
                      onTap: () {
                        selectDate(context);
                      },
                      child: Icon(Icons.calendar_today)),
                ),
              )
            ],
          )),
    );
  }
}
