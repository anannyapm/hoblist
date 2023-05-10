import 'package:assignment/view/screenhome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'login.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    // TODO: implement initState
    checkUserLogin();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            
            child:Text("Welcome",style: TextStyle(fontSize: 50),),
          )),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> gotoLogin() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => ScreenLogin()));
  }

  Future<void> checkUserLogin() async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    final _userLoggedIn = _sharedPrefs.getBool(SAVE_KEY_NAME);
    //if not logged in ie launching app first time - then null
    //if logged out -false
    if (_userLoggedIn == null || _userLoggedIn == false) {
      gotoLogin();
    } else {
      //_userLoggedIn becomes true, so go to home page
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => ScreenHome()));
    }
  }
}
