import 'package:flutter/material.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginsignuppage/Screens/receiver.dart';
import 'constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

List<BoxShadow> sh = [
  BoxShadow(
      color: Colors.deepPurple[100]!, blurRadius: 15, offset: Offset(0, 15))
];

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

double rad = 40;

class _BookPageState extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepPurple,

        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Text('Categories'
          ,

            style: GoogleFonts.openSans(textStyle: TextStyle(
              fontWeight: FontWeight.w500,
            )),),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              GestureDetector(
                child: bookTile(tileName: novel),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Receiver(tileName: novel)));
                },
              ),
              GestureDetector(
                child: bookTile(tileName: school),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Receiver(tileName: school)));
                },
              ),
              GestureDetector(
                child: bookTile(tileName: competitive),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Receiver(tileName: competitive)));
                },
              ),
              GestureDetector(
                child: bookTile(tileName: history),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Receiver(tileName: history)));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class bookTile extends StatelessWidget {
  bookTile({required this.tileName});
  String tileName = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(15),
      height: 100,
      width: 400,
      decoration: BoxDecoration(

          color: deepPurple,
          boxShadow: sh,

          borderRadius: BorderRadius.circular(rad)),
      child: Center(
        child: Text(
          tileName,
          style: GoogleFonts.robotoSlab(
              textStyle: TextStyle(color: white, fontSize: 35)),
        ),
      ),
    );
  }
}

Widget buildUser(User user) => GestureDetector(
  child: Container(
    height: 100,
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
        color: white,
        boxShadow: shadow,
        borderRadius: BorderRadius.circular(30)),
    margin: EdgeInsets.all(15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(user.A),
        // Text(user.B),
        Text(user.C),
        Text(user.D),
        Text(user.E),
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
    // 'Category': B,
    'Name': C,
    'Contact Details': D,
    'Address': E,
  };
  static User fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      A: json['Book Name'],
      // B: json['Category'],
      C: json['Name'],
      D: json['Contact Details'],
      E: json['Address']);
}