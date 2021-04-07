import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';
import 'package:sajilo/widgets/customMobileFeild.dart';
import 'package:sajilo/widgets/custom_password_feild.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sajilo/widgets/customnametextfeild.dart';
import 'package:sajilo/widgets/customwardfeild.dart';
import '../../services/auth.dart';
import '../../widgets/question_row.dart';
import '../login/login.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/sign_button.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    AuthService data = Provider.of<AuthService>(context);
    // ignore: deprecated_member_use
    final _firestore = Firestore.instance;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 140),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/applogo.png',
                  height: scale.getHeight(18)),
             SizedBox(height: 12,),

               //Full Name Textfeild
              CustomNameTextField(
                keyboardType: TextInputType.text,
                hintText: 'Enter Full Name',
              ),
             SizedBox(height: 12,),
          


        //
           CustomWardTextField(
             keyboardType: TextInputType.number,
             hintText: 'Enter your ward number',
           ),
         SizedBox(height: 12.0,),
       
       
        //mobile number textfeild
    CustomMobileTextField(
      keyboardType: TextInputType.phone,
      hintText: 'Enter your mobile number',
    ),
    SizedBox(height: 12,),

       
          //Email Textfeild
              CustomTextField(
                keyboardType: TextInputType.emailAddress,
                hintText: 'Your Email',
                onChanged: (value) => data.email = value,
              ),
              const SizedBox(height: 15),

          //Password Textfeild
              CustomTextField1(
                hintText: 'Password',
                onChanged: (value) => data.password = value,
              ),
              const SizedBox(height: 25),
              SignButton(
                text: 'Sign up',
                onPressed: () {
                  data.createAccountWithEmailAndPassword().then((signedInUser) {
                    _firestore.collection('Users').add({
                      'email': data.email,
                      'userID': data.userID,
                      'password': data.password,
                    });
                  }).whenComplete(() {
                    if (data.userLoggedIn) {
                      showDialog(
                          context: context,
                          builder: (_) => new AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0)),
                                backgroundColor: Colors.white,
                                title: new Text(
                                  "Sucessfully Registered",
                                  textAlign: TextAlign.center,
                                ),
                                content: new Text(
                                  "Press OK to signin to your account",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => Login()));
                                      },
                                      child: Text("OK"))
                                ],
                              ));
                    } else {
                      showDialog(
                          context: context,
                          builder: (_) => new AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0)),
                                backgroundColor: Colors.blueGrey[200],
                                title: new Text(
                                  "Error 404",
                                  textAlign: TextAlign.center,
                                ),
                                content: new Text(
                                  "enter valid email format for registeration",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                                actions: <Widget>[],
                              ));
                    }
                  });
                },
              ),
              const SizedBox(height: 35),
              QuestionRow(
                question: "Already have an account?",
                functionText: 'Login',
                widget: Login(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
