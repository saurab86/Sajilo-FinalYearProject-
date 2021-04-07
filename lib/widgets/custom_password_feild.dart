import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class CustomTextField1 extends StatefulWidget {
  CustomTextField1({this.keyboardType, this.hintText, this.onChanged});
  final TextInputType keyboardType;
  final String hintText;
  final Function onChanged;

  @override
  _CustomTextField1State createState() => _CustomTextField1State();
}

class _CustomTextField1State extends State<CustomTextField1> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController;
    ScreenScaler scaler = ScreenScaler()..init(context);

    return Material(
      elevation: 8,
      shape: const StadiumBorder(),
      shadowColor: Color(0xFFFB6158).withOpacity(0.2),
      child: TextFormField(
        obscureText: _obscureText,
        controller: passwordController,
        keyboardType: widget.keyboardType,
        style: TextStyle(fontSize: scaler.getTextSize(12),fontFamily: 'SFProText'),
        decoration: InputDecoration(
            hintText: widget.hintText,
            icon: Icon(Icons.vpn_key),
            suffixIcon: IconButton(
                icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                })),
        onChanged: widget.onChanged,
      ),
    );
  }
}
