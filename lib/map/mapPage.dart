import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sajilo/Helper/NetworkHelper.dart';
import 'package:sajilo/bookingpages/ac_repairing.dart';
import 'package:sajilo/bookingpages/bike_reparing.dart';
import 'package:sajilo/bookingpages/car_servicing.dart';
import 'package:sajilo/bookingpages/electricity_servicing.dart';
import 'package:sajilo/bookingpages/furniture.dart';
import 'package:sajilo/bookingpages/haircut.dart';
import 'package:sajilo/bookingpages/house_painting.dart';
import 'package:sajilo/bookingpages/laptop_repair.dart';
import 'package:sajilo/bookingpages/plumbing_service.dart';
import 'package:sajilo/bookingpages/tv_repair.dart';
import 'package:sajilo/navpages/navscreens/navhandling.dart';

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


// ignore: must_be_immutable
class Maps extends StatefulWidget {
  String routekey;
  Maps({this.routekey});
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController mapController;
  double mapBottomPadding = 0;
  double searchSheetWidget = (Platform.isIOS) ? 300 : 305;
  DatabaseReference _ref;

  //FocusNode phoneNumberFocus;
  //TextEditingController phoneController;
  //final _formKey = GlobalKey<FormState>();

  final List<LatLng> polyPoints = []; // For holding Co-ordinates as LatLng
  final Set<Polyline> polyLines = {}; // For holding instance of Polyline
  final Set<Marker> markers = {}; // For holding instance of Marker
  var data;

  LatLng sourceLatLng;
  //LatLng destinationLatLng;
   String sourceName = "";
  //String destinationName = "";
  //TimeOfDay selectedTime;

  final RegExp phoneNumberRegExp =
      new RegExp(r"^(984|985|986|974|975|980|981|982|961|988|972|963)\d{7}$");

  Set<Marker> _markers = {};
  Set<Polyline> _polyline = {};

  List<LatLng> polylineLatLng = [];

  bool switchValue = false;

  var geoLocator = Geolocator();
  Position currentPosition;

  @override
  void initState() {
    super.initState();
    //phoneNumberFocus = FocusNode();
    //phoneController = TextEditingController();
    getJsonData();
         sourceName = "";
        _ref = FirebaseDatabase.instance.reference().child('AddressFromMap');

  }

  @override
  void dispose() {
    // phoneNumberFocus.dispose();
    //phoneController.dispose();
    super.dispose();
  }

  void setupPositionLocator() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    currentPosition = position;

