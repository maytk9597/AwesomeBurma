import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/models/size_config.dart';

//Mon Mon Tin - Based on which page the widget is used, the camera icon will be appeared.
class ProfilePic extends StatelessWidget {
  final Function onPressed;
  final bool isEdit;
  final String photoUrl;
  ProfilePic({this.isEdit, this.onPressed, this.photoUrl});
  @override
  Widget build(BuildContext context) {
    print(photoUrl.toString());
    return Center(
      child: Hero(
        tag: 'profilePic',
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.withOpacity(0.3),
            //     spreadRadius: 8,
            //     blurRadius: 3,
            //     offset: Offset(0, 3), // changes position of shadow
            //   ),
            // ],
          ),
          child: SizedBox(
            height: getProportionateScreenWidth(150, context), //155
            width: getProportionateScreenWidth(150, context),
            child: isEdit
                ? Stack(
              overflow: Overflow.visible,
              fit: StackFit.expand,
              children: [
                photoUrl == '' ?
                    CircleAvatar(
                      backgroundColor: kSecondaryColour,
                      child: Icon(Icons.person, size: 100, color: kMainColor,),
                    ):
                CircleAvatar(
                  backgroundImage: NetworkImage(photoUrl),

                  // backgroundImage: photoUrl == ''
                  //
                  //     ? AssetImage("assets/images/home_bg.png")
                  //     : NetworkImage(photoUrl),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: SizedBox(
                    height: 46,
                    width: 46,
                    child: FlatButton(

                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          // side: BorderSide(color: Colors.white),

                        ),
                        color: Color(0xFFF5F6F9),
                        onPressed: onPressed,
                        child: Icon(Icons.camera_alt,size: getProportionateScreenWidth(40, context),color: kMainColor,),),
                  ),
                )
              ],
            )
                : photoUrl == '' ? CircleAvatar(
              backgroundColor: kSecondaryColour,
              child: Icon(Icons.person, size: 100, color: kMainColor,),
            ) :
                CircleAvatar(
                  backgroundImage:  NetworkImage(photoUrl),
            ),
          ),
        ),
      ),

    );
  }
}
