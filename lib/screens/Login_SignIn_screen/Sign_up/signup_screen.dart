import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/models/fade_animation.dart';
import 'package:travel_guide/models/size_config.dart';
import 'package:travel_guide/screens/Login_SignIn_screen/components/makeInputField.dart';
import 'package:travel_guide/screens/Login_SignIn_screen/login/login_screen.dart';
import 'package:travel_guide/screens/home/home_screen.dart';
import 'package:travel_guide/screens/list/state_changer.dart';

class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String name;
  String email;
  String password;
  String otp;
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
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      // backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: white,
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
      body: Builder(
        builder:(context)=> Form(
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
                        // FadeAnimation(
                        //     1.4,
                        //     Row(
                        //       children: [
                        //         makeInput(
                        //           label: "OTP for email Verification",
                        //           obscureText: true,
                        //           onChanged: (text) {
                        //             otp = text;
                        //             // print("Email = " + text);
                        //           },
                        //         ),
                        //
                        //       ],
                        //     )),
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
                            onPressed: () async {
                              validateAndSave();
                              // var acs = ActionCodeSettings(
                              //   // URL you want to redirect back to. The domain (www.example.com) for this
                              //   // URL must be whitelisted in the Firebase Console.
                              //     url: "https://awesome-burma.firebaseapp.com /finishSignUp",
                              //     handleCodeInApp: true,
                              //     androidPackageName: "com.example.travel_guide",
                              //     androidInstallApp: true,
                              //     androidMinimumVersion: "12");
                              if (validate == false) {
                                return null;
                              } else {
                                try {
                                  final new_user = await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                          email: email, password: password);
                                  print("New User uid ===========" +new_user.user.uid);


                                  if (new_user!=null) {
                                    // new_user.user.sendEmailVerification(acs
                                    //
                                    // );


                                    new_user.user.sendEmailVerification();
                                     _firestore
                                        .collection('users')
                                        .doc(new_user.user.uid)
                                        .set({
                                      'name': name,
                                      'email': email,
                                      'uid': new_user.user.uid,
                                       // 'image':"https://firebasestorage.googleapis.com/v0/b/awesome-burma.appspot.com/o/user_galary%2FProfile_Image_PNG.png?alt=media&token=3c874677-ba57-49b4-beaa-5acdf9cf38da"
                                       'image': ""

                                    }).whenComplete(() => print('Updated user.'))
                                         .catchError((e) => print(e));

                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => home_screen()));
                                    Provider.of<StateChanger>(context).changeToEdit(0);
                                  }
                                } catch (e) {
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
                                  // Scaffold.of(context).showSnackBar(SnackBar( duration: const Duration(seconds: 3),
                                  //   content: Text(e.message.toString(),style: TextStyle(color: Colors.red),),));
                                  print("Error++++++++++++"+e.toString());
                                }
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
      ),
    );
  }
}
