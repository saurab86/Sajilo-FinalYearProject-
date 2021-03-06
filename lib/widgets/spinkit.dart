// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sajilo/navpages/navscreens/navhandling.dart';
// import 'package:sajilo/screens/welcome/welcome.dart';
// import 'package:shared_preferences/shared_preferences.dart';

String finalEmail;

class Spinkit extends StatefulWidget {
  @override
  _SpinkitState createState() => _SpinkitState();
}

class _SpinkitState extends State<Spinkit> {
  @override
  void initState() {
    super.initState();
    //getValidationData();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => NavHome(),
        ),
      );
    });
  }

  // Future getValidationData() async {
  //   final SharedPreferences sharedPreferences =
  //       await SharedPreferences.getInstance();
  //   var obtainedEmail = sharedPreferences.getString('email');
  //   setState(() {
  //     finalEmail = obtainedEmail;
  //   });
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child:
                SpinKitChasingDots(size: 80.0, color: Colors.orangeAccent[700]),
          ),
          SizedBox(
            height: 18.0,
          ),
          Text(
            "LOADING...",
            style: TextStyle(
                fontFamily: "Rubik", fontSize: 16.0, color: Colors.white),
          )
        ],
      ),
    );
  }
}
