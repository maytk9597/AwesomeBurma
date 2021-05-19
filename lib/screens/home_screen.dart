import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class home_screen extends StatefulWidget {
  const home_screen({Key key}) : super(key: key);

  @override
  _home_screenState createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(builder: (context)=>IconButton(icon: Icon(Icons.menu,color: Colors.black,), onPressed: ()=>Scaffold.of(context).openDrawer(),),),
      ),
      drawer: Drawer(),
      body: ListView(children:<Widget> [
        Padding(padding: EdgeInsets.all(20.0),
        child: Text("Explore around \nBurma",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w600),),),
        
      ],),
    );
  }
}
