import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sajilo/navpages/navscreens/imagepicker.dart';
import 'package:sajilo/navpages/upadteprofile.dart';
import 'package:sajilo/screens/userinfo/components/logout_button.dart';
import 'package:sajilo/services/auth.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
//import 'package:shimmer/shimmer.dart';

class UserProfile1 extends StatefulWidget {
  @override
  _UserProfile1State createState() => _UserProfile1State();
}

class _UserProfile1State extends State<UserProfile1> {
  

  Query ref;
  DatabaseReference reference =
      FirebaseDatabase.instance.reference().child('UserProfile');
  void initState() {
    super.initState();

    reference = FirebaseDatabase.instance.reference().child("UserProfile");
    ref = FirebaseDatabase.instance
        .reference()
        .child("UserProfile")
        .orderByChild("UserID")
        .equalTo(FirebaseAuth.instance.currentUser.uid);
  }
  
  Widget _buildUserProfile({Map userprofile}) {
    AuthService data = Provider.of<AuthService>(context);
    ScreenScaler scale = ScreenScaler();
       return SafeArea(
        child: Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 32.0,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            CircleAvatar(
              radius: 55.0,

               child: ClipOval(
                        child: new SizedBox(
                          width: 180.0,
                          height: 180.0,
                          child:(userprofile['profilepic']!=null)?Image.network(userprofile['profilepic']):
                          Image.asset("assets/images/user.png")

//                           Image.network("https://firebasestorage.googleapis.com/v0/b/sajilo-3cf2f.appspot.com/o/images%2Fstorage%2Femulated%2F0%2FDCIM%2Fwp2560566.jpg?alt=media&token=ff29c558-0e5a-4935-9bb3-0f5e5cd013ff"
// ,fit: BoxFit.fitHeight,)
                          // Image.network(userprofile['profilepic'],
                          // fit: BoxFit.fill,),
               ) ),
             
            ),
            
          ]),
          IconButton(icon: Icon(LineAwesomeIcons.retro_camera), onPressed: () {
           final act = CupertinoActionSheet(
             title: Text("Update Picture",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Newsreader',fontSize: 20)),
             message: Text("Do you want to update profile picture?",style: TextStyle(fontFamily: 'Newsreader',fontSize: 18),),
             actions: [
               CupertinoActionSheetAction(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>UpdatePic(profileKey: userprofile['key'],)));
               }, 
               child: Text("Change Picture"))
             ],
             cancelButton: CupertinoActionSheetAction(onPressed: (){Navigator.pop(context);},child: Text("Cancel"),),
           );
            showCupertinoModalPopup(context: context, builder: (BuildContext context)=> act);
       
          }),
          SizedBox(
            height: 14.0,
          ),
          Text(
            userprofile['Name'],
            style: TextStyle(
                fontFamily: 'SFProText',
                fontSize: 27,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(LineAwesomeIcons.at),
            SizedBox(
              width: 3,
            ),
            Text(data.userInfo,
                style: TextStyle(
                    fontFamily: 'SFProText',
                    fontSize: 16,
                    fontWeight: FontWeight.w500)),
          ]),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(LineAwesomeIcons.address_card),
              SizedBox(
                width: 3,
              ),
              Text(
                'Address:',
                style: TextStyle(fontFamily: 'SFProText', fontSize: 19),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                userprofile['Address'],
                style: TextStyle(fontFamily: 'SFProText', fontSize: 19),
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Ward Number:",
                  style: TextStyle(fontFamily: 'SFProText', fontSize: 19)),
              SizedBox(
                width: 5,
              ),
              Text(
                userprofile['Ward'],
                style: TextStyle(fontFamily: 'SFProText', fontSize: 19.0),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(LineAwesomeIcons.mobile_phone),
              SizedBox(
                width: 3,
              ),
              Text("Mobile Number:",
                  style: TextStyle(fontFamily: 'SFProText', fontSize: 19)),
              SizedBox(
                width: 5,
              ),
              Text(
                userprofile['MobileNumber'],
                style: TextStyle(fontFamily: 'SFProText', fontSize: 19.0),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => UpdateProfile(profileKey: userprofile['key'],)));
            },
            child: Text(
              'Update Profile',
              style: TextStyle(fontFamily: 'SFProText', fontSize: 18),
            ),
          ),
          SizedBox(height: 12),
        
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              LineAwesomeIcons.alternate_sign_out,
              size: 20,
            ),
            SizedBox(
              width: 4,
            ),
            
             LogoutButton(data: data, scale: scale),
                
          ]),
          // SizedBox(height: 10),
          // ElevatedButton(onPressed: (){
          //   Navigator.push(context,
          //    PageRouteBuilder(transitionDuration: Duration(seconds: 2),
          //    transitionsBuilder: (BuildContext context,
          //   Animation<double>animation,Animation<double> secAnimation,Widget child){animation =
          //    CurvedAnimation(parent: animation,curve: Curves.elasticInOut);
          //   return ScaleTransition(scale: animation,alignment: Alignment.center,child:child);},pageBuilder: (BuildContext context, Animation<double>animation,
          //   Animation<double> secAnimation){return TestClass();}));
          // }, child: Text('Test')),
        ],
      ),
    )); 
    
  }

  @override
  Widget build(BuildContext context) {


    // AuthService data = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: null,
      body: Container(
        child: FirebaseAnimatedList(
          query: ref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map userprofile = snapshot.value;
            userprofile['key']=snapshot.key;
            return _buildUserProfile(userprofile: userprofile);
          },
        )
      ),
    );
  }
}