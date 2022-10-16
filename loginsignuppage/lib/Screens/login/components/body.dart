import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loginsignuppage/Screens/login/components/background.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginsignuppage/Screens/Mainpage/main_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Body extends StatefulWidget {

  @override
  State<Body> createState() => _BodyState();
}


int check = 0;
int f() {
  return check;
}

class _BodyState extends State<Body> {
  final _auth = FirebaseAuth.instance;
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  var errorMessage;
  // late String email;
  // late String password;
  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Scaffold(
        // appBar: AppBar(title: Text("Home"),),
        body: Stack(
          children:[
            Positioned(
              top: 0,
              left: 0,
              child:Image.asset("assets/images/main_top.png",width: size.width *0.33,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset("assets/images/login_bottom.png",
                width: size.width*0.4,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // const Text(
                //   'LOGIN',
                //   style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //     fontSize: 80.0,
                //   ),
                // ),

                Center(
                  child: Image.asset(
                    'assets/images/43122.png',
                    width: size.width * 0.88,
                    height: size.height * 0.3,
                  ),
                ),
                const SizedBox(
                  height: 15.00,
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: emailcontroller,

                    // onChanged:(value){
                    //   email=value;
                    // },

                    style: const TextStyle(
                      color: Colors.black45,
                    ),

                    decoration: const InputDecoration(
                      hoverColor: Colors.deepPurple,
                      fillColor: Color(0xffe6e6fa),
                      filled: true,
                      labelText: 'Enter your email',
                      labelStyle: TextStyle(),
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
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
                    controller: passwordcontroller,
                    //
                    // onChanged: (value){
                    //   password=value;
                    // },

                    style: const TextStyle(
                      color: Colors.black45,
                    ),

                    decoration: const InputDecoration(
                      hoverColor: Colors.deepPurple,
                      fillColor: Color(0xffe6e6fa),
                      filled: true,
                      labelText: 'Enter your Password',
                      labelStyle: TextStyle(),
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
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
                          final user = await _auth.signInWithEmailAndPassword(
                              email: emailcontroller.text,
                              password: passwordcontroller.text);
                          if (user != null) {
                            check = 1;
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Mainpage()));
                          }
                        } on FirebaseAuthException catch (error) {
                          print(error);
                          // setState(() {
                          //   var errorMessage=error.toString();
                          // });
                          // // print(errorMessage);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(error.toString()),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: const Text(
                        'Log In',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]
        ),
      ),
    );
  }
}
