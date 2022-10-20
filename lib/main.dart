import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/config.dart';
import 'data/db.dart';
import 'screens/screens.dart';
 

  void main()  {
    // WidgetsFlutterBinding.ensureInitialized();
   
    runApp(MaterialApp(
      title: "E-Pharma",
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.lightTheme(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("mon appbar"),
        ),
        body: 
          Container(
            child: Text(   "jgjgchjgvv "          
          ),
      )
      // SplashScreen(userIsconnected: pref.getString('grade')),
    )));
  }

  // void main() async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   await initDatabase();
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   runApp(MaterialApp(
  //     title: "E-Pharma",
  //     debugShowCheckedModeBanner: false,
  //     theme: ThemeApp.lightTheme(),
  //     home: SplashScreen(userIsconnected: pref.getString('grade')),
  //   ));
  // }



