import 'package:flutter/material.dart';
import 'package:travel_guide/Components/textStyle.dart';

AppBar buildAppBar(BuildContext context, {bool isTransparent, String title}) {
  return AppBar(
    backgroundColor: isTransparent ? Colors.transparent : Colors.white,
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.menu,
        color: ktextColor,
      ),
      onPressed: () {},
    ),
    title: !isTransparent
        ? Text(
            isTransparent ? "" : title,
            style: TextStyle(color: ktextColor),
          )
        : null,
    centerTitle: true,
  );
}

// actions: [
//   IconButton(
//     icon: ClipOval(child: Image.asset("assets/images/profile.png")),
//     onPressed: () {},
//   )
// ],
// return AppBar(
//   backgroundColor: Colors.transparent,
//   elevation: 0,
//   leading: Builder(
//     builder: (context) => IconButton(
//       icon: Icon(
//         Icons.menu,
//         color: ktextColor,
//       ),
//       onPressed: () => Scaffold.of(context).openDrawer(),
//     ),
//   ),
// );
