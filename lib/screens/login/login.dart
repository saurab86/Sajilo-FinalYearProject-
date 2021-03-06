import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';
import 'package:sajilo/screens/signup/signup1.dart';
import 'package:sajilo/widgets/custom_password_feild.dart';
import 'package:sajilo/widgets/spinkit.dart';
//import 'package:sajilo/widgets/spinkit.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import '../../services/auth.dart';
import '../../widgets/question_row.dart';
// import '../../widgets/custom_text_field.dart';
import '../../widgets/sign_button.dart';

TextEditingController _emailController =TextEditingController();
 // final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
class Login extends StatelessWidget {
final GlobalKey<FormState>_formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    AuthService data = Provider.of<AuthService>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Form(
         key:  _formkey,
              child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 50)),
                    Image.asset('assets/images/applogo.png',
            height: scale.getHeight(20)),
                    Padding(padding: EdgeInsets.all(20.0)),
                    Text(
                      "Enter your valid email and password for login",
                      textAlign: TextAlign.center,
                      style: TextStyle(
              fontSize: 18.0,
              fontFamily: 'Rubik',
              fontWeight: FontWeight.w300,
              color: Colors.black,
              fontStyle: FontStyle.normal),
                    ),
                    SizedBox(height: scale.getHeight(2.0)),
                    Padding(padding: EdgeInsets.only(top: 2.0)),
                    Material(
            elevation: 8,
            shape: const StadiumBorder(),
            shadowColor: Color(0xFFFB6158).withOpacity(0.2),
            child: TextFormField(
               validator: (String value) {
              if (value.isEmpty) {
            return "Please enter email";
              }
              return null;
            },
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                hintText: 'Enter Your Email', icon: Icon(Icons.email)),
              onChanged: (value) => data.email = value,
            ),
                      ),
                    const SizedBox(height: 12.0),
                    CustomTextField1(
                        validator: (String value) {
              if (value.isEmpty) {
            return "Please enter Password";
              }
              return null;
            },
                      hintText: 'Password',
                      onChanged: (value) => data.password = value,
                    ),
                    const SizedBox(height: 25),
                    SignButton(
                      text: 'Log in',
                      onPressed: () { 
            
                     
            
                      //  addStringToSF();
           if(_formkey.currentState.validate()) {data.signInWithEmailAndPassword().whenComplete(() {
              if (data.userLoggedIn) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => Spinkit()));
              } else {
                showDialog(
                    context: context,
                    builder: (_) => new AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              backgroundColor: Colors.white,
              title: new Text(
                "Error 404",
                textAlign: TextAlign.center,
              ),
              content: new Text(
                "Username and password didn't match or may be account not registered",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              actions: <Widget>[],
            ));
              }
            });} else return "UnSucessful";
             
             },
                     
                    ),
                    const SizedBox(height: 35),
                    QuestionRow(
                      question: "Don't have an account?",
                      functionText: 'Create now',
                      widget: Signup1(),
                    ),
                  ],
                ),
          ),
        ),
      ),
    );
  }
}

// addStringToSF() async{
// final SharedPreferences sharedPreferences =
//                       await SharedPreferences.getInstance();
//                    sharedPreferences.setString('email', _emailController.text);
// }