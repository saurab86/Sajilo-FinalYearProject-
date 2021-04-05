import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sajilo/navpages/navscreens/userprofile1.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class Info extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<Info> {
  Future<void> _launched;

  // ignore: unused_element
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'helpsajilo@gmail.com',
      queryParameters: {'subject': 'Help for :'});

  Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return const Text('');
    }
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 150.0,
            ),
            Column(
              children: <Widget>[
                Text(
                  "For any help:",
                  style: TextStyle(fontFamily: 'Rubik', fontSize: 18.0),
                ),

                SizedBox(
                  height: 20.0,
                ),
                TextButton(
                  onPressed: () => setState(() {
                    _launched = _makePhoneCall('tel:071-27471');
                  }),
                  // padding: EdgeInsets.all(10),
                  child: new Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Image.asset(
                        'assets/images/phone.png',
                        height: 40.0,
                        width: 40.0,
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: new Text(
                            "Call Now",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'Rubik',
                            ),
                          )),
                    ],
                  ),
                ),
                // FlatButton(
                //   onPressed: () => setState(() {
                //     _launched = _launchInBrowser('http://nec.edu.np/');
                //   }),
                //   padding: EdgeInsets.all(10),
                //   child: new Row(
                //     mainAxisSize: MainAxisSize.min,
                //     children: <Widget>[
                //       new Image.asset(
                //         'assets/images/browsericon.jpg',
                //         height: 40.0,
                //         width: 40.0,
                //       ),
                //       Padding(
                //           padding: EdgeInsets.only(left: 10.0),
                //           child: new Text(
                //             "Visit Website",
                //             style: TextStyle(
                //                 fontSize: 15.0, fontWeight: FontWeight.bold),
                //           ))
                //     ],
                //   ),
                //),

                SizedBox(
                  height: 10.0,
                ),
                TextButton(
                  onPressed: () => setState(() {
                    launch(_emailLaunchUri.toString());
                  }),
                  //
                  child: new Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Image.asset(
                        'assets/images/emailicon.png',
                        height: 40.0,
                        width: 40.0,
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: new Text(
                            "Email:helpsajilo@gmail.com",
                            style:
                                TextStyle(fontSize: 16.0, fontFamily: 'Rubik'),
                          ))
                    ],
                  ),
                ),
                FutureBuilder<void>(future: _launched, builder: _launchStatus),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>UserProfile1()));
            },child: Text('Profile'),)
          ],
        ),
      ),
    );
  }
}
