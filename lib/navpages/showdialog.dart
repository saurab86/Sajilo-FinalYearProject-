import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:sajilo/bookingpages/house_painting.dart';

// ignore: must_be_immutable
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
        title: Text("",style: TextStyle(fontSize: 20,fontFamily: 'Newsreder'),),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              
             Text(
                    "Choose Service Type",
                    style: TextStyle(fontFamily: 'Newsreader', fontSize: 18.0),
                  ),
                   SizedBox(height:10),
                  //Location Button
                  RadioButtonGroup(
                    labels: <String>[
                    "House Painting",
                    "Room Painting",
                  ],
                  onSelected: (String selected)=>print(selected),),
                  SizedBox(
                    height: 15.0,
                  ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
              Navigator.of(context).push(HousepantingAnimationPage());}, child: Text('Next'))
          ],
        ),
      ])),
    );
  }
}
