
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/models/size_config.dart';
import 'package:travel_guide/screens/home/profile/profile_pic.dart';
import 'package:travel_guide/screens/list/state_changer.dart';
import 'package:flutter_switch/flutter_switch.dart';

class HomeScreenProfile extends StatefulWidget {
  const HomeScreenProfile({Key key,@required this.isLogin,@required this.userId, this.user_name, this.user_email}) : super(key: key);

  final bool isLogin;
  final String userId;
  final String user_name; final String user_email;
  static String name; static String email= ""; static var user_info; static String photoUrl;
  //static bool switchControl;


  @override
  _HomeScreenProfileState createState() => _HomeScreenProfileState();

  static void getData(String userId) async{
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    HomeScreenProfile.user_info =  await _firestore.collection('users').doc(userId).get();
    HomeScreenProfile.name = HomeScreenProfile.user_info.data()['name'];
    HomeScreenProfile.photoUrl = HomeScreenProfile.user_info.data()['image'];
    HomeScreenProfile.email = HomeScreenProfile.user_info.data()['email'];
    print("name = ${HomeScreenProfile.name}");
    print("email = ${HomeScreenProfile.email}");
  }
}

class _HomeScreenProfileState extends State<HomeScreenProfile> {

  //var switchControl = Provider.of<StateChanger>(context).dark;

  @override
  Widget build(BuildContext context){
    var space_height = 10.0;
    print("inside user Profile++++++++++++");
    print(" Login "+widget.isLogin.toString());
    print(" user id "+widget.userId.toString());
    // return Container(
    //   child: RawMaterialButton(
    //     onPressed: ()async{
    //       FirebaseAuth.instance.signOut();
    //       SharedPreferences prefs = await SharedPreferences.getInstance();
    //       prefs?.setBool("isLoggedIn", false);
    //       Navigator.pushReplacement(context, MaterialPageRoute(
    //           builder: (context) => LoginScreen()));
    //     },
    //     child: Text('Sign Out',),
    //   ),
    // );
    print(" user id "+widget.userId);
    return Container(
      //color: Colors.grey.withOpacity(0.3),
      child: Column(
        children: [
          Container(
            //color: Colors.white,
            child: Column(
              children: [

                SizedBox(height: getProportionateScreenHeight(space_height*2, context),),
                ProfilePic(isEdit: false,photoUrl: HomeScreenProfile.photoUrl),
                // Center(
                //   child: SizedBox(
                //     height: 120,
                //     width: 120,
                //     child: FlatButton(
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(60),
                //         side: BorderSide(color: Colors.white),
                //       ),
                //       color: Color(0xFFF5F6F9),
                //       onPressed: () {},
                //       // TODO: Icon not centered.
                //       child: Center(child: Icon(Icons.person, size: 70,),),
                //     )),
                // ), // photo avater
                SizedBox(height: space_height,),
                Text(HomeScreenProfile.name, style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(22, context)),),
                SizedBox(height: getProportionateScreenHeight(space_height*0.5, context),),
                Text(HomeScreenProfile.email, style: TextStyle(fontSize: getProportionateScreenWidth(18, context)),),

                SizedBox(height: getProportionateScreenHeight(space_height*2, context),),

                // edit profile button
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Container(
                    child: RaisedButton(
                      onPressed: (){
                        setState(() {
                          Provider.of<StateChanger>(context).changeToEdit(3);
                        });

                      },
                      color: kMainColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Edit Profile", style: TextStyle(fontSize: getProportionateScreenWidth(20, context)),),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
          SizedBox( height: getProportionateScreenHeight(space_height*3, context), ),
          darkMode(context),

          SizedBox ( height: 0, width: getProportionateScreenWidth(300, context),
            child: Divider(
              color: Colors.grey.withOpacity(0.5), thickness: 1,),

          ),
        ],
      ),
    );
  }

  Widget darkMode(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        //color: Colors.white,

        border: Border(
          bottom: BorderSide(width: 1.0,  color: Colors.white),
        ),
      ),
      //color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text("Dark Mode", style: TextStyle(
            fontSize: getProportionateScreenWidth(18, context)
          ),),
        ),
          createSwitch(context),

      ],),
    );

  }
  void toggleSwitch(bool value) {

    if(Provider.of<StateChanger>(context).dark == false)
    {
      setState(() {
        //switchControl = true;
        Provider.of<StateChanger>(context).changeDarkMode(true);
        ktextColor = kMainColor;
      });
      print('Switch is ON');


    }
    else
    {
      setState(() {
        //switchControl = false;
        Provider.of<StateChanger>(context).changeDarkMode(false);
        ktextColor = temp;
      });
      print('Switch is OFF');
      // Put your code here which you want to execute on Switch OFF event.
    }
  }

  Widget createSwitch(BuildContext context){
    var switchHeight = 30.0;
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: FlutterSwitch(
        height: getProportionateScreenHeight(switchHeight, context),
        width: getProportionateScreenWidth(50, context),
        padding: 4.0,
        toggleSize: 20.0,
        borderRadius: switchHeight/2,
        activeColor: kMainColor,
        value: Provider.of<StateChanger>(context).dark,
        onToggle: toggleSwitch,

      ),

    );
  }
}
