import 'package:firebase_database/firebase_database.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sajilo/navpages/navscreens/navhandling.dart';
import 'package:sajilo/services/auth.dart';

class BikeserviceAnimationPage extends CupertinoPageRoute {
 

   BikeserviceAnimationPage()
      : super(builder: (BuildContext context) => new BikeReparingService());

  // OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return new FadeTransition(
        opacity: animation, child: new BikeReparingService());
  }
}

// ignore: must_be_immutable
class BikeReparingService extends StatefulWidget {
  String autofetch;
BikeReparingService({this.autofetch});
  @override
  _BikeReparingServiceState createState() => _BikeReparingServiceState();
}

class _BikeReparingServiceState extends State<BikeReparingService> {
  TextEditingController _nameController,
      _mobilenumberController,
      _addressController,
      _wardController;

  DatabaseReference _ref;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController();
    _mobilenumberController = TextEditingController();
    _addressController = TextEditingController();
    _wardController = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('BookingInfo');
  }

  Widget build(BuildContext context) {
    AuthService data = Provider.of<AuthService>(context);
    DateTime now = DateTime.now();
    Text('Time and Date: $now');
    return new Scaffold(
      backgroundColor: Colors.teal,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: true,
            leading: BackButton(
              color: Colors.black,
            ),
            expandedHeight: 250.0,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              title: Text(
                "Bike Reparing and Servicing",
                style: TextStyle(
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.bold,
                    fontSize: 13.0,
                    color: Colors.black),
              ),
              centerTitle: true,
              titlePadding: EdgeInsets.only(top: 2.0),
              background: Image.asset(
                'assets/appbarimage/bikeservicing.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFillRemaining(
              hasScrollBody: true,
              child: SingleChildScrollView(
                child: Column(children: [
                  SizedBox(
                    height: 18.0,
                  ),

                  //Full Name
                  TextField(
                     
                    controller: _nameController,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.account_circle),
                      hintText: 'Example:Jon Legend',
                      labelText: 'Full Name',
                      labelStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightGreen)),
                      border: OutlineInputBorder(borderSide: BorderSide()),

                    ),
                    
                    
                  ),
                  SizedBox(
                    height: 12.0,
                  ),

                  //Address
                  TextFormField(
                    controller: _addressController,
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.add_location),
                      hintText: 'Example: Bhairahawa,Rupandehi',
                      labelText: 'Enter Address',
                      labelStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightGreen)),
                      border: OutlineInputBorder(borderSide: BorderSide()),
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),

                  //Ward No.
                  TextFormField(
                    controller: _wardController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.blur_linear),
                      hintText: 'Example: Ward-10',
                      labelText: 'Enter Ward Number',
                      labelStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightGreen)),
                      border: OutlineInputBorder(borderSide: BorderSide()),
                    ),
                  ),

                  SizedBox(
                    height: 12.0,
                  ),
//

                  TextFormField(
                    controller: _mobilenumberController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone_iphone),
                      hintText: 'Example: 98********',
                      labelText: 'Enter Mobile Number',
                      labelStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightGreen)),
                      border: OutlineInputBorder(borderSide: BorderSide()),
                    ),
                  ),

                  SizedBox(height: 12.0),

                  Text(
                    "Give your location access",
                    style: TextStyle(fontFamily: 'Rubik', fontSize: 16.0),
                  ),

                  //Location Button
                  IconButton(
                      icon: Icon(
                        Icons.my_location,
                        color: Colors.indigo,
                        size: 30.0,
                      ),
                      onPressed: () {}),

                  SizedBox(
                    height: 15.0,
                  ),

                  //Book Button
                  ElevatedButton(
                    //color: Colors.redAccent,
                    onPressed: () {
                      if (_nameController.text.isEmpty ||
                          _addressController.text.isEmpty ||
                          _wardController.text.isEmpty ||
                          _mobilenumberController.text.isEmpty) {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  backgroundColor: Colors.white,
                                  shape: CircleBorder(),
                                  title: new Text(
                                    "Error",
                                    textAlign: TextAlign.center,
                                  ),
                                  content: Text(
                                    "Please fill up all the description before booking",
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('OK'))
                                  ],
                                ));
                      } else {
                        saveBooking(data.userInfo, data.userID,now);
                      }
                    },
                    child: Text(
                      'Book Service',
                      style:
                          TextStyle(fontFamily: 'Rubik', color: Colors.white),
                    ),
                  )
                ]),
              ))
        ],
      ),
    );
  }

  void saveBooking(String a, String userID,now) {
    String name = _nameController.text;
    String address = _addressController.text;
    String ward = _wardController.text;
    String mobilenumber = _mobilenumberController.text;
    String service = "Bike reparing & Servicing";
    String emailid = a;
    String bookingstatus = 'Pending';
    String y = now.toString();
    String servicestatus = "InProgress";
    String acceptedby = "";

    Map<String, String> bookinginfo = {
      'name': name,
      'address': address,
      'ward': ward,
      'mobilenumber': mobilenumber,
      'service': service,
      'email': emailid,
      'UserID': userID,
      'BookingStatus': bookingstatus,
      'BookedTimeAndDate':y,
      'serviceStatus': servicestatus,
      'AcceptedBy':acceptedby,
    };
    _ref.push().set(bookinginfo);

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
                "You Have Successfully Booked Bike reparing Service.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>NavHome()));
                     Flushbar(
                       icon: Icon(Icons.done_all_sharp,size: 32.0,color: Colors.blue,),
                       title: 'Successfully Booked',
                       message: 'Bike reparing services',
                       flushbarPosition: FlushbarPosition.TOP,
                       duration: Duration(seconds: 2),
                       flushbarStyle: FlushbarStyle.FLOATING,
                       onTap: (_){},
                     ).show(context);
                    
                    },
                    child: Text(
                      'OK',
                      style: TextStyle(fontSize: 16.0),
                    ))
              ],
            ));
  }
}
