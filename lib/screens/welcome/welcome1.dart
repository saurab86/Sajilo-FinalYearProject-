import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

// ignore: unused_import
import 'components/divider.dart';
import 'components/signin_buttons.dart';
// ignore: unused_import
import 'components/social_media_buttons.dart';


class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

    Future<bool> _onBackPressed() {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0)),
              backgroundColor: Colors.white,
              title: Text("Do you really want to exit?"),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: Text(
                      "No",
                      style: TextStyle(fontFamily: 'Rubik', fontSize: 17.0),
                    )),
                TextButton(
                    onPressed: () => SystemNavigator.pop(),
                    child: Text(
                      "Yes",
                      style: TextStyle(fontFamily: 'Rubik', fontSize: 17.0),
                    ))
              ],
            ));
  }
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler();
  return WillPopScope(
    onWillPop: _onBackPressed,
    child: Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/applogo.png',
                height: scale.getFullScreen(20),
              ),
              SizedBox(height: scale.getHeight(1)),
              SignButtons(),
              const SizedBox(height: 25),
              
              //ConnectWithSocialAccount(),
              SizedBox(
                height: 18.0,
              ),
            ],
          ),
        ),
      ),
    ),
  );

  }
}