import 'package:flutter/material.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/screens/Login_SignIn_screen/login/login_screen.dart';
import 'package:travel_guide/screens/Login_SignIn_screen/splash_screen.dart';
import 'package:travel_guide/screens/home/home_screen.dart';

class start_screen extends StatefulWidget {
  const start_screen({Key key}) : super(key: key);

  @override
  _start_screenState createState() => _start_screenState();
}

class _start_screenState extends State<start_screen> {
  //FirebaseFirestore _firestore = FirebaseFirestore.instance;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(
            children: <Widget>[
              Image(
                image: AssetImage("assets/images/BaganStart.jpg"),
                fit: BoxFit.fill,
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
              ),
              Container(
                margin: EdgeInsets.all(50.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        child: KtitleText(
                          title: "Explore Burma",
                          fontSize: 40.0,
                          color: ktextColor,
                        ),
                      ),
                      Container(
                        child: RaisedButton(
                          onPressed: () {
                            // _firestore
                            //     .collection('cities')
                            //     .doc()
                            //     .collection('Attractions')
                            //     .add({
                            //   'name': "",
                            //   'address': "",
                            //   'description': "",
                            //   'recommendation': "",
                            // });
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Splash()));
                          },
                          // color: Color(0xFFC6A6E9),
                          color: kMainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Let's Go",
                              style: TextStyle(
                                  fontSize: 25.0,
                                  color: ktextColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
