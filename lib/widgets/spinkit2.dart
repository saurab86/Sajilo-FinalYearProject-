import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sajilo/bookingpages/ac_repairing.dart';
import 'package:sajilo/bookingpages/electricity_servicing.dart';
import 'package:sajilo/bookingpages/laptop_repair.dart';
import 'package:sajilo/bookingpages/plumbing_service.dart';
// ignore: unused_import
import 'package:sajilo/map/mapPage.dart';
// import 'package:shared_preferences/shared_preferences.dart';

String finalEmail;

// ignore: must_be_immutable
class Spinkit2 extends StatefulWidget {
  String sourcename,maproutekey;
  double lat,long;
  Spinkit2({this.sourcename,this.maproutekey,this.lat,this.long});
  @override
  _Spinkit2State createState() => _Spinkit2State();
}

class _Spinkit2State extends State<Spinkit2> {
  @override
  void initState() {
    super.initState();
    //getValidationData();
    Future.delayed(Duration(seconds: 2), () {
      /////////////////
      if(widget.maproutekey=="Electricty Reparing"){
        if (widget.sourcename == null || widget.long == null ||widget.lat == null) {
                        Navigator.of(context).pop();
      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>ElectricityBooking(sourcename: widget.sourcename)));
      }}

     //////////
      if(widget.maproutekey=="Plumbing Service"){
        if (widget.sourcename == null || widget.long == null ||widget.lat == null) {
                        Navigator.of(context).pop();
      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>PlumbingService(sourcename: widget.sourcename)));
      }}
      
      ///////
       if(widget.maproutekey=="Laptop Reparing and Servicing"){
        if (widget.sourcename == null || widget.long == null ||widget.lat == null) {
                        Navigator.of(context).pop();
      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>LaptopRepBooking(sourcename: widget.sourcename)));
      }}


      //////////////
      if(widget.maproutekey=="Ac Reparing and Maintenence"){
        if (widget.sourcename == null || widget.long == null ||widget.lat == null) {
                        Navigator.of(context).pop();
      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>AcRepairService(sourcename: widget.sourcename)));
      }}

      
      });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child:
                SpinKitFoldingCube(size: 80.0, color: Colors.orangeAccent[700]),
          ),
          SizedBox(
            height: 18.0,
          ),
          Text(
            "LOADING...",
            style: TextStyle(
                fontFamily: "Rubik", fontSize: 16.0, color: Colors.white),
          )
        ],
      ),
    );
  }
}
