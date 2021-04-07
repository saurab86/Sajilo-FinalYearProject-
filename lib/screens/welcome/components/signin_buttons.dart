import 'package:flutter/material.dart';
import 'package:sajilo/constants.dart';
import 'package:sajilo/screens/signup/signup1.dart';
//import '../../signup/signup.dart';
import '../../login/login.dart';
//import 'package:sajilo/widgets/sign_button.dart';

class SignButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future navigate(widget) =>
        Navigator.push(context, MaterialPageRoute(builder: (_) => widget));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // ignore: deprecated_member_use
        RaisedButton(
          child: Text(
            'New Account',
            style: TextStyle(color: Colors.white),
          ),
          color: primaryColor,
          onPressed: () => navigate(Signup1()),
                  ),
                  const SizedBox(height: 15),
                  // ignore: deprecated_member_use
                  RaisedButton(
                      child: Text(
                        'Login',
                        style: TextStyle(color: primaryHighLightColor),
                      ),
                      color: accentColor,
                      onPressed: () => navigate(Login())),
                ],
              );
            }
          }
          
          class SignUp1 {
}
