import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

//Mon Mon Tin - Based on which page the widget is used, the camera icon will be appeared.
class ProfilePic extends StatelessWidget {
  final Function onPressed;
  final bool isEdit;
  final String photoUrl;
  ProfilePic({this.isEdit, this.onPressed, this.photoUrl});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: 'profilePic',
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 8,
                blurRadius: 3,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: SizedBox(
            height: 200, //155
            width: 200,
            child: isEdit
                ? Stack(
              overflow: Overflow.visible,
              fit: StackFit.expand,
              children: [
                CircleAvatar(
                  backgroundImage: photoUrl == ''
                      ? AssetImage("assets/images/Profile_Image.png")
                      : NetworkImage(photoUrl),
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
                          side: BorderSide(color: Colors.white),
                        ),
                        color: Color(0xFFF5F6F9),
                        onPressed: onPressed,
                        child: SvgPicture.asset(
                            "assets/icons/Camera Icon.svg")),
                  ),
                )
              ],
            )
                : CircleAvatar(
              backgroundImage: photoUrl == ''
                  ? AssetImage("assets/images/Profile Image.png")
                  : NetworkImage(photoUrl),
            ),
          ),
        ),
      ),
    );
  }
}
