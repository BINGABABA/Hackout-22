import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loginsignuppage/Screens/Sign up/background.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginsignuppage/Screens/Mainpage/main_page.dart';
import 'package:loginsignuppage/Screens/Sign%20up/or_divider.dart';
// import 'package:path_provider/provider.dart';
import 'package:loginsignuppage/Screens/Sign%20up/socialicon.dart';

import 'package:loginsignuppage/constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

int flag=0;
int F(){
  return flag;
}

class _BodyState extends State<Body> {
  final _auth=FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(

      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('SIGNUP',style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 16.5
            ),),

            Image.asset('assets/images/43122.png',
              width: size.width*0.88,
              height: size.height*0.3,

            ),
            const SizedBox(
              height: 30.00,
            ),
            SizedBox(
              width: 300,

              child: TextField(

                onChanged: (value){
                  email=value;
                },

                style: const TextStyle(
                  color: Colors.black45,
                ),

                decoration: const InputDecoration(
                  hoverColor: Colors.deepPurple,
                  fillColor: Color(0xffe6e6fa),

                  filled: true,
                  labelText: 'Enter your email',
                  labelStyle: TextStyle(

                  ),


                  contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.all(Radius.circular(15.0)),

                  ),

                ),
              ),
            ),


            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              width: 300,

              child: TextField(
                obscureText: true,

                onChanged: (value){
                  //
                  password=value;
                },

                style: const TextStyle(
                  color: Colors.black45,
                ),

                decoration: const InputDecoration(
                  hoverColor: Colors.deepPurple,
                  fillColor: Color(0xffe6e6fa),

                  filled: true,
                  labelText: 'Enter your Password',
                  labelStyle: TextStyle(

                  ),


                  contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.all(Radius.circular(15.0)),

                  ),

                ),
              ),
            ),

            SizedBox(
              height: 13.0,
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Color(0xffdcd0ff),
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,

                child: MaterialButton(
                  onPressed: () async {
                    try {
                      final newuser = await _auth
                          .createUserWithEmailAndPassword(
                          email: email, password: password);
                      if(newuser!=null){
                        flag=1;
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const Mainpage()));

                      }
                    }
                    catch(e){
                      print(e);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(e.toString()),
                          backgroundColor: Colors.red,
                        ),
                      );
                      // Utils.showSnacker(e.messege);

                    }
                    // try{
                    //   final user= await _auth.signInWithEmailAndPassword(email: email, password: password);
                    //   if(user!=null){
                    //     Navigator.push(context, MaterialPageRoute(builder:(context)=> const ChatScreen()));
                    //   }
                    // }
                    // catch(e){
                    //   print(e);
                    // }

                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child:  const Text(
                    'Sign Up',
                  ),
                ),
              ),
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                socialicon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: (){},
                ),
                socialicon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: (){},
                ),
                socialicon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: (){
                    // final provider =Provider.of<GoogleSignInProvider>(context,listen:false);
                    // provider.googleLogin();
                  },
                ),
            ],
            )
          ],
        ),
      ),
    );
  }
}





