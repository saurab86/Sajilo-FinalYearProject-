import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sajilo/navpages/navscreens/booking.dart';
import 'package:sajilo/navpages/navscreens/info.dart';
import 'package:sajilo/navpages/navscreens/mainhome.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sajilo/navpages/navscreens/userprofile1.dart';
import 'package:sajilo/navpages/search.dart';

class NavHome extends StatefulWidget {
  @override
  _NavHomeState createState() => _NavHomeState();
}

class _NavHomeState extends State<NavHome> {
  var _page = 0;
  final pages = [MainHome(), Booking(), Info(), UserProfile1(),Search()];

  Future<bool> _onBackPressed() {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0)),
              backgroundColor: Colors.white,
              title: Text("Do you really want to exit?"),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: Text(
                      "No",
                      style: TextStyle(fontFamily: 'Rubik', fontSize: 17.0),
                    )),
                TextButton(
                    onPressed: () => SystemNavigator.pop(),
                    child: Text(
                      "Yes",
                      style: TextStyle(fontFamily: 'Rubik', fontSize: 17.0),
                    ))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Sajilo",
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Newsreader', fontWeight: FontWeight.w500,fontSize: 28),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        backgroundColor: Colors.indigo[50],
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.lightBlue,
          animationCurve: Curves.ease,
          index: 0,
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          items: [
            Icon(
              LineAwesomeIcons.home,
              size: 30,
            ),
            Icon(Icons.book, size: 30),
            Icon(Icons.info_outline, size: 30),
            Icon(Icons.perm_identity, size: 30),
            Icon(Icons.search,size:30)
          ],
          height: 53.0,
          animationDuration: Duration(milliseconds: 500),
        ),
        body: pages[_page],
      ),
    );
  }
}
