import 'package:flutter/material.dart';
import 'package:loginsignuppage/Screens/books.dart';
import 'package:loginsignuppage/Screens/donatePage.dart';
import 'package:loginsignuppage/Screens/books.dart';


class Welcome_sc extends StatelessWidget {
  const Welcome_sc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size =
        MediaQuery
            .of(context)
            .size; //provide total height and weight of screen

    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: (Image.asset(
              "assets/images/main_top.png",
              width: size.width * 0.3,
            )),
          ),
          Positioned(

            bottom: 0.0,
            right: 0.0,

              child: Image.asset(
                "assets/images/login_bottom.png",
                width: size.width * 0.3,
              ),
            ),

          // Positioned(
          //   top: 0,
          //   right: 0,
          //
          //   child: (Image.asset(
          //     "assets/images/main_bottom.png",
          //     width: size.width * 0.3,
          //   )),
          // ),

          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   child: (Image.asset(
          //     "assets/images/main_bottom.png",
          //     width: size.width * 0.3,
          //   )),
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/4851046.jpg'),
              const SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Material(
                  elevation: 10.0,
                  color: Colors.purple[300],
                  borderRadius: BorderRadius.circular(15.0),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const DonatePage()),);
                    },
                    minWidth: 250,
                    height: 45.0,
                    child: const Text(
                      'Donate Books',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Material(
                  elevation: 10.0,
                  color: Colors.purple[300],

                  borderRadius: BorderRadius.circular(15.0),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BookPage()));
                    },
                    minWidth: 250,
                    height: 45.0,
                    child: const Text(
                      'Get Books',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}