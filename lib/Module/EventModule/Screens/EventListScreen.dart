import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:smart_clean/Module/EventModule/Controller/EventListController.dart';
import 'package:smart_clean/Utilities/constants.dart';
import 'package:smart_clean/Utilities/navigator.dart';
import 'package:smart_clean/Utilities/textfield_utility.dart';

class EventListScreen extends EventListControllerState {
  @override
  void initState() {
    super.initState();
    fetchEvents();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: new Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(230),
          child: AppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
              child: Stack(
                children: [
                  Container(
                    color: Colors.black,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(top: 50, right: 28.0),
                      child: Container(
                        child: CircleAvatar(
                            radius: 65,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(55),
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage("assets/images/du.jpeg"),
                                        fit: BoxFit.fill)),
                              ),
                            )),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      onLogoutPress(context);
                    },
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(22.0),
                          child: Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
                        )),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 22.0, top: 120),
                          child: TextUtility(
                            color: Colors.white,
                            constantText: "Hi,",
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 22.0),
                          child: TextUtility(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.white,
                            constantText:
                                (userName != null) ? userName + "!" : "There !",
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50))),
          ),
        ),
        body: OfflineBuilder(
            connectivityBuilder: (
              BuildContext context,
              ConnectivityResult connectivity,
              Widget child,
            ) {
              final bool connected = connectivity != ConnectivityResult.none;
              return connected
                  ? Stack(
                      fit: StackFit.expand,
                      children: [
                        (userProfileList != null)
                            ? Padding(
                                padding: EdgeInsets.only(
                                  top: 15.0,
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              0.6,
                                          child: TextUtility(
                                            constantText:
                                                Constants().upcomingEvents,
                                            color: Colors.black,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          child: ListView.builder(
                                            physics: ClampingScrollPhysics(),
                                            scrollDirection: Axis.vertical,
                                            shrinkWrap: true,
                                            itemCount: userProfileList.length,
                                            itemBuilder: (context, index) {
                                              return Card(
                                                child: ListTile(
                                                  onTap: () {
                                                    NavigatorUtility()
                                                        .navigateToEventDetailScreen(
                                                            context,
                                                            userProfileList,
                                                            index);
                                                  },
                                                  leading: CircleAvatar(
                                                    backgroundImage: AssetImage(
                                                        'assets/images/fourth.jpeg'), // no matter how big it is, it won't overflow
                                                  ),
                                                  title: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(2.0),
                                                          child: TextUtility(
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 1,
                                                            constantText:
                                                                userProfileList[
                                                                        index][
                                                                    'EventName'],
                                                            color: Colors.black,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(2.0),
                                                          child: TextUtility(
                                                            constantText: "Time : " +
                                                                userProfileList[
                                                                            index]
                                                                        [
                                                                        'EventTime']
                                                                    .toString(),
                                                            color:
                                                                Colors.blueGrey,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  trailing: Icon(
                                                      Icons.arrow_forward_ios,
                                                      size: 18),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                child: Center(child: Text('Loading data')),
                              ),
                      ],
                    )
                  : Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.10,
                            width: MediaQuery.of(context).size.width * 0.50,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/no-wifi.png"),
                                    fit: BoxFit.fitHeight)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextUtility(
                              constantText:
                                  "Please check your internet connection",
                              maxLines: 2,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    );
            },
            child: Container()),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.black,
          onPressed: () {
            onAddNewEvent(context);
          },
          icon: Icon(Icons.add),
          label: Text(Constants().addEvent),
        ),
      ),
    );
  }
}
