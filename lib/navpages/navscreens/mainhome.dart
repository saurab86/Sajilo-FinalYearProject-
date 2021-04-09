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
  "test"
];
var img = [
  "assets/serviceimage/painting.png",
  "assets/serviceimage/laptop.png",
  "assets/serviceimage/electricity.png",
  "assets/serviceimage/car.png",
  "assets/serviceimage/tv.png",
  "assets/serviceimage/ac.png",
  "assets/serviceimage/bike.png",
  "assets/serviceimage/haircut.png",
  "assets/serviceimage/furniture.png",
  "assets/serviceimage/plumbing.png",
  "assets/serviceimage/plumbing.png",
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
  "TestClass()"
];

class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 11,
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HousePaintingBooking()));
                } else if (index == 1) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LaptopRepBooking()));
                } else if (index == 2) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ElectricityBooking()));
                } else if (index == 3) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CarBooking()));
                } else if (index == 4) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TvRepairService()));
                } else if (index == 5) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AcRepairService()));
                } else if (index == 6) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BikeReparingService()));
                } else if (index == 7) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HaircutBooking()));
                } else if (index == 8) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FurnitureBooking()));




                } else if (index == 9){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PlumbingService()));
                }
                else if (index ==10){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>TestClass()));

                }
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
        });
  }
}
