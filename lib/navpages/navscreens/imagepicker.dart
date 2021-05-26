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
       margin: EdgeInsets.only(left:70),
       child:Column(
         //mainAxisAlignment: MainAxisAlignment.start,
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
                          :Image.network("https://images.unsplash.com/photo-1502164980785-f8aa41d53611?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                          fit: BoxFit.fill,),
               ) ),
         ),
         SizedBox(height:15),
         IconButton(icon: Icon(LineAwesomeIcons.camera), onPressed: () {
           getImage();
         }
          ),

          SizedBox(height:50),
            ElevatedButton(
                    onPressed: () {
                   uploadImageToFirebase();
                   
                    },

                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
         
       ],)
     )),
      
    );
  }

}
 
  







  

