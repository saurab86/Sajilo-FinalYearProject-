import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class CustomWardTextField extends StatelessWidget {
  CustomWardTextField({this.keyboardType, this.hintText, this.onChanged});
  final TextInputType keyboardType;
  final String hintText;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    TextEditingController wardController;
    ScreenScaler scaler = ScreenScaler()..init(context);

    return Material(
      elevation: 8,
      shape: const StadiumBorder(),
      shadowColor: Color(0xFFFB6158).withOpacity(0.2),
      child: TextFormField(
        controller: wardController,
        keyboardType: keyboardType,
        style: TextStyle(fontSize: scaler.getTextSize(12),fontFamily: 'SFProTet'),
        decoration:
            InputDecoration(hintText: hintText, icon: Icon(LineAwesomeIcons.location_arrow),)
            ,
        onChanged: onChanged,
      ),
    );
  }
}
