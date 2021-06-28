
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/models/size_config.dart';
import 'package:travel_guide/screens/list/state_changer.dart';
import 'package:flutter_switch/flutter_switch.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:translator/translator.dart';

class HomeScreenProfile extends StatefulWidget {
  HomeScreenProfile({Key key,@required this.isLogin,@required this.userId, this.user_name, this.user_email}) : super(key: key);

  final bool isLogin;
  final String userId;
  final String user_name; final String user_email;
  static String name; static String email= ""; static var user_info;
  static String result = "";
  //static bool switchControl;

  @override
  _HomeScreenProfileState createState() => _HomeScreenProfileState();

  static void getData(String userId) async{
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    HomeScreenProfile.user_info =  await _firestore.collection('users').doc(userId).get();
    HomeScreenProfile.name = HomeScreenProfile.user_info.data()['name'];
    HomeScreenProfile.email = HomeScreenProfile.user_info.data()['email'];
    print("name = ${HomeScreenProfile.name}");
    print("email = ${HomeScreenProfile.email}");
  }
}

class _HomeScreenProfileState extends State<HomeScreenProfile> {


  //var switchControl = Provider.of<StateChanger>(context).dark;
  var _translator = new GoogleTranslator();
  var translation;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   setState(() {
  //     translation = _translator.translate("hello", from: 'en', to: 'es');
  //   });
  //   print("Init state = $translation");
  // }

  @override
  Widget build(BuildContext context){
    print("The translator is active &&&&&&&&&&&&&&&&&&&&&");
    _translator.translate("I love Brazil!", from: 'en', to: 'pt').then((s) {
      print(s);
    });
    translation = _translator.translate("hello", from: 'English', to: 'French');
    print("After translation = ${translation.text}");
    //_translator.translateAndPrint("wait", to: 'es');
    //_translator.translate("hello", from: 'en', to: 'es').toString().then(print);
    // print('${translation.source} (${translation.sourceLanguage}) == ${translation.text} (${translation.targetLanguage})');
    var space_height = 10.0;
    print("inside user Profile++++++++++++");
    print(" Login "+ widget.isLogin.toString());
    print(" user id "+widget.userId);
    getTranslation("hello");
    return Container(
      color: Colors.grey.withOpacity(0.3),
      child: Column(
        children: [
          Container(
            color: white,
            child: Column(
              children: [

                SizedBox(height: getProportionateScreenHeight(space_height*2, context),),
                Center(
                  child: SizedBox(
                    height: 120,
                    width: 120,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                        side: BorderSide(color: Colors.white),
                      ),
                      color: Color(0xFFF5F6F9),
                      onPressed: () {},
                      // TODO: Icon not centered.
                      child: Center(child: Icon(Icons.person, size: 70,),),
                    )),
                ), // photo avater
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
                        child: Text(HomeScreenProfile.result, style: TextStyle(fontSize: getProportionateScreenWidth(20, context)),),
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

  Future translate(String text) async{
   HomeScreenProfile.result = await _translator.translate(text,  to: 'es').toString();
  }

  String getTranslation(String text){
    translate(text);
  }

  Widget darkMode(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        color: white,

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
        white = darkWhite;
      });
      print('Switch is ON');


    }
    else
    {
      setState(() {
        //switchControl = false;
        Provider.of<StateChanger>(context).changeDarkMode(false);
        ktextColor = temp;
        white = Colors.white;
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
