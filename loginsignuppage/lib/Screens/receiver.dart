import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginsignuppage/Screens/constants.dart';

class Receiver extends StatelessWidget {
  Receiver({required this.tileName});
  String tileName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xff9370DB),
        title: Text(tileName,
        style: GoogleFonts.merriweather(
fontWeight: FontWeight.w200,

        ),),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            child: StreamBuilder<List<User>>(
              stream: readUsers(name: tileName),
              builder: ((context, snapshot) {
                if (snapshot.hasError) {
                  return Text(
                      'OHH NO!!!\nsomething went wrong${snapshot.error}');
                } else if (snapshot.hasData) {
                  final users = snapshot.data!;
                  return ListView(
                    children: users.map(buildUser).toList(),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
            ),
          ),
        ],
      ),
    );
    ;
  }
}

Widget buildUser(User user) => GestureDetector(
  child: Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
        color: white,
        boxShadow: shadow,
        borderRadius: BorderRadius.circular(20)),
    margin: EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(children: [Icon(Icons.menu_book_outlined),
          Text("  "+user.A,
              style: st)],),SizedBox(height: 5),
        Row(children: [Icon(Icons.person),
          Center(
            child: Text("  "+user.C,
                style: st),),],),SizedBox(height: 5,
        ),
        Row(children: [Icon(Icons.call),
          Center(
            child: Text("  "+user.D,
                style: st)),],),SizedBox(height: 5,
        ),
        Column(

          children: [
            Row(children: [
              Icon(Icons.location_on),
              Wrap(
                // height: 40,

                children: [
                  Text("  "+user.E,
                      style: st)
                ],
              ),
        ]),


      ]
),



      ],
    ),
  ),
  onTap: () {},
);
Stream<List<User>> readUsers({required String name}) =>
    FirebaseFirestore.instance.collection(name).snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

class User {
  late String id;
  final String A, C, D, E;
  User(
      {this.id = '',
        required this.A,
        // required this.B,
        required this.C,
        required this.D,
        required this.E});

  Map<String, dynamic> toJson() => {
    'id': id,
    'Book Name': A,
    'Name': C,
    'Contact Details': D,
    'Address': E,
  };
  static User fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      A: json['Book Name'],
      C: json['Name'],
      D: json['Contact Details'],
      E: json['Address']);
}