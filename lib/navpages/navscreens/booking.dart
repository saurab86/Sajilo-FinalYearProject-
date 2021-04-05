// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Booking extends StatefulWidget {
  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  Query ref;
  DatabaseReference reference =
      FirebaseDatabase.instance.reference().child('BookingInfo');
  void initState() {
    super.initState();

    ref = FirebaseDatabase.instance.reference().child("BookingInfo");

    // ref = FirebaseDatabase.instance
    //     .reference()
    //     .child("BookingInfo")
    //     .orderByChild("UserID : " + FirebaseAuth.instance.currentUser.uid);
    //.equalTo('');
    ref = FirebaseDatabase.instance
        .reference()
        .child("BookingInfo")
        .orderByChild("UserID")
        .equalTo(FirebaseAuth.instance.currentUser.uid);
  }

  Widget _buildBookingItem({Map bookinginfo}) {
    if (bookinginfo['BookingStatus'] == 'Pending') {
      return SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.lightBlue[100],
          margin: EdgeInsets.symmetric(vertical: 8.0),
          padding: EdgeInsets.all(8.0),
          height: 160.0,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    //Person icon
                    Icon(
                      Icons.person,
                      size: 20,
                      color: Colors.indigo,
                    ),
                    SizedBox(
                      width: 8,
                    ),

                    //Name Text
                    Text(
                      "Name:",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Rubik',
                          color: Colors.brown[600]),
                    ),
                    SizedBox(
                      width: 8,
                    ),

                    //User Name from Databse
                    Text(
                      bookinginfo['name'],
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Rubik'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                SafeArea(
                  child: Row(
                    children: [
                      //Book icon
                      Icon(
                        Icons.book,
                        size: 20,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),

                      Text(
                        "Service Booked:",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'Rubik',
                            color: Colors.brown[600]),
                      ),
                      SizedBox(
                        width: 5,
                      ),

                      //Service name from database
                      Text(
                        bookinginfo['service'],
                        style: TextStyle(fontSize: 16.0, fontFamily: 'Rubik'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                SafeArea(
                    child: Row(
                  children: [
                    Icon(
                      Icons.pending_sharp,
                      size: 20,
                      color: Colors.redAccent,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Service Request:',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Rubik',
                          color: Colors.brown[600]),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      bookinginfo['BookingStatus'],
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Rubik'),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.hourglass_empty_rounded,
                      size: 20.0,
                    )
                  ],
                )),
                SafeArea(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        _showDeleteDialog(bookinginfo: bookinginfo);
                      },
                      child: Text(
                        'Cancel Request',
                        style: TextStyle(
                            fontFamily: 'Rubik', color: Colors.red[700]),
                      ),
                    ),
                    Icon(
                      Icons.clear_sharp,
                      color: Colors.red[700],
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
      );
    } else {
      return SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.lightBlue[100],
          margin: EdgeInsets.symmetric(vertical: 8.0),
          padding: EdgeInsets.all(8.0),
          height: 160.0,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    //Person icon
                    Icon(
                      Icons.person,
                      size: 20,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 8,
                    ),

                    //Name Text
                    Text(
                      "Name:",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Rubik',
                          color: Colors.brown[600]),
                    ),
                    SizedBox(
                      width: 8,
                    ),

                    //User Name from Databse
                    Text(
                      bookinginfo['name'],
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Rubik'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                SafeArea(
                  child: Row(
                    children: [
                      //Book icon
                      Icon(
                        Icons.book,
                        size: 20,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),

                      Text(
                        "Service Booked:",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'Rubik',
                            color: Colors.brown[600]),
                      ),
                      SizedBox(
                        width: 5,
                      ),

                      //Service name from database
                      Text(
                        bookinginfo['service'],
                        style: TextStyle(fontSize: 16.0, fontFamily: 'Rubik'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                SafeArea(
                    child: Row(
                  children: [
                    Icon(
                      Icons.pending_sharp,
                      size: 20,
                      color: Colors.redAccent,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Service Request:',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Rubik',
                          color: Colors.brown[600]),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      bookinginfo['BookingStatus'],
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Rubik'),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.done_all_sharp,
                      color: Colors.blueAccent,
                    )
                  ],
                )),
              ],
            ),
          ),
        ),
      );
    }
  }

//cancel request Dialig box

  _showDeleteDialog({Map bookinginfo}) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0)),
              backgroundColor: Colors.blueGrey[200],
              title: new Text(
                "Cancel Booking Request",
                style:
                    TextStyle(fontFamily: 'Rubik', backgroundColor: Colors.red),
                textAlign: TextAlign.center,
              ),
              content: new Text(
                "Do you really want to cancel request?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0, fontFamily: 'Rubik'),
              ),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      reference
                          .child(bookinginfo['key'])
                          .remove()
                          .whenComplete(() => Navigator.pop(context));
                          Fluttertoast.showToast(
                              msg: "Request Cancelled",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 4,
                              backgroundColor: Colors.teal,
                              textColor: Colors.white,
                              fontSize: 16.0);
                    },
                    child: Text(
                      'Yes',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Rubik',
                          color: Colors.white),
                    )),
                SizedBox(
                  width: 35.0,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'No',
                      style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 16.0,
                          color: Colors.white),
                    ))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    // AuthService data = Provider.of<AuthService>(context);
    // String uid = data.userID;
    // userrid(uid);
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        color: Colors.white,
        child: FirebaseAnimatedList(
            physics: BouncingScrollPhysics(),
            query: ref,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              Map bookinginfo = snapshot.value;
              bookinginfo['key'] = snapshot.key;
              return _buildBookingItem(bookinginfo: bookinginfo);
            }),
      ),
    );
  }
}