    LatLng pos = LatLng(position.latitude, position.longitude);
    CameraPosition cp = new CameraPosition(target: pos, zoom: 17);
    mapController.animateCamera(CameraUpdate.newCameraPosition(cp));
  }

  static final CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(27.69329, 85.32227),
    zoom: 10.0,
  );

  void getJsonData() async {
    // Create an instance of Class NetworkHelper which uses http package
    // for requesting data to the server and receiving response as JSON format

    NetworkHelper network = NetworkHelper(
      startLat: sourceLatLng.latitude,
      startLng: sourceLatLng.longitude,
      // endLat: destinationLatLng.latitude,
      // endLng: destinationLatLng.longitude,
    );

    try {
      // getData() returns a json Decoded data
      data = await network.getData();

      // We can reach to our desired JSON data manually as following
      LineString ls =
          LineString(data['features'][0]['geometry']['coordinates']);

      for (int i = 0; i < ls.lineString.length; i++) {
        polyPoints.add(LatLng(ls.lineString[i][1], ls.lineString[i][0]));
      }

      if (polyPoints.length == ls.lineString.length) {
        setPolyLines();
      }
    } catch (e) {
      print(e);
    }
  }

  setPolyLines() {
    Polyline polyline = Polyline(
      polylineId: PolylineId("polyline"),
      color: Colors.lightBlue,
      points: polyPoints,
    );
    polyLines.add(polyline);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            markers: _markers,
            polylines: _polyline,
            padding: EdgeInsets.only(bottom: mapBottomPadding),
            initialCameraPosition: initialCameraPosition,
            mapType: MapType.normal,
            myLocationEnabled: true,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            onTap: (latLng) async {
              if (sourceLatLng == null) {
                String name = await getPlace(latLng);
                if (sourceLatLng == null) {
                  setState(() {
                    sourceName = name;
                    sourceLatLng = latLng;
                    _markers.add(Marker(
                      markerId: MarkerId(sourceLatLng.toString()),
                      position: sourceLatLng,
                      infoWindow: InfoWindow(
                        snippet: 'This is your current Location',
                      ),
                      icon: BitmapDescriptor.defaultMarker,
                    ));
                  });
                }
              }
            },
            onMapCreated: (GoogleMapController controller) {
              _controllerGoogleMap.complete(controller);
              mapController = controller;

              setState(() {
                mapBottomPadding = (Platform.isAndroid) ? 310.0 : 270.0;
              });

              setupPositionLocator();
            },
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaleFactor: 1.0,
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18.0),
                      topRight: Radius.circular(18.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 10.0,
                      spreadRadius: 0.5,
                      offset: Offset(0.7, 0.7),
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ListView(
                    children: [
                      SizedBox(height: 6.0),
                      Text(
                        "NAMASTE",
                        style: TextStyle(color: Colors.black, fontSize: 12.0),
                      ),
                      // Text(
                      //   "Select Your Location.",
                      //   style: TextStyle(color: Colors.black, fontSize: 16.0),
                      // ),
                      TextButton.icon(
                        onPressed: () {
                          setupPositionLocator();
                        },
                        icon: Icon(Icons.location_on),
                        label: Text('Select Your Location'),
                      ),
                      ListTile(
                          leading: Icon(Icons.location_on, color: Colors.grey),
                          title: Text(
                            'Your Current Location',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          subtitle: Text(
                            sourceLatLng == null
                                ? 'Please select from map'
                                : sourceName,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          trailing: sourceLatLng == null
                              ? SizedBox.shrink()
                              : IconButton(
                                  icon: Icon(
                                    Icons.clear,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    Marker marker = _markers.firstWhere(
                                        (marker) =>
                                            marker.markerId.value ==
                                            sourceLatLng.toString(),
                                        orElse: () => null);
//                                    Polyline polyline = _polyline.firstWhere((marker) => marker.polylineId.value == sourceLatLng.toString(),orElse: () => null);
                                    setState(() {
                                      _markers.remove(marker);
//                                      _polyline.remove(polyline);
                                      polylineLatLng.remove(sourceLatLng);
                                      sourceLatLng = null;
                                      sourceName = "";
                                    });
                                  },
                                )),
                                SizedBox(height:15),
                                ElevatedButton(onPressed: (){
                               // Navigator.push(context, MaterialPageRoute(builder: (_)=>SecondPage(sourcename :sourceName)));
                                  if(widget.routekey=="House Painting"){
                                    Navigator.of(context).push(HousepantingAnimationPage());       
                                  }     
                                  else if(widget.routekey=="Laptop Reparing and Servicing"){
                                    Navigator.of(context).push(LaptopServiceAnimationPage());
                                  }  
                                  else if(widget.routekey=="Electricty Reparing"){
                                    Navigator.of(context).push(ElectricityAnimationPage());
                                  } 
                                   else if(widget.routekey=="Car Reparing and Servicing"){
                                    Navigator.of(context).push(CarServiceAnimationPage());
                                  } 
                                  else if(widget.routekey=="Tv Reparing"){
                                    Navigator.of(context).push(TvServiceAnimationPage());
                                  } 
                                  else if(widget.routekey=="Ac Reparing and Maintenence"){
                                    Navigator.of(context).push(ACreparingAnimationPage());
                                  } 

                                  else if(widget.routekey=="Bike Reparing and Servicing"){
                                    Navigator.of(context).push(BikeserviceAnimationPage());
                                  } 
                                  else if(widget.routekey=="Haircut Service"){
                                    Navigator.of(context).push(HairCutAnimationPage());
                                  }
                                   else if(widget.routekey=="Furniture"){
                                    Navigator.of(context).push(FurnitureServiceAnimationPage());
                                  }
                                   else if(widget.routekey=="Plumbing Service"){
                                    Navigator.of(context).push(PlumbingAnimationPage());
                                  }
                                  



                                  
                                  

                                }, child: Text("test button")),
                          SizedBox(height: 100.0),

                    
                      //  ElevatedButton(
                      //   style:ElevatedButton.styleFrom(primary:Colors.blueGrey),
                      //   //color: Colors.redAccent,
                      //   onPressed: () {
                      //     if (sourceName.isEmpty) {
                      //       showDialog(
                      //           context: context,
                      //           builder: (_) => AlertDialog(
                      //                 shape: RoundedRectangleBorder(
                      //                     borderRadius:
                      //                         BorderRadius.circular(14.0)),
                      //                 backgroundColor: Colors.blueGrey[200],
                      //                 title: new Text(
                      //                   "Error",
                      //                   textAlign: TextAlign.center,
                      //                 ),
                      //                 content: new Text(
                      //                   "Please fill up your Address",
                      //                   textAlign: TextAlign.center,
                      //                   style: TextStyle(fontSize: 16.0),
                      //                 ),
                      //                 actions: <Widget>[
                      //                   TextButton(
                      //                       onPressed: () {
                      //                         Navigator.pop(context);
                      //                       },
                      //                       child: Text(
                      //                         'OK',
                      //                         style: TextStyle(fontSize: 16.0),
                      //                       ))
                      //                 ],
                      //               ));
                      //     } else {
                      //       bookRide();
                      //     }
                      //   },
                      //   child: Text(
                      //     'Next',
                      //     style: TextStyle(
                      //         fontFamily: 'Rubik',
                      //         color: Colors.white,
                      //         fontWeight: FontWeight.bold,
                      //         fontSize: 20.0),
                      //   ),
                      // )
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.blueGrey),
                              child: Text('Back'),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => NavHome()));
                              },
                            ),
                            SizedBox(
                              width: 80,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.blueGrey),
                              child: Text('Next'),
                              onPressed: () {
                                bookRide();
                                setAddress();
                                
                               

                                // Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (_) => NavHome()));
                              },
                            ),


                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<String> getPlace(LatLng latLng) async {
    List<Placemark> newPlace =
        await placemarkFromCoordinates(latLng.latitude, latLng.longitude);

    // this is all you need
    Placemark placeMark = newPlace[0];
    String name = placeMark.name;
    String subLocality = placeMark.subLocality;
    String locality = placeMark.locality;
    String administrativeArea = placeMark.administrativeArea;
    String postalCode = placeMark.postalCode;
    String country = placeMark.country;
    String address =
        "$name, $subLocality, $locality, $administrativeArea $postalCode, $country";

    return address;
  }

  bookRide() async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
      firebaseFireStore.collection('BookingLocation').add({
        'sourceLat': sourceLatLng.latitude.toString(),
        'sourceLng': sourceLatLng.longitude.toString(),
        //'destinationLat': destinationLatLng.latitude.toString(),
        //'destinationLng': destinationLatLng.longitude.toString(),
        'sourceName': sourceName,
        //'destinationName': destinationName,
        // 'time_hour': selectedTime.hour,
        // 'time_minute': selectedTime.minute,
        //'ride': switchValue,
        'user_id': auth.currentUser.uid ?? "",
        'user_name': auth.currentUser.displayName ?? "",
        'user_email': auth.currentUser.email ?? "",
        'profile_img': auth.currentUser.photoURL ?? "",
        // 'phone_number': phoneController.value.text,
      }).then((value) {
        // phoneNumberFocus.unfocus();
        // phoneController.text = "";
        setState(() {
          sourceLatLng = null;
          sourceName = "";
          // destinationLatLng = null;
          // destinationName = "";
          // selectedTime = null;
          switchValue = false;
          markers.clear();
        });
        // CustomNotification(
        //   title: 'Successful',
        //   color: Colors.green,
        //   message:
        //       'Successfully booked you can see bookings in side menu. The rider will contact you.',
        // ).show(context);
      }).catchError((error) {
        print(error.toString());
      });
    } catch (e) {
      print(e.toString());
    }

 
  }


     void setAddress() {

  FirebaseAuth auth = FirebaseAuth.instance;
  String sourceLat = sourceLatLng.latitude.toString();
  String sourceLng = sourceLatLng.longitude.toString();
  Map<String, String> addressfromMap = {
    'Latitude': sourceLat,
    'Longitude':sourceLng,
    'sourceName': sourceName,
    'user_id': auth.currentUser.uid ?? "",
    'user_name': auth.currentUser.displayName ?? "",
    'user_email': auth.currentUser.email ?? "",
    'profile_img': auth.currentUser.photoURL ?? "",
  };
  _ref.push().update(addressfromMap);

}



  String calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    var distance = 12742 * asin(sqrt(a));
    if (distance < 1) {
      return (distance * 1000).toStringAsFixed(1) + " m";
    } else {
      return distance.toStringAsFixed(1) + ' km';
    }
  }
}

//Create a new class to hold the Co-ordinates we've received from the response data

class LineString {
  LineString(this.lineString);
  List<dynamic> lineString;
}


// ignore: must_be_immutable
class SecondPage extends StatefulWidget {
  String sourcename;
  SecondPage({this.sourcename});
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(
        title:  Text("Test widget"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text("This is Test Page",style: TextStyle(fontSize: 20,fontFamily: 'Newsreader'),),
          SizedBox(height: 18,),
          Text(widget.sourcename,
          style: TextStyle(fontSize: 20,fontFamily: 'Newsreader')),
          SizedBox(height: 10,),
          Text( auth.currentUser.email,style: TextStyle(fontFamily: 'Newsreader',fontSize: 18),),
        ],)
      ),
      
    );
  }
}