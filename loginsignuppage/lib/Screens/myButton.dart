import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

final double h = 30;
final double w = 140;
final double marginH = 8;
final double marginV = 5;
final double padding = 5;

class myButton extends StatelessWidget {
  myButton({
    required this.col,
    required this.txt,
  });
  // Function fun;
  Color col;
  String txt;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: marginH, vertical: marginV),
      padding: EdgeInsets.all(padding),
      height: h,
      width: w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: shadow,
        color: col,
      ),
      child: Center(
        child: Text(
          txt,
          style: GoogleFonts.ubuntu(
              fontWeight: FontWeight.w700, textStyle: TextStyle(color: white)),
        ),
      ),
    );
  }
}