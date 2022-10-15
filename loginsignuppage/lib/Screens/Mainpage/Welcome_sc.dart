import 'package:flutter/material.dart';

class Welcome_sc extends StatelessWidget {
  const Welcome_sc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //provide total height and weidht of screen


    return Container(

    height: size.height,
    width: double.infinity,
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,

    children: <Widget>[

    const Text('Grow Grateful!',

    style: TextStyle(
    color: Colors.deepPurple,
    fontWeight: FontWeight.w500,

    fontSize: 30.0,
    ),
    ),

    Image.asset('assets/images/4851046.jpg'),
    const SizedBox(
    height: 30.0,
    ),
    Padding(padding: EdgeInsets.symmetric(vertical: 10.0),
    child: Material(
    elevation: 10.0,
    color: Colors.deepPurple,
    borderRadius: BorderRadius.circular(15.0),
    child: MaterialButton(
    onPressed: (){
    // Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()),);
    },
    minWidth: 250,
    height: 45.0,
    child: const Text(
     'Donate books',
    style: TextStyle(
    color: Colors.white,
    fontSize: 16.0,
    ),

    ),
    ),
    ),
    ),

    Padding(padding: EdgeInsets.symmetric(vertical: 10.0),
    child: Material(
    elevation: 10.0,
    color: Colors.deepPurple,
    borderRadius: BorderRadius.circular(15.0),
    child: MaterialButton(
    onPressed: (){
    // Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()),);
    },
    minWidth: 250,
    height: 45.0,
    child: const Text(
    'Get  books',
    style: TextStyle(
    color: Colors.white,
    fontSize: 16.0,
    ),

    ),
    ),
    ),
    ),

    ],
    ),

    );
  }
}

