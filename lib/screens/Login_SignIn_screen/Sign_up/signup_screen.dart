import 'package:flutter/material.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/models/fade_animation.dart';
import 'package:travel_guide/models/size_config.dart';
import 'package:travel_guide/screens/Login_SignIn_screen/components/makeInputField.dart';
import 'package:travel_guide/screens/Login_SignIn_screen/login/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String name;
  String email;
  String password;
  bool validate;
  void validateAndSave() {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      print('Form is valid');
      validate = true;
    } else {
      print('Form is invalid');
      validate = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            color: ktextColor,
          ),
        ),
      ),
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenHeight(40, context)),
              height: MediaQuery.of(context).size.height - 50,
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  FadeAnimation(
                      1,
                      Text(
                        "Sign up",
                        style: TextStyle(
                            color: ktextColor,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: getProportionateScreenHeight(20, context),
                  ),
                  FadeAnimation(
                      1.2,
                      Text(
                        "Create an account for free",
                        style: TextStyle(fontSize: 17, color: ktextColor),
                      )),
                  Column(
                    children: <Widget>[
                      FadeAnimation(
                          1.2,
                          makeInput(
                            label: "Name",
                            obscureText: false,
                            onChanged: (text) {
                              name = text;
                              // print("Email = " + text);
                            },
                          )),
                      FadeAnimation(
                          1.3,
                          makeInput(
                            label: "Email",
                            obscureText: false,
                            onChanged: (text) {
                              email = text;
                              // print("Email = " + text);
                            },
                          )),
                      FadeAnimation(
                          1.4,
                          makeInput(
                            label: "Password",
                            obscureText: true,
                            onChanged: (text) {
                              password = text;
                              // print("Email = " + text);
                            },
                          )),
                    ],
                  ),
                  FadeAnimation(
                      1.5,
                      Container(
                        padding: EdgeInsets.only(top: 3, left: 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: ktextColor)),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: getProportionateScreenHeight(70, context),
                          onPressed: () {
                            validateAndSave();
                            if (validate == false) {
                              return null;
                            } else {
                              //                             FirebaseUser user = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
                              //    try {
                              //       await user.sendEmailVerification();
                              //       return user.uid;
                              //    } catch (e) {
                              //       print("An error occured while trying to send email        verification");
                              //       print(e.message);
                              //    }
                              //  }
                              print(
                                  "SignIn ------------ > email $email Name $name Password $password");
                            }
                          },
                          color: kMainColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                                color: ktextColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: getProportionateScreenHeight(10, context),
                  ),
                  FadeAnimation(
                      1.5,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                                color: ktextColor,
                                fontSize:
                                    getProportionateScreenWidth(15, context)),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                            child: Text(
                              " Login",
                              style: TextStyle(
                                  color: kMainColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          )),
    );
  }
}
