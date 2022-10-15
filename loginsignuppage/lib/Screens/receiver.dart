import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'constants.dart';

class Receiver extends StatefulWidget {
  const Receiver({Key? key}) : super(key: key);
  @override
  State<Receiver> createState() => _ReceiverState();
}

class _ReceiverState extends State<Receiver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get em here'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned(
            child: StreamBuilder<List<User>>(
              stream: readUsers(),
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
              Text(user.B),
              Text(user.C),
              Text(user.D),
              Text(user.E),
            ],
          ),
        ),
        onTap: () {},
      );
  Stream<List<User>> readUsers() => FirebaseFirestore.instance
      .collection('donated')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
}

class User {
  late String id;
  final String A, B, C, D, E;
  User(
      {this.id = '',
      required this.A,
      required this.B,
      required this.C,
      required this.D,
      required this.E});

  Map<String, dynamic> toJson() => {
        'id': id,
        'Book Name': A,
        'Category': B,
        'Name': C,
        'Contact Details': D,
        'Address': E,
      };
  static User fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      A: json['Book Name'],
      B: json['Category'],
      C: json['Name'],
      D: json['Conatct Details'],
      E: json['Address']);
}
