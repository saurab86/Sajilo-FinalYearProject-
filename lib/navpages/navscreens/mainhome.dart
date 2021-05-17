import 'package:flutter/material.dart';
import 'package:sajilo/bookingpages/ac_repairing.dart';
import 'package:sajilo/bookingpages/bike_reparing.dart';
import 'package:sajilo/bookingpages/car_servicing.dart';
import 'package:sajilo/bookingpages/electricity_servicing.dart';
import 'package:sajilo/bookingpages/furniture.dart';
import 'package:sajilo/bookingpages/haircut.dart';
import 'package:sajilo/bookingpages/house_painting.dart';
import 'package:sajilo/bookingpages/laptop_repair.dart';
import 'package:sajilo/bookingpages/plumbing_service.dart';
// ignore: unused_import
import 'package:sajilo/bookingpages/testtab.dart';
import 'package:sajilo/bookingpages/tv_repair.dart';

var services = [
  "House Painting",
  "Laptop Reparing and Servicing",
  "Electricty Reparing",
  "Car Reparing and Servicing",
  "Tv Reparing",
  "Ac Reparing and Maintenence",
  "Bike Reparing and Servicing",
  "Haircut Service",
  "Furniture ",
  "Plumbing Service",
 // "test"
];
var img = [
  "assets/serviceimage/paintingIcon.png",
  "assets/serviceimage/laptop.png",
  "assets/serviceimage/electricity.png",
  "assets/serviceimage/car.png",
  "assets/serviceimage/tv.png",
  "assets/serviceimage/ac.png",
  "assets/serviceimage/bike.png",
  "assets/serviceimage/haircut.png",
  "assets/serviceimage/furniture.png",
  "assets/serviceimage/plumbing.png",
 // "assets/serviceimage/plumbing.png",
];

var bookingsroutes = [
  "HousePaintingBooking()",
  "LaptopBooking()",
  "ElectricityBooking()",
  "CarBooking()",
  "TvBooking()",
  "AcBooking()",
  "BikeBooking()",
  "HairCutBooking()",
  "FurnitureBooking()",
  "HaircutBooking()",
 // "TestClass()"
];

class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
          body: GridView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 10,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              semanticContainer: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              elevation: 5,
              margin: EdgeInsets.all(10),
              child: InkWell(
                splashColor: Colors.green.withAlpha(30),
                onTap: () {
                  if (index == 0) {
                    Navigator.of(context).push(HousepantingAnimationPage());
                  } else if (index == 1) {
                   Navigator.of(context).push(LaptopServiceAnimationPage());
                  } else if (index == 2) {
                    Navigator.of(context).push(ElectricityAnimationPage());
                  } else if (index == 3) {
                    Navigator.of(context).push(CarServiceAnimationPage());
                  } else if (index == 4) {
                    Navigator.of(context).push(TvServiceAnimationPage());
                  } else if (index == 5) {
                    Navigator.of(context).push(ACreparingAnimationPage());
                  } else if (index == 6) {
                    Navigator.of(context).push(BikeserviceAnimationPage());
                  } else if (index == 7) {
                    Navigator.of(context).push(HairCutAnimationPage());
                  } else if (index == 8) {
                    Navigator.of(context).push(FurnitureServiceAnimationPage());




                  } else if (index == 9){
                    Navigator.of(context).push(PlumbingAnimationPage());
                  }
                  // else if (index ==10){
                  //   Navigator.push(context, MaterialPageRoute(builder: (context)=>TestClass()));

                  // }
                },
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Image.asset(
                        img[index],
                        height: 95,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Container(
                      child: Text(
                        services[index],
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    //SizedBox(height: 12.0),
                  ],
                ),
              ),
            );
          }),

    );
  }
}
