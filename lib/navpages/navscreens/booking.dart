import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

// ignore: must_be_immutable
class Booking extends StatefulWidget {
   String dbk;
   Booking({this.dbk});
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
          height: 280.0,
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
                          fontFamily: 'Newsreader',
                          color: Colors.brown[600]),
                    ),
                    SizedBox(
                      width: 8,
                    ),

                    //User Name from Databse
                    Text(
                      bookinginfo['name'],
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
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
                            fontFamily: 'Newsreader',
                            color: Colors.brown[600]),
                      ),
                      SizedBox(
                        width: 5,
                      ),

                      //Service name from database
                      Text(
                        bookinginfo['service'],
                        style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
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
                          fontFamily: 'Newsreader',
                          color: Colors.brown[600]),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      bookinginfo['BookingStatus'],
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.hourglass_empty_rounded,
                      size: 20.0,
                    )
                  ],
                )),SizedBox(height:12),
                Row(
                  children: [
                    Icon(
                      LineAwesomeIcons.calendar,
                      size: 20,
                    ),
                    Text(
                      'Booked Date :',
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                    ),
                    SizedBox(width: 5),
                    Text(
                      bookinginfo['BookedTimeAndDate'],
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                    )
                  ],
                ),
                SizedBox(height:10),
                 Row(
                  children: [
                   
                    Text(
                      'Problem Description :',
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                                          child: Text(
                        bookinginfo['ProblemDescription'],
                        style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                      ),
                    )
                  ],
                ),
                SizedBox(height:12),
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
                            fontFamily: 'Newsreader', color: Colors.red[700],fontSize: 18),
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
    } 
    
    
    
    
    else if(bookinginfo['serviceStatus'] == 'Completed'){
      return SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.lightBlue[100],
          margin: EdgeInsets.symmetric(vertical: 8.0),
          padding: EdgeInsets.all(8.0),
          height: 290.0,
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
                          fontFamily: 'Newsreader',
                          color: Colors.brown[600]),
                    ),
                    SizedBox(
                      width: 8,
                    ),

                    //User Name from Databse
                    Text(
                      bookinginfo['name'],
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
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
                            fontFamily: 'Newsreader',
                            color: Colors.brown[600]),
                      ),
                      SizedBox(
                        width: 5,
                      ),

                      //Service name from database
                      Text(
                        bookinginfo['service'],
                        style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Icon(
                      LineAwesomeIcons.calendar,
                      size: 20,
                    ),
                    Text(
                      'Booked date:',
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                    ),
                    SizedBox(width: 5),
                    Text(
                      bookinginfo['BookedTimeAndDate'],
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                    )
                  ],
                ),
                SizedBox(height: 12),
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
                          fontFamily: 'Newsreader',
                          color: Colors.brown[600]),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      bookinginfo['BookingStatus'],
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.done_all_sharp,
                      color: Colors.blueAccent,
                    )
                  ],
                ),
                ),
               SizedBox(height:12),

               
                  Row(
                  children: [
                    Icon(
                      Icons.settings,
                      size: 20,
                      color: Colors.redAccent,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Service:',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Newsreader',
                          color: Colors.brown[600]),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      bookinginfo['serviceStatus'],
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.done_all,
                      size: 20.0,
                    )
                  ],
                ),


                SizedBox(height:12),
                 Row(
                  children: [
                    Text(
                      'Problem Description :',
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                    ),
                    SizedBox(width: 5,),
                  SizedBox(height:10),

                    Expanded(
                              child: Text(
                        bookinginfo['ProblemDescription'],
                        style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 12,),
                Text(" Service has been Sucessfully Completed! ",style: TextStyle(fontFamily: 'Newsreader',fontSize: 18,color: Colors.green[700],
              ),),
              ],
            ),
          ),
        ),
      );
    }
    
    
    
    
    
    else {
      return SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.lightBlue[100],
          margin: EdgeInsets.symmetric(vertical: 8.0),
          padding: EdgeInsets.all(8.0),
          height: 320.0,
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
                          fontFamily: 'Newsreader',
                          color: Colors.brown[600]),
                    ),
                    SizedBox(
                      width: 8,
                    ),

                    //User Name from Databse
                    Text(
                      bookinginfo['name'],
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
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
                            fontFamily: 'Newsreader',
                            color: Colors.brown[600]),
                      ),
                      SizedBox(
                        width: 5,
                      ),

                      //Service name from database
                      Text(
                        bookinginfo['service'],
                        style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Icon(
                      LineAwesomeIcons.calendar,
                      size: 20,
                    ),
                    Text(
                      'Booked date:',
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                    ),
                    SizedBox(width: 5),
                    Text(
                      bookinginfo['BookedTimeAndDate'],
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                    )
                  ],
                ),
                SizedBox(height: 12),
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
                          fontFamily: 'Newsreader',
                          color: Colors.brown[600]),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      bookinginfo['BookingStatus'],
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.done_all_sharp,
                      color: Colors.blueAccent,
                    )
                  ],
                ),
                ),
               SizedBox(height:12),

               
                  Row(
                  children: [
                    Icon(
                      Icons.settings,
                      size: 20,
                      color: Colors.redAccent,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Service:',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Newsreader',
                          color: Colors.brown[600]),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      bookinginfo['serviceStatus'],
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.hourglass_empty_rounded,
                      size: 20.0,
                    )
                  ],
                ),


                SizedBox(height:12),
                 Row(
                  children: [
                    Text(
                      'Problem Description :',
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                    ),
                    SizedBox(width: 5,),
                  SizedBox(height:10),

                    Expanded(
                              child: Text(
                        bookinginfo['ProblemDescription'],
                        style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                      ),
                    )
                  ],
                ),
                SizedBox(height:18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("If your Service is Completed, then please click:",style: TextStyle(color: Colors.indigo,
                    fontFamily: 'Newsreader',fontSize: 18),),
                ],),

                 Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(onPressed: ()
                    {
                       _serviceStatus(bookinginfo: bookinginfo);
                    }, child: Text("Service Completed",style: TextStyle(fontFamily: 'Newsreader'),),
                    style: ElevatedButton.styleFrom(primary:Colors.blueGrey),)
                ],),
                
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
                    TextStyle(fontFamily: 'Newsreader', backgroundColor: Colors.red),
                textAlign: TextAlign.center,
              ),
              content: new Text(
                "Do you really want to cancel request?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
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
                          fontFamily: 'Newsreader',
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
                          fontFamily: 'Newsreader',
                          fontSize: 16.0,
                          color: Colors.white),
                    ))
              ],
            ));
  }


  _serviceStatus({Map bookinginfo}){

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0)),
              backgroundColor: Colors.blueGrey[200],
              title: new Text(
                "Service Completed?",
                style: TextStyle(
                  fontFamily: 'Newsreader',
                ),
                textAlign: TextAlign.center,
              ),
              content: new Text(
                "Did your service completed by service Provider?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
              ),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      updateServiceStatus(
                          bookinginfo['key'], bookinginfo['serviceStatus']);
                    },
                    child: Text(
                      'Yes',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Newsreader',
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
                          fontFamily: 'Newsreader',
                          fontSize: 16.0,
                          color: Colors.white),
                    ))
              ],
            ));          }

  updateServiceStatus(String dbk, bookinginfo) async{
              await reference.child('$dbk').update({'serviceStatus':'Completed'}).whenComplete(() => 
              Navigator.pop(context));
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
