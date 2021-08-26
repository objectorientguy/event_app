import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_clean/Module/EventModule/Controller/EventDetailsController.dart';
import 'package:smart_clean/Widgets/buttonWidget.dart';
import 'package:smart_clean/Utilities/constants.dart';
import 'package:smart_clean/Utilities/textfield_utility.dart';

class EventDetailScreen extends EventDetailsControllerState {
  int eventIndex;
  List eventDetailsList;

  EventDetailScreen({this.eventDetailsList, this.eventIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(280),
        child: AppBar(
          flexibleSpace: ClipRRect(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50)),
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/second.jpeg"),
                      fit: BoxFit.fill)),
            ),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50))),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 0.6,
                    child: TextUtility(
                      constantText:
                          eventDetailsList[eventIndex]['EventName'].toString(),
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )),
                Container(
                    width: MediaQuery.of(context).size.width / 0.6,
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 15,
                          color: Colors.blueGrey,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextUtility(
                            constantText: DateFormat('yMMMEd').format(
                                DateTime.parse(eventDetailsList[eventIndex]
                                        ['Date']
                                    .toDate()
                                    .toString())),
                            color: Colors.blueGrey,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )),
                Container(
                    width: MediaQuery.of(context).size.width / 0.6,
                    child: Row(
                      children: [
                        Icon(
                          Icons.watch_later_outlined,
                          size: 15,
                          color: Colors.blueGrey,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextUtility(
                            constantText: eventDetailsList[eventIndex]
                                    ['EventTime']
                                .toString(),
                            color: Colors.blueGrey,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )),
                Container(
                    width: MediaQuery.of(context).size.width / 0.6,
                    child: Row(
                      children: [
                        Icon(
                          Icons.people_rounded,
                          size: 15,
                          color: Colors.blueGrey,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextUtility(
                            constantText:
                                "${eventDetailsList[eventIndex]['NoOfAttendee'].toString()} people registered till now",
                            color: Colors.blueGrey,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )),
                Divider(),
                Container(
                    width: MediaQuery.of(context).size.width / 0.6,
                    child: TextUtility(
                      constantText: Constants().moreInformation,
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Container(
                      width: MediaQuery.of(context).size.width / 0.2,
                      child: TextUtility(
                        constantText: eventDetailsList[eventIndex]
                                ['EventDescription']
                            .toString(),
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ButtonWidget(
            buttonText: Constants().registerForEvent,
            onPressed: onRegisterButtonPress),
      ),
    );
  }
}
