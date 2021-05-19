import 'package:flutter/material.dart';
import 'package:travel_guide/screens/home_screen.dart';

class start_screen extends StatefulWidget {
  const start_screen({Key key}) : super(key: key);

  @override
  _start_screenState createState() => _start_screenState();
}

class _start_screenState extends State<start_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Image(
              image: AssetImage("assets/images/StartBagan.png"),
              fit: BoxFit.cover,
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
                      child: Text(
                        'Explore Around Burma...',
                        style: TextStyle(
                          fontFamily: 'Pattaya',
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          // color: Color(0xFF4B4B6F),
                          color: Color(0xFF53292F),
                          // color: Color(0xFFF7682E),
                        ),
                      ),
                    ),
                    Container(
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => home_screen()));
                        },
                        color: Color(0xFFFFBD67).withOpacity(0.6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Get Started ...",
                            style: TextStyle(
                              fontSize: 25.0,
                            ),
                          ),
                        ),
                      ),
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
