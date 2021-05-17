import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sajilo/map/mapPage.dart';
// import 'package:shared_preferences/shared_preferences.dart';

String finalEmail;

class Spinkit2 extends StatefulWidget {
  @override
  _Spinkit2State createState() => _Spinkit2State();
}

class _Spinkit2State extends State<Spinkit2> {
  @override
  void initState() {
    super.initState();
    //getValidationData();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Maps(),
        ),
      );
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child:
                SpinKitFoldingCube(size: 80.0, color: Colors.orangeAccent[700]),
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
