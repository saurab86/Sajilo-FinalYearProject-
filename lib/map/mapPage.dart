import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart' as geoCo;
import 'package:google_maps_flutter/google_maps_flutter.dart';

bool test = false;

class MapScreen extends StatefulWidget {
  static const String idscreen = "mapScreen";
  @override
  _MapScreen createState() => _MapScreen();
}

class _MapScreen extends State<MapScreen> {
  GoogleMapController newGoogleMapController;
  Map<MarkerId, Marker> allmarkers = {};
  Position position;
  String addressLocation;
  String locality;
  String sublocality;

  //adding markers
  void getMarkers(double lat, double lng) {
    MarkerId markerId = MarkerId(lat.toString() + lng.toString());
    Marker _marker = Marker(
        markerId: markerId,
        position: LatLng(lat, lng),
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(snippet: 'addressLocation'));
    setState(() {
      test = true;
      if (markerId != null) {
        allmarkers.clear();
      }
      allmarkers[markerId] = _marker;
    });
  }

  double bottomPaddingOfMap = 0;
  //user current location
  void userCurrentlocation() async {
    Position currentPosition = await GeolocatorPlatform.instance
        .getCurrentPosition(
            desiredAccuracy: LocationAccuracy.bestForNavigation);
    // LatLng pos = LatLng(currentPosition.latitude, currentPosition.longitude);

    //adding marker to currrent position
    //
    getMarkers(currentPosition.latitude, currentPosition.longitude);

    final coordinated = new geoCo.Coordinates(
        currentPosition.latitude, currentPosition.longitude);

    var addressLocation =
        await geoCo.Geocoder.local.findAddressesFromCoordinates(coordinated);

    var firstAddress = addressLocation.first;

    //getMarkers(currentPosition .latitude, curr.longitude);

    await FirebaseFirestore.instance.collection("users Current Location").add({
      'latitide': currentPosition.latitude,
      'longitude': currentPosition.longitude,
      'Address': firstAddress.addressLine,
      'locality': firstAddress.subAdminArea,
      'subLocality': firstAddress.subLocality,
      'subAdminArea': firstAddress.subAdminArea,
    });
    setState(() {
      test = true;
      //addressLocation = firstAddress.addressLine;
      locality = firstAddress.addressLine;
      //addressLocation = firstAddress.addressLine;
      sublocality = firstAddress.addressLine;
    });

    setState(() {
      position = currentPosition;
    });
  }

  @override
  void initState() {
    super.initState();
    userCurrentlocation();
  }
 @override
  void dispose() {
    super.dispose();
        userCurrentlocation();
  }
  void locationIntoDatabase() async {}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [ 
          GoogleMap(
            //passing location to the database
            onTap: (position) async {
              //chnage latlang

              final coordinated =
                  new geoCo.Coordinates(position.latitude, position.longitude);

              var addressLocation = await geoCo.Geocoder.local
                  .findAddressesFromCoordinates(coordinated);

              var firstAddress = addressLocation.first;

              getMarkers(position.latitude, position.longitude);
           
                await FirebaseFirestore.instance
                    .collection("users Current Location")
                    .add({
                  'latitide': position.latitude,
                  'longitude': position.longitude,
                  'Address': firstAddress.addressLine,
                  'locality': firstAddress.subAdminArea,
                  'subLocality': firstAddress.subLocality,
                  'subAdminArea': firstAddress.subAdminArea,
                });
                setState(() {
                  //addressLocation = firstAddress.addressLine;
                  locality = firstAddress.addressLine;
                  //addressLocation = firstAddress.addressLine;
                  sublocality = firstAddress.addressLine;
                });
              
                print("error");
             
            },
            padding: EdgeInsets.only(bottom: bottomPaddingOfMap),
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              setState(() {
                newGoogleMapController = controller;
              });
            },
            initialCameraPosition: CameraPosition(
                target: LatLng(position.latitude.toDouble(),
                    position.longitude.toDouble()),
                zoom: 15.0),

            markers: Set.from(allmarkers.values),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Container(
              height: 230.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(18.0))),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.0),
                    Text(
                      "Set Your Location",
                      style:
                          TextStyle(fontSize: 20.0, fontFamily: "Rubik-Bold"),
                    ),
                    SizedBox(
                      height: 20.0,
                      width: 50.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        children: [
                          SizedBox(height: 50.0),
                          Text(
                            "$locality",
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    ElevatedButton(
                      child: Text(
                        'Confrm your location',
                        style:
                            TextStyle(fontFamily: 'Rubik', color: Colors.white),
                      ),
                      onPressed: () {},
                    )
                    // Row(
                    //   children: [
                    //     Icon(
                    //       Icons.home,
                    //       color: Colors.grey,
                    //     ),
                    //     SizedBox(
                    //       width: 16.0,
                    //     ),
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text('$locality'),
                    //         SizedBox(
                    //           height: 4.0,
                    //         ),
                    //         Text(
                    //           "This is your home Address.",
                    //           style: TextStyle(fontSize: 12.0),
                    //         )
                    //       ],
                    //     )
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

 
}
