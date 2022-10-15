import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:loginsignuppage/Screens/Welcome/welcome_Screen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override

  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return AnimatedSplashScreen(

      splash: Image.asset(
          'assets/images/playstore-icon.png'
      )
      ,
      nextScreen: WelcomeScreen(),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Color(0xFFFCFAFD),


    );
  }

}
