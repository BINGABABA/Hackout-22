import 'package:flutter/material.dart';
import 'package:loginsignuppage/Screens/Mainpage/Welcome_sc.dart';

class Mainpage extends StatelessWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        backgroundColor: Colors.white,
        body: Welcome_sc(),

      ),
    );
  }
}
