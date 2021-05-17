import 'package:flutter/material.dart';
import 'package:sajilo/navpages/showdialog.dart';
class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
         // padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            SizedBox(height: 15,),
            Text("This is dummy page",style: TextStyle(color: Colors.grey,fontSize: 18),),
            SizedBox(height:10),
               Text(
                'Book Now',
                style: TextStyle(
                  fontFamily: 'Newsreader',
                  fontSize: 28.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            
            SizedBox(height: 12.0),

            Divider(
              height: 1,
              color: Colors.grey,
            ),
            SizedBox(
              height: 12,
            ),

            SizedBox(height: 12.0),

            ///////////Icons Row
            Row(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ////1st item
                  Container(
                    padding: EdgeInsets.only(left: 4),
                    child: Column(
                      children: [
                        IconButton(
            icon:
                Image.network("https://firebasestorage.googleapis.com/v0/b/sajilo-3cf2f.appspot.com/o/paintingIcon.png?alt=media&token=cdfcf9c5-3a6a-4b37-9a35-09782a827ba4"),
            onPressed: () { 
             
         showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0)),
              backgroundColor: Colors.indigo[50],
              title: new Text(
                "Book Service",
                style:
                    TextStyle(fontFamily: 'Rubik', backgroundColor: Colors.red),
                textAlign: TextAlign.center,
              ),
              content: Builder(builder: (context){
                var height = MediaQuery.of(context).size.height;
           var width = MediaQuery.of(context).size.width;
        return Container(
          height: height - 400,
          width: width-10,
         child: SingleChildScrollView(
           child: Column(
           children: [ 
             
              TextFormField(
                   // controller: _nameController,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_circle),
                      hintText: 'Example:Jon Legend',
                      labelText: 'Full Name',
                      labelStyle: TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                        
                      border: OutlineInputBorder(borderSide: BorderSide()),
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),

                  //Address
                  TextFormField(
                   // controller: _addressController,
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.add_location),
                      hintText: 'Example: Bhairahawa,Rupandehi',
                      labelText: 'Enter Address',
                      labelStyle: TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightGreen)),
                      border: OutlineInputBorder(borderSide: BorderSide()),
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),

                  //Ward No.
                  TextFormField(
                   // controller: _wardController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.blur_linear),
                      hintText: 'Example: Ward-10',
                      labelText: 'Enter Ward Number',
                      labelStyle: TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightGreen)),
                      border: OutlineInputBorder(borderSide: BorderSide()),
                    ),
                  ),

                  SizedBox(
                    height: 12.0,
                  ),
//

                  TextFormField(
                  //  controller: _mobilenumberController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                     prefixIcon:Icon(Icons.phone) ,
                      hintText: 'Example: 98********',
                      labelText: 'Enter Mobile Number',
                      labelStyle: TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightGreen)),
                      border: OutlineInputBorder(borderSide: BorderSide()),
                    ),
                  ),

                  SizedBox(height: 12.0),

                  Text(
                    "Give your location access",
                    style: TextStyle(fontFamily: 'Rubik', fontSize: 16.0),
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

                      ]),
           
         ),

        );
              }),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (_)=>ShowD()));
  
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(fontSize: 16.0),
                    ))
              ],
            ));

            },
            iconSize: 60,
                        ),
                        SizedBox(
            height: 2,
                        ),
                        Text("House Painting",
              style: TextStyle(fontFamily: 'Newsreader'))
                      ],
                    ),
                  ),
                  SizedBox(width: 10),

                  /////////2nd Item
                  Container(
                     decoration: BoxDecoration(
                    
                     // color:Color(0xFFE7EBEE),
                    ),
                    padding: EdgeInsets.only(left: 4),
                    child: Column(
                      children: [
                        IconButton(
            icon: Image.network("https://firebasestorage.googleapis.com/v0/b/sajilo-3cf2f.appspot.com/o/laptopreparing.png?alt=media&token=b57ce7aa-34c6-43a3-8ae4-4fceeb1deaf1"),
            onPressed: () {},
            iconSize: 60,
                        ),
                        SizedBox(height: 2),
                        Text(
            "Laptop Reparing",
            style: TextStyle(fontFamily: 'Newsreader'),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 10),

                  ////////3rd Item
                  Container(
                    padding: EdgeInsets.only(left: 4),
                    child: Column(
                      children: [
                        IconButton(
            icon:
                Image.network("https://firebasestorage.googleapis.com/v0/b/sajilo-3cf2f.appspot.com/o/electricity.png?alt=media&token=a2469005-8cc7-456b-92e9-9d0827593f4a"),
            onPressed: () {},
            iconSize: 60,
                        ),
                        SizedBox(height: 2),
                        Text("Electricity Reparing",
              style: TextStyle(fontFamily: 'Newsreader'))
                      ],
                    ),
                  ),
                  
                ],
              ),SizedBox(height:15),


/////////////////////////////
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ////4th item
                Container(
                  padding: EdgeInsets.only(left: 4),
                  child: Column(
                    children: [
                      IconButton(
                        icon:
                            Image.network("https://firebasestorage.googleapis.com/v0/b/sajilo-3cf2f.appspot.com/o/plumbing.png?alt=media&token=3c9391cd-4576-4a2f-8cfb-449b411bc7bf"),
                        onPressed: () {},
                        iconSize: 60,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text("Plumbing Service",
                          style: TextStyle(fontFamily: 'Newsreader'))
                    ],
                  ),
                ),
                SizedBox(width: 10),

                /////////5th Item
                Container(
                  padding: EdgeInsets.only(left: 4),
                  child: Column(
                    children: [
                      IconButton(
                        icon:Image.network("https://firebasestorage.googleapis.com/v0/b/sajilo-3cf2f.appspot.com/o/ac.png?alt=media&token=c75483d0-b12d-41e2-afb2-58ca68522e92"),
                        onPressed: () {},
                        iconSize: 60,
                      ),
                      SizedBox(height: 2),
                      Text(
                        "Air Contioning",
                        style: TextStyle(fontFamily: 'Newsreader'),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 20),

                ////////6th Item
                Container(
                  padding: EdgeInsets.only(left: 4),
                  child: Column(
                    children: [
                      IconButton(
                        icon:
                            Image.network("https://firebasestorage.googleapis.com/v0/b/sajilo-3cf2f.appspot.com/o/carpentry.png?alt=media&token=cd8a8678-5220-4d47-9ed5-3609dcad4af0"),
                        onPressed: () {},
                        iconSize: 60,
                      ),
                      SizedBox(height: 2),
                      Text("Carpentry",
                          style: TextStyle(fontFamily: 'Newsreader'))
                    ],
                  ),
                ),
                
              ],
            ),
             SizedBox(height: 35.0),

            Text("Our Services",
            style: TextStyle(
                  fontFamily: 'Newsreader',
                  fontSize: 28.0,
                  fontWeight: FontWeight.w400,
                ),),
                Divider(
                  height:1,
                  color: Colors.grey,
                ),
                SizedBox(height:25),
          
          ]
            //DestinationCarousel(),
            
            // HotelCarousel(),

          
        ),
       
      ),
      
    );
  }
 
}
