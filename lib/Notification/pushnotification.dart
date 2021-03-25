//import 'package:flutter/material.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

// class PushNotificationService {
//   // ignore: non_constant_identifier_names
//   final FirebaseMessaging firebase_messaging = FirebaseMessaging();

//   Future initialize() async {
//     firebase_messaging.configure(
//         onMessage: (Map<String, dynamic> message) async {
//       print("onMessage: $message");
//     }, onLaunch: (Map<String, dynamic> message) async {
//       print("onLaunch: $message");
//     }, onResume: (Map<String, dynamic> message) async {
//       print("onResume: $message");
//     });
//   }

//   Future<String> getToken() async {
//     String token = await firebase_messaging.getToken();
//     _ref = FirebaseDatabase.instance.reference().child('BookingInfo');
//     ref.child(currentFirebaseUser.uid).child("token").set(token);
//   }
// }
