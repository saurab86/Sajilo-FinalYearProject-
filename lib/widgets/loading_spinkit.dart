import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingSpincart extends StatefulWidget {
  @override
  _LoadingSpincartState createState() => _LoadingSpincartState();
}

class _LoadingSpincartState extends State<LoadingSpincart> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pop(context);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
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
