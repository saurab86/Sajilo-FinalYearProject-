import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sajilo/widgets/customconstant.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: kSpacingUnit.w * 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: kSpacingUnit.w * 3,
              ),
              Icon(
                LineAwesomeIcons.arrow_left,
                size: ScreenUtil().setSp(kSpacingUnit.w * 3),
              ),
              Expanded(
                child: Column(children: [
                  Container(
                    height: kSpacingUnit.w * 10,
                    width: kSpacingUnit.w * 10,
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: kSpacingUnit.w * 7,
                          backgroundImage:
                              AssetImage('assets/images/IMG_57451.jpg'),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: kSpacingUnit.w * 2.5,
                            width: kSpacingUnit.w * 2.5,
                            decoration: BoxDecoration(
                              color: Colors.tealAccent,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              heightFactor: kSpacingUnit.w * 1.5,
                              widthFactor: kSpacingUnit.w * 1.5,
                              child: Icon(LineAwesomeIcons.pen,
                                  color: kDarkPrimaryColor,
                                  size:
                                      ScreenUtil().setSp(kSpacingUnit.w * 1.5)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: kSpacingUnit.w * 3,
                  ),
                  Text("Kiran Aryal", style: kTitleTextStyle)
                ]),
              ),
              Icon(LineAwesomeIcons.sun,
                  size: ScreenUtil().setSp(kSpacingUnit.w * 3)),
              SizedBox(
                width: kSpacingUnit.w * 3,
              )
            ],
          )
        ],
      ),
    );
  }
}
