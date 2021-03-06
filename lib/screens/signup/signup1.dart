import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sajilo/screens/login/login.dart';
import 'package:sajilo/services/auth.dart';
// ignore: unused_import
import 'package:sajilo/widgets/custom_password_feild.dart';
// ignore: unused_import
import 'package:sajilo/widgets/custom_text_field.dart';
import 'package:sajilo/widgets/question_row.dart';
import 'package:sajilo/widgets/sign_button.dart';

class Signup1 extends StatefulWidget {
  @override
  _Signup1State createState() => _Signup1State();
}

class _Signup1State extends State<Signup1> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
    bool _obscureText = true;
  TextEditingController _nameController,_emailController,_passwordController,
      _addressController,
      _wardController,
      _mobileNumberController;
  DatabaseReference _ref;
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _addressController = TextEditingController();
    _wardController = TextEditingController();
    _mobileNumberController = TextEditingController();

    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('UserProfile');
  }

  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    AuthService data = Provider.of<AuthService>(context);
    // ignore: deprecated_member_use
    final _firestore = FirebaseFirestore.instance;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formkey,
              child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 140),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/applogo.png',
                    height: scale.getHeight(18)),
                SizedBox(
                  height: 12,
                ),

                //Full Name Textfeild
                TextFormField(
                  
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: 'Enter Full Name',
                    prefixIcon: Icon(LineAwesomeIcons.user_1),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                           ),
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontFamily: 'SFProText',fontSize: 18),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Please enter Name";
                    }
                     if(value.length>20){
                      return "Name should be less than 20 characters";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 12,
                ),

                //address textfeild
                TextFormField( 
                   validator: (String value) {
                    if (value.isEmpty) {
                      return "Please enter your Address";
                    }
                     if(value.length>20){
                      return "Address shouldn't be more than 20 characters";
                    }
                    return null;
                  },
                  controller: _addressController,
                  decoration: InputDecoration(
                    hintText: 'Enter your address',
                    prefixIcon: Icon(LineAwesomeIcons.address_card_1),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                           ),
                  keyboardType: TextInputType.streetAddress,
                    style: TextStyle(fontFamily: 'SFProText',fontSize: 18)
                ),
                SizedBox(height: 12),

                //ward number Textfeild
                TextFormField( 
                   validator: (String value) {
                    if (value.isEmpty) {
                      return "Please enter your Ward Number";
                    }
                     if(value.length>2){
                      return "Ward should be less than 2 characters";
                    }
                    return null;
                  },
                  controller: _wardController,
                  decoration: InputDecoration(
                    hintText: 'Enter your ward number',
                    prefixIcon: Icon(LineAwesomeIcons.location_arrow),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                           ),
                  keyboardType: TextInputType.number,
                    style: TextStyle(fontFamily: 'SFProText',fontSize: 18)
                ),
                SizedBox(
                  height: 12.0,
                ),

                //mobile number textfeild
               TextFormField( 
                  validator: (String value){
                    if (value.isEmpty) {
                      return "Please enter your mobile number";
                      
                    }
                    if(value.length<10 || value.length> 10){
                      return "Please enter valid mobile number";
                    }
                    return null;
                  },
                  controller: _mobileNumberController,
                  decoration: InputDecoration(
                    hintText: 'Enter your mobile number',
                    prefixIcon: Icon(LineAwesomeIcons.mobile_phone),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                           ),
                  keyboardType: TextInputType.phone,
                    style: TextStyle(fontFamily: 'SFProText',fontSize: 18)
                ),
                SizedBox(
                  height: 12,
                ),

                //Email Textfeild
                TextFormField( 
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Please enter email";
                    }
                    return null;
                  },
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    prefixIcon: Icon(Icons.mail_outline_rounded),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                           ),
                  keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontFamily: 'SFProText',fontSize: 18),
                    onChanged: (value) => data.email = value,

                ),
                // CustomTextField(
                //   validator: (String value) {
                //     if (value.isEmpty) {
                //       return "Please enter email";
                //     }
                //     return null;
                //   },
                //   keyboardType: TextInputType.emailAddress,
                //   hintText: 'Your Email',
                //   onChanged: (value) => data.email = value,
                // ),
                const SizedBox(height: 12),

                //Password Textfeild
                // CustomTextField1(
                //   hintText: 'Password',
                //   onChanged: (value) => data.password = value,
                // ),

                    TextFormField( 
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Please enter password";
                    }
                    if(value.length<6){
                      return "Password length must be atleast 6";
                    }
                    if(value.length>15){
                      return"Password length must be less than 15";
                    }
                    return null;
                  },
                  obscureText: _obscureText,
                controller: _passwordController,
                decoration: InputDecoration(
                hintText: 'Enter password',
                prefixIcon: Icon(Icons.vpn_key_outlined),
                 suffixIcon: IconButton(
                icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                }),
                border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                           ),
                  keyboardType: TextInputType.text,
                    style: TextStyle(fontFamily: 'SFProText',fontSize: 18),
                    onChanged: (value) => data.password = value,
                    

                ),


              

                const SizedBox(height: 25),
                //SignupButton
                SignButton(
                  text: 'Sign up',
                  onPressed: () {
                    
                    //saveUserProfile();
                   if(_formkey.currentState.validate()){
                    data.createAccountWithEmailAndPassword().then((signedInUser) {
                      _firestore.collection('Users').add({
                        'email': data.email,
                        'userID': data.userID,
                        'password': data.password,
                      });
                      saveUserProfile(data.userID);
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
                                  content: new Column(
                                 mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text("Cause of error"),
                                      Text("1. email must be valid"),
                                      Text("2. text feild mustnot be empty"),
                                      Text("3. accoucnt may be already registerd")
                                    ],
                                  ),
                                  actions: <Widget>[],
                                ));
                      }
                    });
                  } else return "UnSucessful";
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
      ),
    );
  }

  void saveUserProfile(userid) {
    String name = _nameController.text;
    String address = _addressController.text;
    String ward = _wardController.text;
    String mobilenumber = _mobileNumberController.text;
    String email = _emailController.text;
    String id = userid;
    String profilepic = "https://firebasestorage.googleapis.com/v0/b/sajilo-3cf2f.appspot.com/o/user.png?alt=media&token=8bb7f6a3-fed4-46c8-ad1c-d73054086723";
    // String password = passwordController.text;

    Map<String, String> userprofile = {
      'Name': name,
      'Address': address,
      'Ward': ward,
      'MobileNumber': mobilenumber,
      'Email': email,
      'UserID':id,
      'profilepic': profilepic

    };
    _ref.push().set(userprofile);
  }
}
