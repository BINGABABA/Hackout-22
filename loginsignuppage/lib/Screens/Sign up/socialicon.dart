import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loginsignuppage/constants.dart';
class socialicon extends StatelessWidget {
  final String iconSrc;
  final Function press;
  const socialicon({
    Key? key,
    required this.iconSrc,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
onTap: (){
  //
},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(border: Border.all(
          width: 1,
          color: kPrimaryLightColor,
        ),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(iconSrc,
          height: 10,
          width: 10,),
      ),
    );
  }
}
