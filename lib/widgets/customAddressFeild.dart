import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class CustomAddressTextField extends StatelessWidget {
  CustomAddressTextField({this.keyboardType, this.hintText, this.onChanged});
  final TextInputType keyboardType;
  final String hintText;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    TextEditingController addressController;
    ScreenScaler scaler = ScreenScaler()..init(context);

    return Material(
      elevation: 8,
      shape: const StadiumBorder(),
      shadowColor: Color(0xFFFB6158).withOpacity(0.2),
      child: TextFormField(
        controller: addressController,
        keyboardType: keyboardType,
        style: TextStyle(fontSize: scaler.getTextSize(12),fontFamily:'SFProText'),
        decoration:
            InputDecoration(hintText: hintText, icon: Icon(LineAwesomeIcons.address_card_1)),
        onChanged: onChanged,
      ),
    );
  }
}
