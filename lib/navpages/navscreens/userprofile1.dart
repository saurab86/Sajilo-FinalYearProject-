
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sajilo/services/auth.dart';


class UserProfile1 extends StatefulWidget {
  @override
  _UserProfile1State createState() => _UserProfile1State();
}

class _UserProfile1State extends State<UserProfile1> {
  
  
  @override
  Widget build(BuildContext context) {
     AuthService data = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: null,
      body: Container(
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
                backgroundImage: AssetImage('assets/images/IMG_57451.jpg'),
              ),
            //  Align(
            //    alignment: Alignment.bottomRight,
            //     child: Container(child: IconButton(icon: Icon(LineAwesomeIcons.camera), onPressed: (){}),),
            //  )
            ]),
            IconButton(icon: Icon(LineAwesomeIcons.camera), onPressed: (){}),
            SizedBox(
              height: 14.0,
            ),
            Text(
              "Kiran Aryal",
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
              Text(data.userInfo??'Update your Profile',
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
                  'Butwal',
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
                  '10',
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
                  '+9779847275815',
                  style: TextStyle(fontFamily: 'SFProText', fontSize: 19.0),
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Upadte Profile',
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
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Signout',
                  style: TextStyle(fontFamily: 'SFProText', fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(primary: Colors.redAccent),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
