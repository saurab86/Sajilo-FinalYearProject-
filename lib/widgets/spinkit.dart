import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sajilo/navpages/navscreens/navhandling.dart';

class Spinkit extends StatefulWidget {
  @override
  _SpinkitState createState() => _SpinkitState();
}

class _SpinkitState extends State<Spinkit> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => NavHome(),
        ),
      );
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SpinKitCubeGrid(
              size: 80.0,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 18.0,
          ),
          Text(
            "LOADING...",
            style: TextStyle(fontFamily: "Rubik", fontSize: 16.0),
          )
        ],
      ),
    );
  }
}
