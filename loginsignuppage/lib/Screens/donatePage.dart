
import 'constants.dart';

import 'receiver.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'myButton.dart';
import 'books.dart';


class DonatePage extends StatefulWidget {
  const DonatePage({super.key});

  @override
  State<DonatePage> createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  String Category = 'Novel';
  Color fal = deepPurple, tru = lightPurple;
  bool c1 = false, c2 = false, c3 = false, c4 = false;
  final nameController = TextEditingController();
  final categoryController = TextEditingController();
  final Person = TextEditingController();
  final Contact = TextEditingController();
  final Address = TextEditingController();
  late var bookName = "";
  late var categ = "";
  late var name = "";
  late var contact = "";
  late var address = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepPurple,
        leading:
        IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new)),
        title: Text('Donate now',
            style: GoogleFonts.openSans(textStyle: TextStyle(
            fontWeight: FontWeight.w500,
        )),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                createUser(a: bookName, c: name, d: contact, e: address);
                Navigator.pop(context);
                // Navigator.pop(context);
              },
              icon: Icon(Icons.check))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Align(

                      child: Text(
                        'Book Details',
                        style: GoogleFonts.merriweather(
                          textStyle: TextStyle(color: deepPurple),
                          fontWeight: FontWeight.w400,

                        ).copyWith(fontSize: 20),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Align(
                      child: SizedBox(
                        width: 150,
                        child: Divider(
                          color: deepPurple,
                          thickness: 1.5,
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            // hintText: 'Name of the book',
                            hoverColor: Colors.deepPurple,
                            fillColor: Color(0xffe6e6fa),

                            filled: true,
                            labelText: 'Name of the book',
                            labelStyle: TextStyle(

                            ),


                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            border: OutlineInputBorder(

                              borderRadius: BorderRadius.all(Radius.circular(15.0)),

                            ),

                          ),
                          onChanged: (val) {
                            bookName = nameController.text;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Wrap(
                          children: [
                            GestureDetector(
                              child: myButton(
                                col: (c1) ? tru : fal,
                                txt: 'Novel',
                              ),
                              onTap: () {
                                setState(() {
                                  c1 = true;
                                  c2 = false;
                                  c3 = false;
                                  c4 = false;
                                  Category = 'Novel';
                                });
                              },
                            ),
                            GestureDetector(
                              child: myButton(
                                col: (c2) ? tru : fal,
                                txt: 'School',
                              ),
                              onTap: () {
                                setState(() {
                                  print(c1);
                                  c1 = false;
                                  c2 = true;
                                  c3 = false;
                                  c4 = false;
                                  Category = 'School';
                                });
                              },
                            ),
                            GestureDetector(
                              child: myButton(
                                col: (c3) ? tru : fal,
                                txt: 'Competitive',
                              ),
                              onTap: () {
                                setState(() {
                                  c1 = false;
                                  c2 = false;
                                  c3 = true;
                                  c4 = false;
                                  Category = 'Competitive';
                                });
                              },
                            ),
                            GestureDetector(
                              child: myButton(
                                col: (c4) ? tru : fal,
                                txt: 'History',
                              ),
                              onTap: () {
                                setState(() {
                                  c1 = false;
                                  c2 = false;
                                  c3 = false;
                                  c4 = true;
                                  Category = 'History';
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    child: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Personal Details',
                        style: GoogleFonts.merriweather(
                          textStyle: TextStyle(color: deepPurple),
                          fontWeight: FontWeight.w400,
                        ).copyWith(fontSize: 20),
                      ),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Align(
                      child: SizedBox(
                        width: 190,
                        child: Divider(
                          color: deepPurple,
                          thickness: 1.5,
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: Person,
                          decoration: const InputDecoration(
                            // hintText: 'Name of the book',
                            hoverColor: Colors.deepPurple,
                            fillColor: Color(0xffe6e6fa),

                            filled: true,
                            labelText: 'Name',
                            labelStyle: TextStyle(

                            ),


                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            border: OutlineInputBorder(

                              borderRadius: BorderRadius.all(Radius.circular(15.0)),

                            ),

                          ),
                          onChanged: (val) {
                            name = Person.text;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: Contact,
                          decoration: const InputDecoration(
                            // hintText: 'Name of the book',
                            hoverColor: Colors.deepPurple,
                            fillColor: Color(0xffe6e6fa),

                            filled: true,
                            labelText: 'Mobile No.',
                            labelStyle: TextStyle(

                            ),


                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            border: OutlineInputBorder(

                              borderRadius: BorderRadius.all(Radius.circular(15.0)),

                            ),

                          ),
                          onChanged: (val) {
                            contact = Contact.text;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: Address,
                          decoration: const InputDecoration(
                            // hintText: 'Name of the book',
                            hoverColor: Colors.deepPurple,
                            fillColor: Color(0xffe6e6fa),

                            filled: true,
                            labelText: 'Address',
                            labelStyle: TextStyle(

                            ),


                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            border: OutlineInputBorder(

                              borderRadius: BorderRadius.all(Radius.circular(15.0)),

                            ),

                          ),
                          onChanged: (val) {
                            address = Address.text;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Stream<List<User>> readUsers() => FirebaseFirestore.instance
      .collection(Category)
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

  Future createUser({
    required String a,
    required String c,
    required String d,
    required String e,
  }) async {
    final docUser = FirebaseFirestore.instance.collection(Category).doc();
    final user = User(
      id: docUser.id,
      A: a,
      C: c,
      D: d,
      E: e,
    );
    final json = user.toJson();
    await docUser.set(json);
  }
}

class User {
  late String id;
  final String A, C, D, E;
  User(
      {this.id = '',
        required this.A,
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
// class DonatePage extends StatefulWidget {
//   const DonatePage({super.key});
//
//   @override
//   State<DonatePage> createState() => _DonatePageState();
// }
//
// class _DonatePageState extends State<DonatePage> {
//   final nameController = TextEditingController();
//   final categoryController = TextEditingController();
//   final Person = TextEditingController();
//   final Contact = TextEditingController();
//   final Address = TextEditingController();
//   late var bookName = "";
//   late var categ = "";
//   late var name = "";
//   late var contact = "";
//   late var address = "";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.purple[200],
//         leading:
//         IconButton(onPressed: () {
//           Navigator.pop(context);
//         }, icon: Icon(Icons.arrow_back_ios_new)
//         ),
//         title: Text('Donate now'),
//         centerTitle: true,
//         actions: [
//           IconButton(
//               onPressed: () {
//                 createUser(
//                     a: bookName, b: categ, c: name, d: contact, e: address);
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => Receiver()));
//                 // Navigator.pop(context);
//               },
//               icon: Icon(Icons.check))
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               padding: EdgeInsets.only(left: 20, right: 20, top: 35),
//               child: Expanded(
//                 child: Column(
//                   children: [
//                     Align(
//                       child: Text(
//                         'Book Details',
//                         style: GoogleFonts.montserrat(
//                           textStyle: TextStyle(color: deepPurple),
//                           fontWeight: FontWeight.w500,
//                         ).copyWith(fontSize: 30),
//                       ),
//                       alignment: Alignment.centerLeft,
//                     ),
//                     Align(
//                       child: SizedBox(
//                         width: 180,
//                         child: Divider(
//                           color: deepPurple,
//                           thickness: 1.5,
//                         ),
//                       ),
//                       alignment: Alignment.centerLeft,
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(left: 15),
//                       child: Column(
//                         children: [
//                           SizedBox(
//                             height: 10,
//                           ),
//                           TextField(
//                             controller: nameController,
//                             decoration: InputDecoration(
//                                 border: OutlineInputBorder(),
//                                 hintText: 'Name of the Book'),
//                             onChanged: (val) {
//                               bookName = nameController.text;
//                             },
//                           ),
//                           SizedBox(
//                             height: 15,
//                           ),
//                           TextField(
//                             controller: categoryController,
//                             decoration: InputDecoration(
//                                 border: OutlineInputBorder(),
//                                 hintText: 'Category'),
//                             onChanged: (val) {
//                               categ = categoryController.text;
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 flex: 2,
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(
//                 vertical: 10,
//                 horizontal: 20,
//               ),
//               child: Expanded(
//                 child: Column(
//                   children: [
//                     Align(
//                       child: Text(
//                         'Personal Details',
//                         style: GoogleFonts.montserrat(
//                           textStyle: TextStyle(color: deepPurple),
//                           fontWeight: FontWeight.w500,
//                         ).copyWith(fontSize: 30),
//                       ),
//                       alignment: Alignment.centerLeft,
//                     ),
//                     Align(
//                       child: SizedBox(
//                         width: 230,
//                         child: Divider(
//                           color: deepPurple,
//                           thickness: 1.5,
//                         ),
//                       ),
//                       alignment: Alignment.centerLeft,
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(left: 15),
//                       child: Column(
//                         children: [
//                           SizedBox(
//                             height: 10,
//                           ),
//                           TextField(
//                             controller: Person,
//                             decoration: InputDecoration(
//                                 border: OutlineInputBorder(), hintText: 'Name'),
//                             onChanged: (val) {
//                               name = Person.text;
//                             },
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           TextField(
//                             controller: Contact,
//                             decoration: InputDecoration(
//                                 border: OutlineInputBorder(),
//                                 hintText: 'Contact Details'),
//                             onChanged: (val) {
//                               bookName = Contact.text;
//                             },
//                           ),
//                           SizedBox(
//                             height: 15,
//                           ),
//                           TextField(
//                             controller: Address,
//                             decoration: InputDecoration(
//                                 border: OutlineInputBorder(),
//                                 hintText: 'Address'),
//                             onChanged: (val) {
//                               address = Address.text;
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 flex: 3,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Stream<List<User>> readUsers() => FirebaseFirestore.instance
//       .collection('donated')
//       .snapshots()
//       .map((snapshot) =>
//       snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
//
//   Future createUser({
//     required String a,
//     required String b,
//     required String c,
//     required String d,
//     required String e,
//   }) async {
//     final docUser = FirebaseFirestore.instance.collection('donated').doc();
//     final user = User(
//       id: docUser.id,
//       A: a,
//       B: b,
//       C: c,
//       D: d,
//       E: e,
//     );
//     final json = user.toJson();
//     await docUser.set(json);
//   }
// }
//
// class User {
//   late String id;
//   final String A, B, C, D, E;
//   User(
//       {this.id = '',
//         required this.A,
//         required this.B,
//         required this.C,
//         required this.D,
//         required this.E});
//   Map<String, dynamic> toJson() => {
//     'id': id,
//     'Book Name': A,
//     'Category': B,
//     'Name': C,
//     'Contact Details': D,
//     'Address': E,
//   };
//   static User fromJson(Map<String, dynamic> json) => User(
//       id: json['id'],
//       A: json['Book Name'],
//       B: json['Category'],
//       C: json['Name'],
//       D: json['Contact Details'],
//       E: json['Address']);
// }