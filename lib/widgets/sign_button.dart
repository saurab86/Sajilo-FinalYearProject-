import 'package:flutter/material.dart';
import '../constants.dart';

class SignButton extends StatelessWidget {
  final String text;
  final bool isThemePrimary;
  final Function onPressed;
  SignButton({this.text, this.isThemePrimary = true, this.onPressed});
  @override
  Widget build(BuildContext context) {
    // Those conditions is to check if the button has a primary or accent
    // colors (take a lock to the 'New account' button and the 'Login' button)
    Color textColorCondition = isThemePrimary ? accentColor : primaryColor;
    // Color buttonColorCondition = isThemePrimary ? primaryColor : accentColor;
    //Color splashColorCondition =
    // isThemePrimary ? primaryHighLightColor : accentHighLightColor;

    return Material(
      shape: const StadiumBorder(),
      shadowColor: Color(0xFFFC5A52).withOpacity(0.2),
      elevation: 12,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed))
                return Theme.of(context).colorScheme.primary.withOpacity(0.5);
              return null; // Use the component's default.
            },
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: textColorCondition),
        ),
        //color: buttonColorCondition,
        //highlightColor: splashColorCondition,
        //splashColor: splashColorCondition,
      ),
    );
  }
}
