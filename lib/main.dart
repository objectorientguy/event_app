import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_clean/Module/EventModule/Controller/EventListController.dart';
import 'package:smart_clean/Module/LoginModule/Controller/LoginController.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var loggedIn = prefs.getString('loggedIn');
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: loggedIn == null ? LoginController() : EventListController()));
}
