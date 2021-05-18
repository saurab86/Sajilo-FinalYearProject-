import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sajilo/navpages/navscreens/navhandling.dart';
import 'package:sajilo/navpages/navscreens/userprofile1.dart';
import 'package:sajilo/services/auth.dart';

// ignore: must_be_immutable
class UpdateProfile extends StatefulWidget {
  String profileKey;
  UpdateProfile({this.profileKey});
  @override  
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  TextEditingController _nameController,
      _addressController,
      _wardController,
      _mobileNumberController;
      DatabaseReference _ref;
  // String _name,_address,_ward,_mobilenmbr;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
    
void initState(){
  super.initState();
  _nameController = TextEditingController();
  _addressController = TextEditingController();
  _wardController = TextEditingController();
  _mobileNumberController = TextEditingController();
  _ref = FirebaseDatabase.instance.reference().child('UserProfile');
}


 @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _mobileNumberController.dispose();
    _wardController.dispose();
    _addressController.dispose();
  }

  Widget build(BuildContext context) {
    const curveHeight = 50.0;
    AuthService data = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true,title: Text("Update Profile",style: TextStyle(fontFamily: 'Rubik',fontSize: 20.0),),
      centerTitle:true,
      shape:const MyShapeBorder(curveHeight) ,),
      body: Center(
        child: Form(
           key: _formkey,
          child: SingleChildScrollView(
                      child: Column(
             
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 15)),
                      
                //User Name
                TextFormField(
                  controller: _nameController,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Please enter name";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle),
                    hintText: 'Example:Jon Legend',
                    labelText: 'Full Name',
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontFamily: 'SFProText',
                        fontSize: 18),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.redAccent)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    border: OutlineInputBorder(borderSide: BorderSide()),
                  ),
                ),
                SizedBox(
                  height: 16.0,

                  //UserAddress Textfeild
                ),
                TextFormField(
                  validator: (String value){
                    if (value.isEmpty) {
                      return "Please enter address feild";
                    }
                    return null;
                  },
                  controller: _addressController,
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(LineAwesomeIcons.address_card_1),
                    hintText: 'Example: Bhairawaha,Rupandehi',
                    labelText: 'Address',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    border: OutlineInputBorder(borderSide: BorderSide()),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),

                //User Ward Number Textfeild
                TextFormField(
                  validator: (String value){
                    if(value.isEmpty){
                      return "Please enter Ward Number";
                    }
                    return null;
                  },
                  controller: _wardController,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    prefixIcon: Icon(LineAwesomeIcons.street_view),
                    hintText: 'Ward Number',
                    labelText: 'Ward Number',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    border: OutlineInputBorder(borderSide: BorderSide()),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),

                //User Mobile number Textfeild
                TextFormField(
                  validator: (String value){
                    if (value.isEmpty) {
                      return "Please enter your number";
                      
                    }
                    if(value.length<10 || value.length> 10){
                      return "Please enter valid mobile number";
                    }
                    return null;
                  },
                  controller: _mobileNumberController,
                  keyboardType: TextInputType.phone,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    prefixIcon: Icon(LineAwesomeIcons.mobile_phone),
                    hintText: 'Example:  984*******',
                    labelText: 'Mobile Number',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    border: OutlineInputBorder(borderSide: BorderSide()),
                  ),
                ),

                SizedBox(height: 20.0),

                //Update Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.teal),
                  onPressed: () {
                    if (_formkey.currentState.validate()) {
                      return saveProfile(data.userID);
                    }
                    else print('Unsucessfull');
                    
                  },
                  child: Text(
                    'Update',
                    style: TextStyle(fontFamily: 'SFProText', fontSize: 18.0),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  

  saveProfile(String x)  {
  String name = _nameController.text;
  String address = _addressController.text;
  String ward = _wardController.text;
  String mobilenumber = _mobileNumberController.text;
  String userID= x;


  
    Map<String,String> userprofile = {
      'Name': name,
      'Address': address,
      'Ward': ward,
      'MobileNumber':mobilenumber,
      'UserID': userID,

    };
    
     //_ref.child("UserProfile").update({'Name':name,'Address':address,'Ward':ward,'MobileNumber':mobilenumber,'UserID':userID});
     _ref.child(widget.profileKey).update(userprofile).then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>NavHome())));

      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0)),
              backgroundColor: Colors.blueGrey[200],
              title: new Text(
                "ThankYou",
                style:
                    TextStyle(fontFamily: 'Rubik', backgroundColor: Colors.red),
                textAlign: TextAlign.center,
              ),
              content: new Text(
                "Profile Updated Successfully.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Fluttertoast.showToast(
                              msg: "Updated Successfully",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 4,
                              backgroundColor: Colors.teal,
                              textColor: Colors.white,
                              fontSize: 16.0)
                          .then((value) => Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) =>UserProfile1())));
                    },
                    child: Text(
                      'Ok',
                      style: TextStyle(fontSize: 16.0),
                    ))
              ],
            ));
  }
}

class MyShapeBorder extends ContinuousRectangleBorder {
  const MyShapeBorder(this.curveHeight);
  final double curveHeight;

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) => Path()
    ..lineTo(0, rect.size.height)
    ..quadraticBezierTo(
      rect.size.width / 2,
      rect.size.height + curveHeight * 2,
      rect.size.width,
      rect.size.height,
    )
    ..lineTo(rect.size.width, 0)
    ..close();
}