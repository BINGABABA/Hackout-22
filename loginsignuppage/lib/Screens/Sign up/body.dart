import 'package:flutter/material.dart';
import 'package:loginsignuppage/Screens/Sign up/background.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginsignuppage/Screens/Mainpage/main_page.dart';

import 'package:loginsignuppage/Screens/Utils.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}


class _BodyState extends State<Body> {
  final _auth=FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Background(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // const Text(
          //   'LOGIN',
          //   style: TextStyle(
          //     fontWeight: FontWeight.bold,
          //     fontSize: 80.0,
          //   ),
          // ),
          Image.asset('assets/images/43122.jpg',
            width: 310,
            height: 280,

          ),
          const SizedBox(
            height: 30.00,
          ),
          SizedBox(
            width: 350,

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
            width: 350,

            child: TextField(

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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Mainpage()));

                    }
                  }
                  catch(e){
                    print(e);
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

        ],
      ),
    );
  }
}


