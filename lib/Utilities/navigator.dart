import 'package:flutter/material.dart';
import 'package:smart_clean/Module/EventModule/Controller/EventDetailsController.dart';
import 'package:smart_clean/Module/EventModule/Controller/EventListController.dart';
import 'package:smart_clean/Module/EventModule/Screens/EventDetailsScreen.dart';
import 'package:smart_clean/Module/LoginModule/Controller/SignUpController.dart';

class NavigatorUtility {
  Future navigateToSignUpScreen(BuildContext context) async {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => SignUpController()));
  }

  Future navigateToEventListScreen(BuildContext context) async {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => EventListController()));
  }

  Future navigateToEventDetailScreen(
      BuildContext context, List eventDetails, int eventIndex) async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => EventDetailsController(
                eventDetailsList: eventDetails, eventIndex: eventIndex)));
  }
}
