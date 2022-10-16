import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loginsignuppage/Screens/Sign%20up/sign_up.dart';
import 'package:loginsignuppage/Screens/Welcome/components/background.dart';
import 'package:loginsignuppage/constants.dart';
import 'package:loginsignuppage/Components/Rounded_button.dart';
import 'package:loginsignuppage/Screens/login/login_screen.dart';
import 'package:loginsignuppage/Screens/login/components/body.dart';
import 'package:loginsignuppage/Screens/Mainpage/main_page.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Widget push=Icon(Icons.abc);
    // if(f()){
    //   push=Mainpage();
    // }
    Size size = MediaQuery.of(context).size;
    //total height and width of screen
    return Background(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "HandOut",
            style: TextStyle(fontWeight: FontWeight.bold),
            textScaleFactor: 1.4,

          ),
          SizedBox(height: size.height * 0.05),
          Image.asset(
            'assets/images/5836.jpg',
            height: size.height * 0.47,
          ),
          SizedBox(height: size.height * 0.05),
          Padding(padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Material(
            elevation: 10.0,
            color: Color(0xffdcd0ff),
            borderRadius: BorderRadius.circular(30.0),
            child: MaterialButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()),
                );
              },
              minWidth: 300,
              height: 60.0,
              child: const Text('LOG IN'),
            ),
          ),
          ),

          Padding(padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Material(
              elevation: 10.0,
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
              child: MaterialButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignupScreen()),
                  );
                },
                minWidth: 300,
                height: 60.0,
                // child: MaterialButton(
                //   onPressed: () async {
                //
                //     //
                //   },
                // ),
                child: const Text('SIGN UP'),
              ),
            ),
          ),

        ],
      ),
    ));
  }
}
