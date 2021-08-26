import 'package:flutter/material.dart';
import 'package:smart_clean/Module/EventModule/Screens/EventDetailsScreen.dart';
import 'package:smart_clean/Utilities/constants.dart';
import 'package:smart_clean/Utilities/navigator.dart';
import 'package:smart_clean/Utilities/textfield_utility.dart';
import 'package:smart_clean/Utilities/toast_utility.dart';

class EventDetailsController extends StatefulWidget {
  int eventIndex;
  List eventDetailsList;

  EventDetailsController({this.eventDetailsList, this.eventIndex});

  @override
  EventDetailsControllerState createState() => new EventDetailScreen(
      eventDetailsList: eventDetailsList, eventIndex: eventIndex);
}

abstract class EventDetailsControllerState
    extends State<EventDetailsController> {
  int eventIndex;
  List eventDetailsList;

  EventDetailsControllerState({this.eventDetailsList, this.eventIndex});

  onRegisterButtonPress() {
    ToastUtility.showToastAtCenter(context, Constants().successfulRegistration);
    NavigatorUtility().navigateToEventListScreen(context);
  }
}
