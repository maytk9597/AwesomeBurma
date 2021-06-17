import 'package:flutter/material.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/models/fade_animation.dart';
import 'package:travel_guide/models/size_config.dart';
import 'package:travel_guide/screens/Login_SignIn_screen/components/makeInputField.dart';
import 'package:travel_guide/screens/Login_SignIn_screen/start_screen.dart';
import 'package:travel_guide/screens/home/home_screen.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email;
  String _password;

  void validateAndSave() {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      print('Form is valid');
    } else {
      print('Form is invalid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: getProportionateScreenWidth(24, context),
            color: Colors.black,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        FadeAnimation(
                            1,
                            Text(
                              "Login",
                              style: TextStyle(
                                  color: ktextColor,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                            1.2,
                            Text(
                              "Login to your account",
                              style: TextStyle(fontSize: 15, color: ktextColor),
                            )),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: <Widget>[
                          FadeAnimation(
                              1.2,
                              makeInput(
                                label: "Email",
                                obscureText: false,
                                onChanged: (text) {
                                  print("Email = " + text);
                                },
                              )),
                          FadeAnimation(
                              1.3,
                              makeInput(
                                label: "Password",
                                obscureText: true,
                                onChanged: (text) {
                                  print("Password = " + text);
                                },
                              )),
                        ],
                      ),
                    ),
                    FadeAnimation(
                        1.4,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: Container(
                            padding: EdgeInsets.only(top: 3, left: 3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color: ktextColor)),
                            child: MaterialButton(
                              minWidth: double.infinity,
                              height: 60,
                              onPressed: () {
                                validateAndSave();
                              },
                              color: kMainColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: ktextColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        )),
                    FadeAnimation(
                        1.5,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Don't have an account?"),
                            Text(
                              "Sign up",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
              // FadeAnimation(
              //     1.2,
              //     Container(
              //       height: MediaQuery.of(context).size.height / 3,
              //       decoration: BoxDecoration(
              //           image: DecorationImage(
              //               image: AssetImage('assets/background.png'),
              //               fit: BoxFit.cover)),
              //     ))
            ],
          ),
        ),
      ),
      // body: new Center(
      //   child: Column(
      //     children: [
      //       new Text('This is the Login Screen'),
      //       FlatButton(
      //           onPressed: () {
      //             Navigator.of(context).pushReplacement(new MaterialPageRoute(
      //                 builder: (context) => new home_screen()));
      //           },
      //           child: Text("To Home Screen"))
      //     ],
      //   ),
      // ),
    );
  }
}
