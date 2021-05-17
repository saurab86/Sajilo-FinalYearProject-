import 'package:flutter/material.dart';
import 'package:sajilo/navpages/search.dart';

class ShowD extends StatefulWidget {
  @override
  _ShowDState createState() => _ShowDState();
}

class _ShowDState extends State<ShowD> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle:  true,
        title: Text("Allow Location",style: TextStyle(fontSize: 20,fontFamily: 'Newsreder'),),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

             Text(
                    "Give your location access",
                    style: TextStyle(fontFamily: 'Newsreader', fontSize: 18.0),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=>Search()));
            }, child: Text('Back')),
            SizedBox(
              width: 100,
            ),
            ElevatedButton(onPressed: () {}, child: Text('Next'))
          ],
        ),
      ])),
    );
  }
}
