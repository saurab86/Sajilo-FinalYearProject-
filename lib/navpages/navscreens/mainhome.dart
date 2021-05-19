import 'package:flutter/material.dart';
import 'package:sajilo/map/mapPage.dart';

var services = [
  "Electricty Reparing",
  "Plumbing Service",
  "Laptop Reparing and Servicing",
  "Ac Reparing and Maintenence",
  "Car Reparing and Servicing",
  "House Painting",
  "Tv Reparing",
  "Bike Reparing and Servicing",
  "Haircut Service",
  "Furniture ",
 // "test"
];
var img = [
  "assets/serviceimage/electricity.png",
  "assets/serviceimage/plumbing.png",
  "assets/serviceimage/laptopreparing.png",
  "assets/serviceimage/ac.png",
  "assets/serviceimage/car.png",
  "assets/serviceimage/paintingIcon.png",
  "assets/serviceimage/tv.png",
  "assets/serviceimage/bike.png",
  "assets/serviceimage/haircut.png",
  "assets/serviceimage/furniture.png",
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
                       String servicename ="Electricty Reparing";
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>Maps(routekey: servicename)));
                 //   Navigator.of(context).push(HousepantingAnimationPage());
                  } else if (index == 1) {
                     String servicename ="Plumbing Service";
                   Navigator.push(context, MaterialPageRoute(builder: (_)=>Maps(routekey: servicename)));
                  } else if (index == 2) {
                     String servicename ="Laptop Reparing and Servicing";
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>Maps(routekey: servicename)));
                  } else if (index == 3) {
                     String servicename ="Ac Reparing and Maintenence";
                   Navigator.push(context, MaterialPageRoute(builder: (_)=>Maps(routekey: servicename)));
                  } else if (index == 4) {
                     String servicename ="Car Reparing and Servicing";
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>Maps(routekey: servicename)));
                  } else if (index == 5) {
                     String servicename ="House Painting";
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>Maps(routekey: servicename)));
                  } else if (index == 6) {
                     String servicename ="Tv Reparing";
                   Navigator.push(context, MaterialPageRoute(builder: (_)=>Maps(routekey: servicename)));
                  } else if (index == 7) {
                     String servicename ="Bike Reparing and Servicing";
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>Maps(routekey: servicename)));
                  } else if (index == 8) {
                     String servicename ="Haircut Service";
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>Maps(routekey: servicename)));


                  } else if (index == 9){
                     String servicename ="Furniture";
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>Maps(routekey: servicename)));
                  }
                  // else if (index ==10){
                  //    String servicename ="House Painting";
                  //  Navigator.push(context, MaterialPageRoute(builder: (_)=>Maps(routekey: servicename)));

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
