import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_clean/Utilities/globals.dart';

enum authProblems { UserNotFound, PasswordNotValid, NetworkError }

class DatabaseManager {
  FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User> createAccount(
      String name, String email, String password, DateTime birthday) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      User user = (await _auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;

      if (user != null) {
        print("Account created Succesfull");
        user.updateProfile(displayName: name);

        await firestoreInstance
            .collection('users')
            .doc(_auth.currentUser.uid)
            .set({
          "name": name,
          "email": email,
          "birthday": birthday,
          "uid": _auth.currentUser.uid,
        });
        prefs.setString('loggedIn', 'loggedIn');
        prefs.setString('userName', name.toString());
        return user;
      } else {
        print("Account creation failed");
        return user;
      }
    } catch (e) {
      accountExistsError = e.message.toString();
      return null;
    }
  }

  Future<User> logIn(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      User user = (await _auth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;

      if (user != null) {
        print("Login Sucessfull");

        firestoreInstance
            .collection('users')
            .doc(_auth.currentUser.uid)
            .get()
            .then((value) => user.updateProfile(displayName: value['name']));
        prefs.setString('loggedIn', 'loggedIn');
        prefs.setString('userName', _auth.currentUser.displayName.toString());

        return user;
      } else {
        print("Login Failed");
        return user;
      }
    } catch (e) {
      print(e);
      invalidPasswordError = e.message.toString();
      return null;
    }
  }

  Future<bool> addNewEvent(DateTime date, String eventTime, String eventName,
      String eventDescription) async {
    try {
      await firestoreInstance.collection('events').doc().set({
        "Date": date,
        "EventTime": eventTime,
        "EventName": eventName,
        "NoOfAttendee": 0,
        "EventDescription": eventDescription,
      }).then((value) => (print('Data updated')));
      return true;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future fetchEventList() async {
    List eventList = [];
    try {
      await firestoreInstance
          .collection('events')
          .get()
          .then((value) => (value.docs.forEach((element) {
                eventList.add(element.data());
                print('eventList' + eventList.toString());
              })));
      return eventList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
