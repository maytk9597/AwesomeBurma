import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/models/fade_animation.dart';
import 'package:travel_guide/models/size_config.dart';
import 'package:travel_guide/screens/Login_SignIn_screen/Sign_up/signup_screen.dart';
import 'package:travel_guide/screens/Login_SignIn_screen/components/makeInputField.dart';
import 'package:travel_guide/screens/Login_SignIn_screen/start_screen.dart';
import 'package:travel_guide/screens/home/home_screen.dart';
import 'package:travel_guide/screens/list/state_changer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    @required this.isFromProfile

  }) ;
  final bool isFromProfile;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String password;

  String email;

  bool validate;

  bool loginFlag;

  final _auth = FirebaseAuth.instance;

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
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: white,
        leading: IconButton(
          onPressed: () {
           if(widget.isFromProfile) {

             Provider.of<StateChanger>(context).changeToEdit(0);
             return Navigator.pushReplacement(
               context,
               MaterialPageRoute(
                   builder: (context) => home_screen()));

           }
           else
             Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: getProportionateScreenWidth(24, context),
            color: ktextColor,
          ),
        ),
         actions: <Widget>[
        RawMaterialButton(
          onPressed: (){
            Provider.of<StateChanger>(context).changeToEdit(0);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => home_screen()));
          },
          child:
          Text('Skip >>',style: TextStyle(color: kMainColor,fontSize: getProportionateScreenWidth(18, context),),),
        )
        ],

      ),
      body: Builder(
        builder:(context)=>  Form(
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
                                    email = text;

                                    // print("Email = " + text);
                                  },
                                )),
                            FadeAnimation(
                                1.3,
                                makeInput(
                                  label: "Password",
                                  obscureText: true,
                                  onChanged: (text) {
                                    password = text;
                                    // print("Password = " + text);
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
                                height: getProportionateScreenHeight(70, context),
                                onPressed: () async{
                                  validateAndSave();
                                  if (validate == false) {
                                    return null;
                                  } else {
                                    try{
                                      final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                                      if(user != null)
                                        {
                                          print("Able to Login");
                                          SharedPreferences prefs = await SharedPreferences.getInstance();
                                          prefs?.setBool("isLoggedIn", true);
                                          Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        home_screen()));

                                          Provider.of<StateChanger>(context).changeToEdit(0);
                                        }
                                    }
                                    catch(e){
                                      showDialog(context: context,
                                      builder: (BuildContext context){
                                        return AlertDialog(title: Text(e.message,style: TextStyle(color: ktextColor),),actions: <Widget>[
                                          RawMaterialButton(
                                            onPressed: (){
                                              Navigator.pop(context);
                                            },
                                            child: Text("try again",style: TextStyle(color: ktextColor,fontSize: getProportionateScreenWidth(13, context)),),


                                          )
                                        ],);
                                      });

                                    }


                                    //      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)
                                    //         .catchError((e) {print("Login Error ========="+e.toString());
                                    //    Scaffold.of(context).showSnackBar(SnackBar( duration: const Duration(seconds: 3),
                                    //      content: Text(e.message.toString(),style: TextStyle(color: Colors.red),),));
                                    //         });
                                    //
                                    //
                                    // if (FirebaseAuth.instance.currentUser != null) {
                                    //   print("Able to Login");
                                    //   print(FirebaseAuth.instance.currentUser.email.toString());
                                    //   // Navigator.pushReplacement(
                                    //   //     context,
                                    //   //     MaterialPageRoute(
                                    //   //         builder: (context) =>
                                    //   //             home_screen()));
                                    // }
                                    //
                                    //
                                    // print(
                                    //     "Login ------------ > email $email Password $password");
                                  }
                                },
                                color: kMainColor,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: temp,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 25),
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
                                      fontWeight: FontWeight.w600, fontSize: 18),
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
