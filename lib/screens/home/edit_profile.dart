import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/models/size_config.dart';
import 'package:travel_guide/screens/home/homeScreen_profile.dart';
import 'package:travel_guide/screens/list/state_changer.dart';

class EditProfile extends StatefulWidget {
  EditProfile({@required this.userId});
  
  String userId;

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  static var name_controller = new TextEditingController(text: HomeScreenProfile.name);
  static var email_controller = new TextEditingController(text: HomeScreenProfile.email);
  String name, email;
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    var space_height = 10.0;
    var profile_size = 180.0;
    print("in edit profile");
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(height: getProportionateScreenHeight(space_height*3, context),),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          FlatButton(
            child: Text("Cancel", style: TextStyle( color: kMainColor,
              fontSize: getProportionateScreenWidth(20, context)
              ),
            ),
            onPressed: (){
              setState(() {
                Provider.of<StateChanger>(context).changeToEdit(2);
              });
            },
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: profile_size,
                width: profile_size,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(profile_size/2),
                    side: BorderSide(color: Colors.white),
                  ),
                  color: Color(0xFFF5F6F9),
                  onPressed: () {},
                  // TODO: Icon not centered.
                  child: Center(child: Icon(Icons.person, size: profile_size/1.5,),),
                )),
            ),
          ),
          FlatButton(
            child: Text("Save",  style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: getProportionateScreenWidth(20, context), color: kMainColor,
              )
            ),
            onPressed: (){
              print("** userid = ${widget.userId}");
              print("** name = ${name_controller.text}");
              print("** email = ${email_controller.text}");
              name = name_controller.text;
              email = email_controller.text;
              _firestore.collection('users').doc(widget.userId).update({
                'name' : name,
                'email': email,
              }).then((value) => "update successfully #### ");
              setState(() {
                HomeScreenProfile.name = name;
                HomeScreenProfile.email = email;
                Provider.of<StateChanger>(context).changeToEdit(2);
              });
            },
          ),
        ],
        ),
        SizedBox(height: space_height,),
        createTextField(context, HomeScreenProfile.name, name_controller),
        SizedBox(height: space_height,),
        createTextField(context, HomeScreenProfile.email, email_controller)
      ],
      ),
    );
  }

  Widget createTextField(BuildContext context, String content, var controller){
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(

        enabled: true,
        cursorColor: kMainColor,
        controller: controller,
        style: TextStyle(
          height: getProportionateScreenHeight(2, context),// cursor height
          fontSize: getProportionateScreenWidth(20, context),
          color: Colors.black,
        ),

        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kMainColor, width: 2),
          ),
        ),
      ),
    );
  }
}
