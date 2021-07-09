import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';


class UpdatePic extends StatefulWidget {
  @override
  _UpdatePicState createState() => _UpdatePicState();

  static pickImage({ImageSource source}) {}
  
  
      }
      
      class _UpdatePicState extends State<UpdatePic> {
         DatabaseReference _ref;
         void initState() {
         super.initState();
         _ref = FirebaseDatabase.instance.reference().child('UserProfileImage');
  }
        String imageDownloadUrl;
        File _image;
        Future getImage() async{
        var image = await ImagePicker.pickImage(source:ImageSource.gallery);
        setState(() {
        _image = image;
        print("Path $_image");
         });
          }
    
Future uploadImageToFirebase() async {
  String fileName;
  fileName = _image.path;
//    var snapshot = await _firebaseStorage.ref().child('images/$fileName').putFile(_image);
//         setState(() {
//           imageDownloadUrl = downloadUrl;
//         });
 var storageReference = FirebaseStorage.instance    
       .ref()    
       .child('images/$fileName');    
   var uploadTask = storageReference.putFile(_image);    
   await uploadTask;    
   print('File Uploaded');    
   storageReference.getDownloadURL().then((fileName) {    
     setState(() {    
       imageDownloadUrl = fileName;    
       print(imageDownloadUrl);
     });    
   }); 
   }
 
  // void saveuserinfo(String userID, imageurl){
  //   Map <String,String> userimagepic = {
  //     'UserID':userID,
  //     'userimageurl': imageurl
  //   };
  //    _ref.push().set(userimagepic);

  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text('Upload Picture'),
     ),
     body: Builder(builder: (context)=>
     Container(
   //   margin: EdgeInsets.only(left:70),
       child:Column(
        // mainAxisAlignment: MainAxisAlignment.center,
         children: [

         SizedBox(height: 20,),

         CircleAvatar(
           radius:100,
           backgroundColor: Color(0xff476cfb),
              child: ClipOval(
                        child: new SizedBox(
                          width: 180.0,
                          height: 180.0,
                          child:(_image!=null)?Image.file(_image,fit: BoxFit.scaleDown,)
                          :Image.asset("assets/images/user.png",
                          fit: BoxFit.fill,),
               ) ),
         ),
         SizedBox(height:15),
         IconButton(icon: Icon(LineAwesomeIcons.camera), onPressed: () {
           getImage();
         }
          ),
          
           Row(    
             mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_a_photo),
                      ElevatedButton(onPressed: (){
                     getImage();
                    }, child: Text("Browse photos from your device",
                    style: TextStyle(fontFamily: 'SFProText',fontSize: 16.0),),
                     style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),),),
         ]
           ),
         

          SizedBox(height:45.0),
            ElevatedButton(
                    onPressed: () {
                   uploadImageToFirebase().whenComplete(() => savetoRealTimeDB(imageDownloadUrl));
                   
                    },

                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white, fontSize: 16.0, fontFamily: 'SFProText',),
                    ),
                  ),
         
       ],)
     )),
      
    );
  }

  savetoRealTimeDB(String imageurl) {
     FirebaseAuth auth = FirebaseAuth.instance;
    String imageurl = imageDownloadUrl;
    String userid = auth.currentUser.uid;
    Map<String, String> userprofileimage={
     'profileimageurl': imageurl,
     'userid': userid
    };
    _ref.push().set(userprofileimage);

  }

}
 
  







  

