import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/models/size_config.dart';
import 'package:travel_guide/screens/home/profile/ImagePicker.dart';
import 'package:travel_guide/screens/home/profile/homeScreen_profile.dart';
import 'package:travel_guide/screens/home/profile/profile_pic.dart';
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
  String photoUrl = HomeScreenProfile.photoUrl;


  String uploadedPhotoUrl, uId;
  File _image;
  PickedFile pickedFile;
  final _picker = ImagePicker();
  bool hasChange = false;
  Future getImageFromCamera() async {
    pickedFile = await _picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      if (_image != null) {
        url = await getPhotoUrl(_image);
        setState(() {
          uploadedPhotoUrl = url;
          hasChange = true;
        });
      }
    } else {
      print('No image selected.');
    }
  }
  Future getImageFromGallery() async {
    pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      if (_image != null) {
        url = await getPhotoUrl(_image);
        setState(() {
          uploadedPhotoUrl = url;
          hasChange = true;
        });
      }
    } else {
      print('No image selected.');
    }
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              padding: EdgeInsets.only(left: 20.0),
              child: Wrap(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.photo_camera, color: kMainColor),
                    title: Text('Camera'),
                    onTap: () {
                      print("get image from camera");
                      getImageFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                      leading: Icon(
                        Icons.photo_library,
                        color: kMainColor,
                      ),
                      title: Text('Photo Library'),
                      onTap: () {
                        getImageFromGallery();
                        Navigator.of(context).pop();
                      }),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    var space_height = 10.0;
    var profile_size = 180.0;
    print("in edit profile");
    return Container(
      color: white,
      child: SingleChildScrollView(
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

                  name_controller = new TextEditingController(text: HomeScreenProfile.name);
                  email_controller = new TextEditingController(text: HomeScreenProfile.email);
                  Provider.of<StateChanger>(context).changeToEdit(2);
                });
              },
            ),
            ProfilePic(isEdit: true, photoUrl: hasChange? uploadedPhotoUrl:photoUrl,onPressed: () {
              _showPicker(context);
            }),

            // Center(
            //   child: Padding(
            //     padding: const EdgeInsets.all(10.0),
            //     child: SizedBox(
            //       height: profile_size,
            //       width: profile_size,
            //       child: FlatButton(
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(profile_size/2),
            //           side: BorderSide(color: Colors.white),
            //         ),
            //         color: Color(0xFFF5F6F9),
            //         onPressed: () {},
            //         // TODO: Icon not centered.
            //         child: Center(child: Icon(Icons.person, size: profile_size/1.5,),),
            //       )),
            //   ),
            // ),Center(
            //   child: Padding(
            //     padding: const EdgeInsets.all(10.0),
            //     child: SizedBox(
            //       height: profile_size,
            //       width: profile_size,
            //       child: FlatButton(
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(profile_size/2),
            //           side: BorderSide(color: Colors.white),
            //         ),
            //         color: Color(0xFFF5F6F9),
            //         onPressed: () {},
            //         // TODO: Icon not centered.
            //         child: Center(child: Icon(Icons.person, size: profile_size/1.5,),),
            //       )),
            //   ),
            // ),
            FlatButton(
              child: Text("Save",  style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenWidth(20, context), color: kMainColor,
                )
              ),
              onPressed: (){
                print("** userid = ${widget.userId}");
                print("** name = ${name_controller.text}");
                print("** email = ${email_controller.text}");
                print("** imageUrl = ${uploadedPhotoUrl}");
                name = name_controller.text;
                email = email_controller.text;
                // FirebaseAuth.instance.currentUser.updateEmail(email).then((value) => print("print update successful"));
                // _firestore.collection('users').doc(widget.userId).update({
                //   'name' : name,
                //   'email': email,
                //   'image': hasChange? uploadedPhotoUrl:photoUrl
                // }).then((value) => "update successfully #### ");
                setState(() {
                  HomeScreenProfile.name = name;
                  HomeScreenProfile.email = email;
                  HomeScreenProfile.photoUrl= hasChange? uploadedPhotoUrl:photoUrl;
                  Provider.of<StateChanger>(context).changeToEdit(2);
                });

              },
            ),
          ],
          ),
          SizedBox(height: space_height,),
          createTextField(context, name_controller),
          SizedBox(height: space_height,),
          createTextField(context, email_controller)
        ],
        ),
      ),
    );
  }

  Widget createTextField(BuildContext context, var controller){
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(

        enabled: true,
        cursorColor: kMainColor,
        controller: controller,
        style: TextStyle(
          height: getProportionateScreenHeight(2, context),// cursor height
          fontSize: getProportionateScreenWidth(20, context),
          color: ktextColor
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
