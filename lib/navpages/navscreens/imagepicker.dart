import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:path/path.dart';
import 'dart:io';

import 'package:line_awesome_flutter/line_awesome_flutter.dart';
//import 'package:firebase_storage/firebase_storage.dart';

class ImagePicker extends StatefulWidget {
  @override
  _ImagePickerState createState() => _ImagePickerState();

  static pickImage({ImageSource source}) {}
  
  
      }
      
      class _ImagePickerState extends State<ImagePicker> {
        File _image;
      
        Future getImage() async{
          var image = await ImagePicker.pickImage(source:ImageSource.gallery);
    setState(() {
      _image = image;
      //print("Path $_image");
    });
  }
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
                          child:(_image!=null)?Image.file(_image,fit: BoxFit.fill,)
                          :Image.network("https://images.unsplash.com/photo-1502164980785-f8aa41d53611?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                          fit: BoxFit.fill,),
               ) ),
         ),

         SizedBox(height:15),
         IconButton(icon: Icon(LineAwesomeIcons.camera), onPressed: () {
           getImage();
         }
          ),

         
       ],)
     )),
      
    );
  }
}