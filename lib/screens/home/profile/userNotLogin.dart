import 'package:flutter/material.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/models/fade_animation.dart';
import 'package:travel_guide/models/size_config.dart';
import 'package:travel_guide/screens/Login_SignIn_screen/Sign_up/signup_screen.dart';
import 'package:travel_guide/screens/Login_SignIn_screen/login/login_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class userNotLogin extends StatelessWidget {
  const userNotLogin({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container( height: MediaQuery.of(context).size.height,
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
                          "Welcome!!!",
                          style: TextStyle(
                              color: ktextColor,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(
                        1.2,
                        Text(
                          "You Need to Login First",
                          style: TextStyle(fontSize: 20, color: ktextColor),
                        )),
                    FadeAnimation(
                      1.2,
                       Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SvgPicture.asset(
                          'assets/images/Lovely-Sad.svg', width: 70,color: ktextColor,
                        ),
                      ),
                    ),

                  ],
                ),

                FadeAnimation(
                    1.4,
                    buildButton(context,() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen(isFromProfile: true,)));
                    },"Login")),
                FadeAnimation(
                    1.5,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an account?",style: TextStyle(fontSize: 18,color: ktextColor),),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()));
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),);
  }

  Padding buildButton(BuildContext context,Function onPress,String title) {
    return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      padding: EdgeInsets.only(top: 3, left: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: ktextColor)),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: getProportionateScreenHeight(70, context),
                        onPressed: onPress,
                        color: kMainColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: Text(
                          title,
                          style: TextStyle(
                              color: temp,
                              fontWeight: FontWeight.w600,
                              fontSize: 25),
                        ),
                      ),
                    ),
                  );
  }
}