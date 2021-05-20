import 'package:firebase_database/firebase_database.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sajilo/navpages/navscreens/navhandling.dart';
import 'package:sajilo/services/auth.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class LaptopServiceAnimationPage extends CupertinoPageRoute {
  LaptopServiceAnimationPage()
      : super(builder: (BuildContext context) => new LaptopRepBooking());

  // OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return new FadeTransition(
        opacity: animation, child: new LaptopRepBooking());
  }
}

// ignore: must_be_immutable
class LaptopRepBooking extends StatefulWidget {
  String sourcename;
  LaptopRepBooking({this.sourcename});
  @override
  _LaptopRepBookingState createState() => _LaptopRepBookingState();
}

class _LaptopRepBookingState extends State<LaptopRepBooking> {
  bool bookingstatus = true;
  TextEditingController _nameController,
      _mobilenumberController,
      _addressController,
     
      _descriptionController;
  DatabaseReference _ref;
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _mobilenumberController = TextEditingController();
    _addressController = TextEditingController();
    _descriptionController = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('BookingInfo');
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _mobilenumberController.dispose();
    _addressController.dispose();
    _descriptionController.dispose();
  }

  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler();

    AuthService data = Provider.of<AuthService>(context);
    DateTime now = new DateTime.now();
    Text('Time and Date: $now');
    return new Scaffold(
      backgroundColor: Color(0xFFF3F7FB),
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
                "Laptop Reparing",
                style: TextStyle(
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.bold,
                    fontSize: 13.0,
                    color: Colors.white),
              ),
              titlePadding: EdgeInsets.only(top: 2.0),
              centerTitle: true,
              background: Image.asset(
                'assets/appbarimage/laptop.png',
                fit: BoxFit.cover,
              ),
            ),
            centerTitle: true,
          ),
          SliverFillRemaining(
              hasScrollBody: true,
              child: SingleChildScrollView(
                child: Column(children: [
                  // SizedBox(
                  //  height: 25.0,
                  //),
                  Image.asset(
                    'assets/images/c1.png',
                    height: scale.getFullScreen(45),
                  ),

                  Image.asset(
                    'assets/images/c2.png',
                    height: scale.getFullScreen(25),
                  ),

                  Container(
                      child: Column(children: [
                         Text("Book Now",style: TextStyle(fontFamily: 'Newsreader',fontWeight: FontWeight.bold,fontSize: 20,
                    decoration: TextDecoration.underline)),
                    SizedBox(height: 12,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                         children:[ 
                           Text("Your current location:",style: TextStyle(fontFamily: 'Newsreader',fontSize: 18,fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width:5),
                      Icon(Icons.location_on,color: Colors.blue,)
                      ]
                    ),
                    SizedBox(height:5),
                  Text(widget.sourcename,style: TextStyle(fontFamily: 'Newsreader',fontSize: 17),),
                  SizedBox(height:12),

                    Row(children:[ 
                      Text("Your email:",style: TextStyle(fontFamily: 'Newsreader',fontSize: 17),),
                      SizedBox(width:8),
                      Text(data.userInfo,style: TextStyle(fontFamily: 'Newsreader',fontSize: 17),),
                    
                    ]),
                      ],),
                   ),
                   SizedBox(height: 12,),



                  //Full Name
                  TextFormField(
                    controller: _nameController,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_circle,color: Colors.blueGrey,),
                      hintText: 'Example:Jon Legend',
                      hintStyle: TextStyle(fontFamily: 'Newsreader'),
                      labelText: 'Full Name',
                      labelStyle: TextStyle(color: Colors.black,fontFamily: 'Newsreader',fontSize: 18),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      border: OutlineInputBorder(borderSide: BorderSide()),
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                    
                    ////////Mobile Number
                  TextFormField(
                    controller: _mobilenumberController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      prefixIcon: Icon(LineAwesomeIcons.phone,color: Colors.green,),
                      hintText: 'Example: 98********',
                       hintStyle: TextStyle(fontFamily: 'Newsreader'),
                      labelText: 'Enter Mobile Number',
                      labelStyle: TextStyle(color: Colors.black,fontFamily: 'Newsreader',fontSize: 18),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightGreen)),
                      border: OutlineInputBorder(borderSide: BorderSide()),
                    ),
                  ),
                  SizedBox(height: 12,),

                   //Problem Description Textfeild
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _descriptionController,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.live_help),
                      hintText: 'Describe Your Problem',
                      hintStyle: TextStyle(fontFamily: 'Newsreader'),
                      labelText: 'Problem Description',
                      labelStyle: TextStyle(color: Colors.black,fontFamily: 'Newsreader',fontSize: 18),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      border: OutlineInputBorder(borderSide: BorderSide()),
                    ),
                    maxLines: 3,
                  ),


                  SizedBox(
                    height: 15.0,
                  ),

                  //Book Button
                  ElevatedButton(
                    // color: Colors.redAccent,
                    onPressed: () {
                      if (_nameController.text.isEmpty ||
                         _descriptionController.text.isEmpty||
                          _mobilenumberController.text.isEmpty) {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(14.0)),
                                  backgroundColor: Colors.blueGrey[200],
                                  title: new Text(
                                    "Error",
                                    textAlign: TextAlign.center,
                                  ),
                                  content: new Text(
                                    "Please fill up all the description before booking.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'OK',
                                          style: TextStyle(fontSize: 16.0),
                                        ))
                                  ],
                                ));
                      } else {
                        saveBooking(data.userInfo, data.userID, now);
                      }
                    },
                    child: Text(
                      'Book Service',
                      style:
                          TextStyle(fontFamily: 'Newsreader', color: Colors.white,fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green
                    ),
                  )
                ]),
              ))
        ],
      ),
    );
  }

  void saveBooking(String a, String userID, now) {
    String name = _nameController.text;
    String address = widget.sourcename;
    //String ward = _wardController.text;
    String mobilenumber = _mobilenumberController.text;
    String service = "Laptop Reparing & Servicing";
    String problem = _descriptionController.text;
    String emailid = a;
    String x;
    String y = now.toString();
    if (bookingstatus == true) {
      x = "Pending";
    } else {
      x = "Accepted";
    }
    String servicestatus = "InProgress";

    Map<String, String> bookinginfo = {
      'name': name,
      'address': address,
     // 'ward': ward,
      'mobilenumber': mobilenumber,
      'ProblemDescription': problem,
      'service': service,
      'email': emailid,
      'UserID': userID,
      'BookingStatus': x,
      'BookedTimeAndDate': y,
      'serviceStatus': servicestatus,
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
                "You Have Successfully Booked Laptop Reparing.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => NavHome()));
                      Flushbar(
                        icon: Icon(
                          Icons.done_all_sharp,
                          size: 32.0,
                          color: Colors.blue,
                        ),
                        title: 'Successfully Booked',
                        message: 'Laptop problem',
                        flushbarPosition: FlushbarPosition.TOP,
                        duration: Duration(seconds: 2),
                        onTap: (_) {},
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
