import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_clean/Module/EventModule/Screens/EventListScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_clean/API/Methods.dart';
import 'package:smart_clean/Module/LoginModule/Controller/LoginController.dart';
import 'package:smart_clean/Utilities/constants.dart';
import 'package:smart_clean/Utilities/navigator.dart';
import 'package:smart_clean/Utilities/progressBarUtility.dart';
import 'package:smart_clean/Utilities/toast_utility.dart';
class EventListController extends StatefulWidget {
  @override
  EventListControllerState createState() => new EventListScreen();
}

abstract class EventListControllerState extends State<EventListController> {
  
  List userProfileList = [];
  var userName;
  DateTime selectedDate = DateTime.now();
  final TextEditingController eventName = TextEditingController();
  final TextEditingController eventTime = TextEditingController();
  final TextEditingController eventInfo = TextEditingController();
  bool isLoading = false;
  DateTime picked;

  selectEventDate(BuildContext context) async {
    picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
  fetchEvents() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userName = prefs.getString('userName');
    dynamic result = await DatabaseManager().fetchEventList();
    if (result == null) {
      print('no data');
    } else {
      setState(() {
        userProfileList = result;
      });
      print('userProfileList' + userProfileList.toString());
    }
  }
  onSubmitNewEventPress() {
    if (eventName.text.isNotEmpty &&
        eventTime.text.isNotEmpty &&
        eventInfo.text.isNotEmpty &&
        selectedDate.toString().isNotEmpty) {
      ProgressBarWidget().showLoaderDialog(context);
      DatabaseManager()
          .addNewEvent(selectedDate, eventTime.text, eventName.text, eventInfo.text)
          .then((value) {
        if (value == true) {
          Navigator.pop(context);
          ToastUtility.showToastAtBotton(context, "Event added successfully!");

          NavigatorUtility().navigateToEventListScreen(context);
        } else {
          ToastUtility.showToastAtBotton(
              context, "Something went wrong, please try again later");

          Navigator.pop(context);
        }
      });
    } else {
      ToastUtility.showToastAtBotton(context, "Please fill the entire form");
    }
  }
  onLogoutPress(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.clear();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginController()),
                (Route<dynamic> route) => false);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Logout"),
      content: Text("Do you really want to logout?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  onAddNewEvent (BuildContext context){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Text('New Event'),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: eventName,
                      inputFormatters: [
                        new LengthLimitingTextInputFormatter(30),
                      ],
                      decoration: InputDecoration(
                        labelText: 'Event Name',
                        icon: Icon(Icons.event),
                      ),
                    ),
                    TextFormField(
                      textCapitalization: TextCapitalization.characters,
                      controller: eventTime,
                      inputFormatters: [
                        new LengthLimitingTextInputFormatter(30),
                      ],
                      decoration: InputDecoration(
                        labelText: 'Event Time',
                        icon: Icon(Icons.watch_later_outlined),
                      ),
                    ),
                    TextField(
                      readOnly: true,
                      inputFormatters: [
                        new LengthLimitingTextInputFormatter(1),
                      ],
                      decoration: InputDecoration(
                          hintText: (picked != null)
                              ? picked
                              .toString()
                              .substring(0, 11)
                              .toString()
                              : "",
                          labelText: (picked != null)
                              ? picked
                              .toString()
                              .substring(0, 11)
                              .toString()
                              : "Event Date",
                          icon: Icon(Icons.calendar_today_outlined),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                selectEventDate(context);
                              },
                              child:
                              Icon(Icons.calendar_today_outlined))),
                    ),
                    TextFormField(
                      controller: eventInfo,
                      inputFormatters: [
                        new LengthLimitingTextInputFormatter(100),
                      ],
                      decoration: InputDecoration(
                        labelText: Constants().moreInfo,
                        icon: Icon(Icons.info),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              RaisedButton(
                  child: Text(Constants().submitText),
                  onPressed: () {
                    onSubmitNewEventPress();
                    // your code
                  }),
              RaisedButton(
                  child: Text(Constants().cancelText),
                  onPressed: () {
                    Navigator.pop(context);
                    // your code
                  })
            ],
          );
        });
  }
}