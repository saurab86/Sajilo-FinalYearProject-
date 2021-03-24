import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sajilo/navpages/navscreens/navhandling.dart';
import 'package:sajilo/services/auth.dart';

class HaircutBooking extends StatefulWidget {
  @override
  _HaircutBookingState createState() => _HaircutBookingState();
}

class _HaircutBookingState extends State<HaircutBooking> {
  TextEditingController _nameController,
      _mobilenumberController,
      _addressController,
      _wardController;

  DatabaseReference _ref;
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _mobilenumberController = TextEditingController();
    _addressController = TextEditingController();
    _wardController = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('BookingInfo');
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _mobilenumberController.dispose();
    _wardController.dispose();
    _addressController.dispose();
  }

  Widget build(BuildContext context) {
    AuthService data = Provider.of<AuthService>(context);
    return Scaffold(
        backgroundColor: Colors.teal,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: true,
              leading: BackButton(
                color: Colors.black,
              ),
              expandedHeight: 250.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                title: Text(
                  "Haircut and Salon Service",
                  style: TextStyle(
                      fontFamily: 'Rubik',
                      //color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.0),
                ),
                background: Image.asset(
                  'assets/appbarimage/barber.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              centerTitle: true,
            ),
            SliverFillRemaining(
                hasScrollBody: true,
                child: SingleChildScrollView(
                  child: Column(children: [
                    SizedBox(
                      height: 18.0,
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    //Full Name
                    TextField(
                      controller: _nameController,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
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

                    //Mobile Number
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
                          saveBooking(data.userInfo, data.userID);
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
        ));
  }

  void saveBooking(String a, String userID) {
    String name = _nameController.text;
    String address = _addressController.text;
    String ward = _wardController.text;
    String mobilenumber = _mobilenumberController.text;
    String service = "Haircut and Salon Service";
    String emailid = a;
    String bookingstatus = 'Pending';
    Map<String, String> bookinginfo = {
      'name': name,
      'address': address,
      'ward': ward,
      'mobilenumber': mobilenumber,
      'service': service,
      "email": emailid,
      'UserID': userID,
      'BookingStatus': bookingstatus,
    };
    _ref.push().set(bookinginfo);
    showDialog(
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
                "You Have Successfully booked Haircut Service.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => NavHome()))
                          .then((value) {
                        this.dispose();
                      });
                    },
                    child: Text(
                      'OK',
                      style: TextStyle(fontSize: 16.0),
                    ))
              ],
            ));
  }
}
