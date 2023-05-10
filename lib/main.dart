import 'package:assignment/models/user.dart';
import 'package:assignment/view/signup.dart';
import 'package:assignment/view/splash.dart';
import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';

const SAVE_KEY_NAME = 'UserLoggedIn';

void main() async {

  //the WidgetFlutterBinding is used to interact with the Flutter engine.
  //ensureInitialized() make sure that you have an instance of the WidgetsBinding so that the call to
  // initialize plugin via engine happens asynchronously.
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(UserModelAdapter().typeId)) {
    Hive.registerAdapter(UserModelAdapter());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
        title: 'Student App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          fontFamily: 'Raleway',
          
        ),
        home: const ScreenSplash());
  }
}
